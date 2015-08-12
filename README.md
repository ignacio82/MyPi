# Install
    devtools::install_github('ignacio82/MyPi')

# Rpi
    Rpi(DARTS = 5000, ROUNDS = 100)
    
# Fpi
    Fpi(DARTS = 5000, ROUNDS = 100)

# SnowPi
    SnowPi(DARTS = 5000, ROUNDS = 100, numprocs=2)
    
# Benchmark

    Pibenchmark(DARTS = 5000, ROUNDS = 100, times = 10)
    or
    LongPibenchmark(times=1)
