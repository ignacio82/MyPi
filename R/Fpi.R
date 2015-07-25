Fpi <- function(DARTS, ROUNDS) {
  retvals <- .Fortran("pi", avepi = as.numeric(1), DARTS =  as.integer(DARTS), ROUNDS =  as.integer(ROUNDS))
  return(retvals$avepi)
}

