\name{plot.NHEMOtree}
\alias{plot.NHEMOtree}
\title{
Plot Method for Class NHEMOtree
}
\description{
Generates different plots for class NHEMOtree
}
\usage{
\method{plot}{NHEMOtree}(x, data, which = c("Pareto", "S_Metric", "VIMS", "Tree"), vim = 0, ...)
}
\arguments{
  \item{x}{
An object of class NHEMOtree.
}
 \item{data}{
Data which was used in NHEMOtree.
}
  \item{which}{
Type of plot, "Pareto" for the final Pareto front, "S_Metric" for increase of the dominated hypervolume by generation, "VIMS" for variable improtance for each explanatory variable, "Tree" for the individual with the lowest misclassification rate.
}
  \item{vim}{
Variable improtance measure to be plottet for which="VIMS", vim=1 for 'simple absolute frequency', vim=2 for 'simple relative frequency', vim=3 for 'relative frequency', vim=4 for 'linear weigthed relative frequency', vim=5 for 'exponential weigthed relative frequency', vim=6 for 'permutation accuracy importance' (default: plots for all VIMs).
}
  \item{\dots}{
Arguments passed to or from other methods.
}
}
\author{
Swaantje Casjens
}
\seealso{
\code{\link{NHEMOtree}}
}
\examples{
# Simulation of data and costs
  d         <- Sim_Data(Obs=200)
  CostMatrix<- Sim_Costs()

  res<- NHEMOtree(type="NHEMO", formula=Y2~., data=d, CostMatrix=CostMatrix, 
                  gens=5, popsize=5, crossover_prob=0.1, mutation_prob=0.1)
  plot(data=d, x=res, which="P")
  plot(data=d, x=res, which="S", col=3, type="l")
  plot(data=d, x=res, which="V", vim=5)
  plot(data=d, x=res, which="T")
}

\keyword{Plots for NHEMOtree}
\keyword{Multi-objective optimization}
\keyword{Evolutionary algorithms}
\keyword{Classification}


