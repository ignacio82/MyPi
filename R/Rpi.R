Rdboard <- function(darts) {
  score = 0
  for (i in 1:darts) {
  x_coord <- runif(n = 1, min = 0, max = 1)
  y_coord <- runif(n = 1, min = 0, max = 1)
  if ((x_coord *  x_coord + y_coord *  y_coord) <= 1.0)
  score = score + 1
  }
  dartsscore = 4.0 * score / darts
  return(dartsscore)
  }

#'@export
Rpi <- function(DARTS, ROUNDS) {
  avepi <- 0
  for (i in 0:(ROUNDS - 1)) {
    pi_est <- Rdboard(DARTS)
    avepi = ((avepi * i) + pi_est) / (i + 1)
  }
  return(avepi)
}
