FSnowPi <- function(DARTS, ROUNDS, proc_num, numprocs) {
  retvals <- .Fortran("snowpi", avepi = as.numeric(1),
                      DARTS =  as.integer(DARTS),
                      ROUNDS =  as.integer(ROUNDS),
                      proc_num = as.integer(proc_num),
                      numprocs = as.integer(numprocs))
  return(retvals$avepi)
}
#'@export
SnowPi  <- function(DARTS, ROUNDS, numprocs){
  cl <- snow::makeCluster(numprocs, type = "MPI")
  r<<-ROUNDS
  d<<-DARTS
  snow::clusterExport(cl, c("r", "d"))
  x<-snow::clusterEvalQ(cl, MyPi::FSnowPi(DARTS = d, ROUNDS = r, proc_num = mpi.comm.rank(), numprocs = mpi.comm.size()-1))
  snow::stopCluster(cl)
  return(mean(unlist(x)))
}
