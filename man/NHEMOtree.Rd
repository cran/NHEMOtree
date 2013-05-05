\name{NHEMOtree}
\alias{NHEMOtree}
\alias{print.NHEMOtree}
\title{
Non-hierarchical evolutionary multi-objective tree learner to perform cost-sensitive classification
}
\description{
NHEMOtree performs cost-sensitive classification by solving the two-objective optimization problem of minimizing misclassification rate and minimizing total costs for classification. The three methods comprised in NHEMOtree ("NHEMO", "NHEMO_Cutoff", "Wrapper") are based on EMOAs with either tree representation or bitstring representation with a classification tree as enclosed classifier.
}
\usage{
NHEMOtree(method = c("NHEMO", "NHEMO_Cutoff", "Wrapper"), 
          formula, data, x, grouping, 
          CostMatrix, ...)
}
\arguments{
  \item{method}{
Optimization method, "NHEMO" for standard non-hierarchical evolutionary multi-objective optimization with cutoff optimization by the EMOA, "NHEMO_Cutoff" for NHEMO with local cutoff optimization, "Wrapper" for the wrapper approach (see below for details).
}
  \item{formula}{
A formula of the form groups ~ x1 + x2 + ... The response is the grouping factor and the right hand side specifies the explanatory variables.
}
  \item{data}{
Data frame from which variables specified in formula are preferentially to be taken.
}
  \item{x}{
(Required if no formula is given as the principal argument.) A matrix or data frame containing the explanatory variables.
}
  \item{grouping}{
(Required if no formula is given as the principal argument.) A factor specifying the class for each observation.
}
  \item{CostMatrix}{
A data frame containing the names (first column) and the costs (second column) for each explanatory variable in formula or x. NHEMOtree does not work with missing data in CostMatrix.
}
  \item{\dots}{
Arguments passed to or from other methods.
}
}
\details{
With NHEMOtree three types of cost-sensitive classification can be performed, i.e. building a tree learner by solving a two-objective optimization problem with regard to minimizing misclassification rate and minimizing total costs for classification (summarized costs for all used variables in the classifier).

First, the non-hierarchical evolutionary multi-objective tree learner (NHEMOtree) performs this multi-objective optimization based on an EMOA with tree representation (method="NHEMO"). It optimizes both objectives simultaneously without any hierarchy and generates Pareto-optimal classifiers being binary trees to solve the problem. Cutoffs of the tree learners are optimized with the EMOA.

Second, NHEMOtree with local cutoff optimization works like NHEMOtree but the cutoffs of the tree learner are optimized analogous to a classification tree with recursive partitioning either based on the Gini index or the misclassification rate (method="NHEMO_Cutoff").

Third, a wrapper approach based on NSGA-II with enclosed classification tree algorithm can be chosen to solve the multi-objective optimization problem (method="Wrapper"). The classification trees are built with rpart {rpart}. However, wrapper approaches suffer from a hierarchy in the objectives at which misclassification is minimized at first followed by optimizing costs.

Termination criteria of the EMOAs are the maximal amount of generations and the Online Convergence Detection (OCD) proposed by Wagner and Trautmann (2010). Here, OCD uses the dominated hypervolume as quality criterion. If its variance over the last g generations is significantly below a given threshold L according to the one-sided \eqn{\chi^2}-variance test OCD stops the run. We followed the suggestion of Wagner and Trautmann (2010) and considered their parameter settings as default values.

Missing data in the grouping variable or the explanatory variables are excluded from the analysis automatically. 

NHEMOtree does not work with missing data in "CostMatrix". Costs of all explanatory variables set to 1 results in optimizing the amount of explanatory variables in the tree learner as second objective.
}
\value{
Values returned by NHEMOtree are
\item{S_Metric}{S metric of the final population}
\item{Misclassification_total}{Range of the misclassification rate of the final population}
\item{Costs_total}{Range of the costs of the final population}
\item{VIMS}{Variable improtance measures of all explanatory variables for method=c("NHEMO", "NHEMO_Cutoff")}
\item{Trees}{Individuals of the final population}
\item{Best_Tree}{Individual of the final population with the lowest misclassification rate, its misclassification rate and costs for method=c("Wrapper")}
\item{S_Metrik_temp}{S metric values of each generation}
\item{method}{Method run with NHEMOtree}
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
\code{\link{plot.NHEMOtree}}, \code{\link{NHEMO}}, \code{\link{NHEMO_Cutoff}}, \code{\link{Wrapper}}
}
\examples{
# Simulation of data and costs
  d         <- Sim_Data(Obs=200)
  CostMatrix<- Sim_Costs()

# NHEMOtree calculations
  res<- NHEMOtree(method="NHEMO", formula=Y2~., data=d, CostMatrix=CostMatrix, 
                  gens=5, popsize=5, crossover_prob=0.1, mutation_prob=0.1)
  res
}

\keyword{Non-hierarchical evolutionary multi-objective tree learner}
\keyword{Multi-objective optimization}
\keyword{Evolutionary algorithms}
\keyword{Classification}

