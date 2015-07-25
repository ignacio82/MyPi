Pibenchmark <- function(DARTS = 5000 ,ROUNDS = 100, times=10L){
  PiRace <- microbenchmark::microbenchmark(R = Rpi(DARTS = DARTS ,ROUNDS = ROUNDS),
                           Fortran = Fpi(DARTS = DARTS, ROUNDS = ROUNDS),
                           times = times)
  return(PiRace)

}
