\name{Wrapper}
\alias{Wrapper}
\title{
NSGA-II wrapper with enclosed classification tree algorithm
}
\description{
This wrapper approach is based on the Nondominated Sorting Genetic Algorithm II (NSGA-II) with an enclosed classification tree algorithm. It performs cost-sensitive classification by solving the two-objective optimization problem of minimizing misclassification rate and minimizing total costs for classification. 
}
\usage{
Wrapper(data, CostMatrix, 
        gens = 50, popsize = 50, 
        ngens = 14, bound = 10^-10, 
        init_prob = 0.8, 
        crossover_prob = 0.5, mutation_prob = 0.5, 
        CV = 5, ...)
}
\arguments{
  \item{data}{
A data frame containing in the first column the class for each observation and in the other columns from which variables specified in formula are preferentially to be taken.
}
  \item{CostMatrix}{
A data frame containing the names (first column) and the costs (second column) for each explanatory variable in formula or x. NHEMOtree does not work with missing data in CostMatrix.
}
  \item{gens}{
Maximal number of generations of the EMOA (default: gens=50).
}
  \item{popsize}{
Population size in each generation of the EMOA (default: popsize=50).
}
  \item{ngens}{
Preceeding generations for the Online Convergence Detection (OCD, default: ngens=14) (see below for details).
}
  \item{bound}{
Variance limit for the Online convergence detection (default: bound=10^10).
}
  \item{init_prob}{
Degree of initilization \eqn{\in [0,1]}, i.e. the amount of activated explanatory variables in the individuals of the initial population (default: init_prob=0.80).
}
  \item{crossover_prob}{
Probability to perform crossover \eqn{\in [0,1]} (default: crossover_prob=0.50).
}
  \item{mutation_prob}{
Probability to perform mutation \eqn{\in [0,1]} (default: mutation_prob=0.50).
}
  \item{CV}{
Cross validation steps as natural number bigger than 1 (default: CV=5).
}
  \item{\dots}{
Arguments passed to or from other methods.
}
}
\details{
With Wrapper a wrapper approach based on the Nondominated Sorting Genetic Algorithm II (NSGA-II) with an enclosed classification tree algorithm is used to solve the two-objective optimization problem of minimizing misclassification rate and minimizing total costs for classification (summarized costs for all used variables in the classifier). The classification trees are constructed with rpart {rpart}. However, wrapper approaches suffer from a hierarchy in the objectives at which misclassification is minimized at first followed by optimizing costs. Parent selection is always performed by a binary tournament and there is only one-point crossover.

Alternatives are the proposed non-hierarchical evolutionary multi-objective tree learners which do not suffer from a hierarchy in the objectives (see NHEMO {NHEMOtree} and NHEMO_Cutoff {NHEMOtree}). 

Termination criteria of the NSGA-II are the maximal amount of generations and the Online Convergence Detection (OCD) proposed by Wagner and Trautmann (2010). Here, OCD uses the dominated hypervolume as quality criterion. If its variance over the last g generations is significantly below a given threshold L according to the one-sided \eqn{\chi^2}-variance test OCD stops the run. We followed the suggestion of Wagner and Trautmann (2010) and considered their parameter settings as default values.

Missing data in the grouping variable or the explanatory variables are excluded from the analysis automatically. Wrapper does not work with missing data in "CostMatrix". Costs of all explanatory variables set to 1 results in optimizing the amount of explanatory variables in the tree learner as second objective.
}
\references{
L. Breiman, J.H. Friedman, R.A. Olshen, and C.J. Stone. Classification and Regression Trees. Wadsworth,  1984.

K. Deb, A. Pratap, S. Agarwal and T. Meyarivan. A fast and elitist multiobjective genetic algorithm: Nsga-ii. IEEE Transactions on Evolutionary Computation, 6(2):182-197, 2002.

R. Poli and W.B. Langdon. Schema theory for genetic programming with one-point crossover and point mutation. Evolutionary Computation, 6(3):231-252, 1998a.

W.A. Tackett. Recombination, selection und the genetic construction of computer programs. PhD thesis, University of Southern California, 1994.

T. Wagner and H. Trautmann. Online convergence detection for evolutionary multiobjective algorithms revisited. In: IEEE Congress on Evolutionary Computation, 1-8, 2010.
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

# Wrapper calculations with function NHEMOtree and type="Wrapper"
  res<- NHEMOtree(method="Wrapper", formula=Y2~., data=d, CostMatrix=CostMatrix, 
                  gens=5, popsize=5,
                  init_prob=0.8, 
                  ngens=14, bound=10^-10, 
                  crossover_prob=0.1, mutation_prob=0.1, 
                  CV=5)
  res
}

\keyword{Multi-objective optimization}
\keyword{Evolutionary algorithms}
\keyword{Nondominated Sorting Genetic Algorithm II}
\keyword{Classification tree}
\keyword{Wrapper approach}
