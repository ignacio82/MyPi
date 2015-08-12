#'@export
Pibenchmark <- function(DARTS = 5000 ,ROUNDS = 100, times=10L){
  PiRace <- microbenchmark::microbenchmark(R = Rpi(DARTS = DARTS ,ROUNDS = ROUNDS),
                           Fortran = Fpi(DARTS = DARTS, ROUNDS = ROUNDS),
                           times = times)
  return(PiRace)
}

#'@export
LongPibenchmark <- function(DARTS = 50000 ,ROUNDS = 10000, times=10L){
  PiRace <- microbenchmark::microbenchmark(R = Rpi(DARTS = DARTS ,ROUNDS = ROUNDS),
                                           Fortran = Fpi(DARTS = DARTS, ROUNDS = ROUNDS),
                                           Fortran2x = SnowPi(DARTS = DARTS, ROUNDS = ROUNDS, numprocs = 2),
                                           Fortran4x = SnowPi(DARTS = DARTS, ROUNDS = ROUNDS, numprocs = 4),
                                           Fortran8x = SnowPi(DARTS = DARTS, ROUNDS = ROUNDS, numprocs = 8),
                                           times = times)
  return(PiRace)
}
