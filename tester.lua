--- Groundhog tester
--- @version 1.0
--- @author Pablo ZAPATA <pablo.zapata@epitech.eu>

--- @module Tester
local Tester <const> = {}
local Config <const> = require("test/config")
local Json <const> = require("test/json")

local Colours <const> = {
    RED = "\27[31m",
    BLUE = "\27[34m",
    RESET = "\27[0m",
    WHITE = "\27[37m",
    YELLOW = "\27[33m",
    GREEN = "\27[32m"
}

--- @param message string
--- @return void
function Tester.Log(message)
    print(("\27[31m[Tester] \27[0m%s\27[0m"):format(message))
end

--- @param message string
--- @return void
function Tester.LogUpdate(message)
    io.write(("\r\27[31m[Tester] \27[0m%s\27[0m"):format(message))
    io.flush()
end

--- Read the latest log line (or more) from the log file
--- @param logFilePath string
--- @param linesFromBottom number?
--- @return string
function Tester.GetLastLog(logFilePath, linesFromBottom)
    local lastLog = ""
    local logFile <const> = io.open(logFilePath, "r")

    if not linesFromBottom then
        for line in logFile:lines() do
            lastLog = line
        end
    else
        local lines = {}
        for line in logFile:lines() do
            lines[#lines + 1] = line
        end
        for i = 1, #lines do
            local remainingLines <const> = #lines - i
            if remainingLines < linesFromBottom then
                lastLog = lastLog .. lines[i]
                if i ~= #lines then
                    lastLog = lastLog .. "\n"
                end
            end
        end
    end
    logFile:close()
    return lastLog
end

--- Get all the logs from a log file
--- @param logFilePath string
--- @return string
function Tester.GetLog(logFilePath)
    local content = ""
    local logFile <const> = io.open(logFilePath, "r")
    content = logFile:read("*a")
    logFile:close()
    return content
end

--- @param testCfg table
--- @return void
function Tester.MakeTest(testId, testCfg)
    local failedTests = {}
    local passedValues = 0
    local logFilePath <const> =(Config.LogFile):format(testId)
    local handle <const> = io.popen(("%s %s > %s"):format(Config.BinaryPath, table.unpack(testCfg.args), logFilePath), "w")

    if testCfg.inputs then
        for index, valueTestCfg in ipairs(testCfg.inputs) do
            Tester.LogUpdate(("\tTesting (%s/%s): %s%s"):format(index, #testCfg.inputs, Colours.YELLOW, valueTestCfg.input))
            handle:write(tostring(valueTestCfg.input) .. "\n")
            handle:flush()
            os.execute("sleep 0.05")

            if valueTestCfg.expected then
                local log = Tester.GetLastLog(logFilePath, valueTestCfg.linesFromBottom)
                if log == valueTestCfg.expected then
                    passedValues = passedValues + 1
                else
                    failedTests[#failedTests + 1] = valueTestCfg.input
                end
            else
                passedValues = passedValues + 1
            end
        end
        io.flush()
        Tester.LogUpdate(("\tTesting: %sALL TESTS EXECUTED"):format(Colours.YELLOW))
        os.execute("sleep 0.25")
        io.write("\n")
        Tester.Log(("\tTest summary: %s%s PASSED %s| %s%s FAILED"):format(Colours.GREEN, passedValues, Colours.RESET, Colours.RED, (#testCfg.inputs - passedValues)))

        if #failedTests > 0 then
            Tester.Log(("\tFailed at: %s%s"):format(Colours.RED, Json.encode(failedTests)))
        end

        local programStatus <const> = {handle:close()}
        local isCodeGood <const> = programStatus[3] == testCfg.expected.code
        Tester.Log((("\tExit code: %s"):format(isCodeGood and ("%s%s"):format(Colours.GREEN, "PASSED") or ("%s%s"):format(Colours.RED, "FAILED"))))
    else
        local output <const> = Tester.GetLog(logFilePath)
        local programStatus <const> = {handle:close()}

        if testCfg.expected.output then
            local isOutputGood <const> = output == testCfg.expected.output
            Tester.Log((("\tOutput: %s"):format(isOutputGood and ("%s%s"):format(Colours.GREEN, "PASSED") or ("%s%s"):format(Colours.RED, "FAILED"))))
        end
        local isCodeGood <const> = programStatus[3] == testCfg.expected.code
        Tester.Log((("\tExit code: %s"):format(isCodeGood and ("%s%s"):format(Colours.GREEN, "PASSED") or ("%s%s"):format(Colours.RED, "FAILED"))))
    end

    Tester.Log(("\tLog file: %s%s"):format(Colours.BLUE, logFilePath))
end

function Tester.Main()
    Tester.Log("Starting groundhog testing program...")
    Tester.Log("")
    Tester.Log("Generating log files...")

    for testId, _ in ipairs(Config.Tests) do
        local logFilePath <const> =(Config.LogFile):format(testId)
        os.execute(("touch %s"):format(logFilePath))
        os.execute("sleep 0.15")
    end

    Tester.Log("Launching tests..")

    for testId, testCfg in ipairs(Config.Tests) do
        Tester.Log(("Now testing: %s%s%s (%s#%s%s)"):format(Colours.YELLOW, testCfg.label, Colours.RESET, Colours.YELLOW, testId, Colours.RESET))
        os.execute("sleep 0.8")
        Tester.MakeTest(testId, testCfg)
    end
end

return Tester