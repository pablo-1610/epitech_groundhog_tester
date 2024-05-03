return {
    TestingPeriod = 7,
    BinaryPath = "./groundhog",
    LogFile = "test_%s.log",

    Tests = {
        {
            label = "No arguments",
            args = {},
            expected = {
                code = 84
            }
        },
        {
            label = "Period is not a number",
            args = {"a"},
            expected = {
                code = 84
            }
        },
        {
            label = "Help with -h",
            args = {"-h"},
            expected = {
                code = 0
            }
        },
        {
            label = "Not enough values",
            args = {7},
            expected = {
                code = 84,
            },
            inputs = {
                {
                    input = 27.7,
                    expected = "g=nan\t\tr=nan%\t\ts=nan"
                },
                {
                    input = 31.0,
                    expected = "g=nan\t\tr=nan%\t\ts=nan"
                },
                {
                    input = "STOP",
                },
            }
        },
        {
            label = "Full test from subject's example",
            args = {7},
            expected = {
                code = 0
            },
            inputs = {
                {
                    input = 27.7,
                    expected = "g=nan\t\tr=nan%\t\ts=nan"
                },
                {
                    input = 31.0,
                    expected = "g=nan\t\tr=nan%\t\ts=nan"
                },
                {
                    input = 32.7,
                    expected = "g=nan\t\tr=nan%\t\ts=nan"
                },
                {
                    input = 34.7,
                    expected = "g=nan\t\tr=nan%\t\ts=nan"
                },
                {
                    input = 35.9,
                    expected = "g=nan\t\tr=nan%\t\ts=nan"
                },
                {
                    input = 37.4,
                    expected = "g=nan\t\tr=nan%\t\ts=nan"
                },
                {
                    input = 38.2,
                    expected = "g=nan\t\tr=nan%\t\ts=3.46"
                },
                {
                    input = 39.5,
                    expected = "g=1.69\t\tr=43%\t\ts=2.82"
                },
                {
                    input = 40.3,
                    expected = "g=1.33\t\tr=30%\t\ts=2.50"
                },
                {
                    input = 42.2,
                    expected = "g=1.36\t\tr=29%\t\ts=2.40"
                },
                {
                    input = 41.3,
                    expected = "g=1.07\t\tr=19%\t\ts=2.06"
                },
                {
                    input = 40.4,
                    expected = "g=0.90\t\tr=13%\t\ts=1.56"
                },
                {
                    input = 39.8,
                    expected = "g=0.69\t\tr=6%\t\ts=1.19"
                },
                {
                    input = 38.7,
                    expected = "g=0.57\t\tr=1%\t\ts=1.07"
                },
                {
                    input = 36.5,
                    expected = "g=0.39\t\tr=-8%\t\ts=1.72\t\ta switch occurs"
                },
                {
                    input = 35.7,
                    expected = "g=0.27\t\tr=-11%\t\ts=2.24"
                },
                {
                    input = 33.4,
                    expected = "g=0.00\t\tr=-21%\t\ts=2.65"
                },
                {
                    input = 29.8,
                    expected = "g=0.00\t\tr=-28%\t\ts=3.50"
                },
                {
                    input = 27.5,
                    expected = "g=0.00\t\tr=-32%\t\ts=4.20"
                },
                {
                    input = 25.2,
                    expected = "g=0.00\t\tr=-37%\t\ts=4.64"
                },
                {
                    input = 24.7,
                    expected = "g=0.00\t\tr=-36%\t\ts=4.51"
                },
                {
                    input = 23.1,
                    expected = "g=0.00\t\tr=-37%\t\ts=4.36"
                },
                {
                    input = 22.8,
                    expected = "g=0.00\t\tr=-36%\t\ts=3.58"
                },
                {
                    input = 22.7,
                    expected = "g=0.00\t\tr=-32%\t\ts=2.48"
                },
                {
                    input = 23.6,
                    expected = "g=0.13\t\tr=-21%\t\ts=1.60"
                },
                {
                    input = 24.3,
                    expected = "g=0.23\t\tr=-12%\t\ts=0.91"
                },
                {
                    input = 24.5,
                    expected = "g=0.26\t\tr=-3%\t\ts=0.77"
                },
                {
                    input = 26.7,
                    expected = "g=0.57\t\tr=8%\t\ts=1.29\t\ta switch occurs"
                },
                {
                    input = 27.0,
                    expected = "g=0.61\t\tr=17%\t\ts=1.61"
                },
                {
                    input = 27.4,
                    expected = "g=0.67\t\tr=20%\t\ts=1.71"
                },
                {
                    input = 29.8,
                    expected = "g=1.01\t\tr=31%\t\ts=2.02"
                },
                {
                    input = 29.4,
                    expected = "g=0.89\t\tr=25%\t\ts=1.98"
                },
                {
                    input = 31.5,
                    expected = "g=1.09\t\tr=30%\t\ts=2.16"
                },
                {
                    input = 29.6,
                    expected = "g=1.06\t\tr=21%\t\ts=1.64"
                },
                {
                    input = 29.8,
                    expected = "g=0.77\t\tr=12%\t\ts=1.43"
                },
                {
                    input = 28.9,
                    expected = "g=0.73\t\tr=7%\t\ts=1.13"
                },
                {
                    input = 28.7,
                    expected = "g=0.67\t\tr=5%\t\ts=0.84"
                },
                {
                    input = 27.2,
                    expected = "g=0.33\t\tr=-9%\t\ts=1.20\t\ta switch occurs"
                },
                {
                    input = 25.7,
                    expected = "g=0.33\t\tr=-13%\t\ts=1.74"
                },
                {
                    input = 26.0,
                    expected = "g=0.07\t\tr=-17%\t\ts=1.56"
                },
                {
                    input = 25.2,
                    expected = "g=0.07\t\tr=-15%\t\ts=1.67"
                },
                {
                    input = 21.6,
                    expected = "g=0.04\t\tr=-28%\t\ts=2.30"
                },
                {
                    input = 20.3,
                    expected = "g=0.04\t\tr=-30%\t\ts=2.77"
                },
                {
                    input = 21.1,
                    expected = "g=0.16\t\tr=-26%\t\ts=2.57"
                },
                {
                    input = 20.4,
                    expected = "g=0.16\t\tr=-25%\t\ts=2.41"
                },
                {
                    input = 19.8,
                    expected = "g=0.16\t\tr=-23%\t\ts=2.31"
                },
                {
                    input = 19.1,
                    expected = "g=0.11\t\tr=-27%\t\ts=1.85"
                },
                {
                    input = 19.6,
                    expected = "g=0.19\t\tr=-22%\t\ts=0.80"
                },
                {
                    input = 21.2,
                    expected = "g=0.41\t\tr=-2%\t\ts=0.72"
                },
                {
                    input = 21.0,
                    expected = "g=0.41\t\tr=3%\t\ts=0.77\t\ta switch occurs"
                },
                {
                    input = 21.4,
                    expected = "g=0.36\t\tr=1%\t\ts=0.82"
                },
                {
                    input = 24.0,
                    expected = "g=0.73\t\tr=18%\t\ts=1.52"
                },
                {
                    input = 25.5,
                    expected = "g=0.94\t\tr=29%\t\ts=2.13"
                },
                {
                    input = 25.5,
                    expected = "g=0.94\t\tr=34%\t\ts=2.20"
                },
                {
                    input = 26.4,
                    expected = "g=1.00\t\tr=35%\t\ts=2.16"
                },
                {
                    input = 29.4,
                    expected = "g=1.20\t\tr=39%\t\ts=2.71"
                },
                {
                    input = 32.1,
                    expected = "g=1.59\t\tr=53%\t\ts=3.25"
                },
                {
                    input = 31.4,
                    expected = "g=1.53\t\tr=47%\t\ts=2.95"
                },
                {
                    input = 32.3,
                    expected = "g=1.29\t\tr=35%\t\ts=2.87"
                },
                {
                    input = 35.2,
                    expected = "g=1.49\t\tr=38%\t\ts=3.20"
                },
                {
                    input = 38.3,
                    expected = "g=1.93\t\tr=50%\t\ts=3.55"
                },
                {
                    input = 36.6,
                    expected = "g=1.80\t\tr=39%\t\ts=2.93"
                },
                {
                    input = 38.4,
                    expected = "g=1.63\t\tr=31%\t\ts=2.77"
                },
                {
                    input = 39.9,
                    expected = "g=1.46\t\tr=24%\t\ts=2.98"
                },
                {
                    input = 40.5,
                    expected = "g=1.54\t\tr=29%\t\ts=2.65"
                },
                {
                    input = 39.4,
                    expected = "g=1.41\t\tr=22%\t\ts=1.74"
                },
                {
                    input = 39.0,
                    expected = "g=1.00\t\tr=11%\t\ts=1.18"
                },
                {
                    input = 40.5,
                    expected = "g=0.77\t\tr=6%\t\ts=1.27"
                },
                {
                    input = 42.1,
                    expected = "g=1.00\t\tr=15%\t\ts=1.12"
                },
                {
                    input = 38.7,
                    expected = "g=0.74\t\tr=1%\t\ts=1.07"
                },
                {
                    input = 37.5,
                    expected = "g=0.53\t\tr=-6%\t\ts=1.39\t\ta switch occurs"
                },
                {
                    input = 38.1,
                    expected = "g=0.53\t\tr=-6%\t\ts=1.43"
                },
                {
                    input = 36.5,
                    expected = "g=0.53\t\tr=-7%\t\ts=1.74"
                },
                {
                    input = 35.4,
                    expected = "g=0.53\t\tr=-9%\t\ts=2.13"
                },
                {
                    input = "STOP",
                    expected = "Global tendency switched 5 times\n5 weirdest values are [26.7, 24.0, 21.6, 36.5, 42.1]",
                    linesFromBottom = 2
                }
            }
        }
    }

}