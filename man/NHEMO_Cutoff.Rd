\name{NHEMO_Cutoff}
\alias{NHEMO_Cutoff}
\title{
Non-hierarchical evolutionary multi-objective optimization with local cutoff optimization
}
\description{
NHEMO_Cutoff performs cost-sensitive classification by solving the non-hierarchical evolutionary two-objective optimization problem of minimizing misclassification rate and minimizing total costs for classification. NHEMO_Cutoff is based on an EMOA with tree representation and local cutoff optimization. Cutoffs of the tree learner are optimized analogous to a classification tree with recursive partitioning either based on the Gini index or the misclassification rate.
}
\usage{
NHEMO_Cutoff(data, CostMatrix, 
             gens = 50, popsize = 50, max_nodes = 10, 
             ngens = 14, bound = 10^-10, 
             init_prob = 0.8, 
             ps = c("tournament", "roulette", "winkler"), tournament_size = 4, 
             crossover = c("standard", "brood", "poli"), brood_size = 4, 
             crossover_prob = 0.5, mutation_prob = 0.5, 
             CV = 5, vim = 0, 
             ncutoffs = 10, opt = c("gini", "mcr"))
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
  \item{max_nodes}{
Maximal number of nodes within each tree (default: max_nodes=10).
}
  \item{ngens}{
Preceeding generations for the Online Convergence Detection (OCD, default: ngens=14) (see below for details).
}
  \item{bound}{
Variance limit for the Online convergence detection (default: bound=10^10).
}
  \item{init_prob}{
Degree of initilization \eqn{\in [0,1]}, i.e. the probability of a node having a subnode (default: init_prob=0.80).
}
  \item{ps}{
Type of parent selection, "tournament" for tournament selection (default), "roulette" for roulette-wheel selection, and "winkler" for random selection of the first parent and the second parent by roulette-wheel selection.
}
  \item{tournament_size}{
Size of tournament for ps="tournament" (default: tournament_size=4).
}
  \item{crossover}{
Crossover operator, "standard" for one point crossover swapping two randomly chosen subtrees of the parents, "brood" for brood crossover (for details see Tackett (1994)), "poli" for a size-dependent crossover with the crossover point from the so called common region of both parents (for details see Poli and Langdon (1998)).
}
  \item{brood_size}{
Number of offspring created by brood crossover (default: brood_size=4).
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
  \item{vim}{
Variable importance measure to be used to improve standard crossover. vim=0 for no variable improtance measure (default), vim=1 for 'simple absolute frequency', vim=2 for 'simple relative frequency', vim=3 for 'relative frequency', vim=4 for 'linear weigthed relative frequency', vim=5 for 'exponential weigthed relative frequency', and vim=6 for 'permutation accuracy importance'.
}
  \item{ncutoffs}{
Number of cutoffs per explanatory variable to be tested for optimality (default: ncutoffs=10).
}
  \item{opt}{
Type of local cutoff optimization, "gini" for local cutoff optimization by Gini index (default), "mcr" for local cutoff optimization by misclassification rate.
}
}
\details{
The non-hierarchical evolutionary multi-objective tree learner (NHEMOtree) with local cutoff optimization solves a two-objective optimization problem with regard to minimizing misclassification rate and minimizing total costs for classification (summarized costs for all used variables in the classifier). It is based on an EMOA with tree representation. It optimizes both objectives simultaneously without any hierarchy and generates Pareto-optimal classifiers being binary trees to solve the problem. Cutoffs of the tree learner are optimized analogous to a classification tree with recursive partitioning either based on the Gini index or the misclassification rate.

Termination criteria of NHEMO_Cutoff are the maximal amount of generations and the Online Convergence Detection (OCD) proposed by Wagner and Trautmann (2010). Here, OCD uses the dominated hypervolume as quality criterion. If its variance over the last g generations is significantly below a given threshold L according to the one-sided \eqn{\chi^2}-variance test OCD stops the run. We followed the suggestion of Wagner and Trautmann (2010) and considered their parameter settings as default values.

Missing data in the grouping variable or the explanatory variables are excluded from the analysis automatically. NHEMO_Cutoff does not work with missing data in "CostMatrix". Costs of all explanatory variables set to 1 results in optimizing the amount of explanatory variables in the tree learner as second objective.
}
\references{
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

# NHEMO_Cutoff calculations with function NHEMOtree and type="NHEMO_Cutoff"
  res<- NHEMOtree(method="NHEMO_Cutoff", formula=Y2~., data=d, CostMatrix=CostMatrix, 
                  gens=5, popsize=5,
                  max_nodes=5, ngens=5, bound=10^-10, init_prob=0.8, 
                  ps="tournament", tournament_size=4, crossover="standard", 
                  crossover_prob=0.1, mutation_prob=0.1, 
                  CV=5, vim=1,
                  ncutoffs=5, opt="mcr")
  res
}

\keyword{Non-hierarchical evolutionary multi-objective tree learner}
\keyword{Multi-objective optimization}
\keyword{Evolutionary algorithms}
\keyword{Classification}
