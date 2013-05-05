\name{Sim_Data}
\alias{Sim_Data}
\title{
Simulation of data for use in NHEMOtree
}
\description{
Simulation of data with one grouping variable containing four classes and 20 explanatory variables. Variables X1 to X3 are informative for seperating the four classes. Variable X1 separates class 1, X2 separates class 1 and class 2, and X3 separates class 3 from class 4. Variables X4, X5, and X6 are created on basis of X3 and can also be used to separate class 3 from class 4 but with decreased prediction accuracy.
}
\usage{
Sim_Data(Obs, VG=1, VP1=0.05, VP2=0.1, VP3=0.3)
}
\arguments{
  \item{Obs}{
Amount of observations.
}
  \item{VG}{
Overall accuracy for data separation \eqn{\in [0,1]} with VG=1 (default) for perfect seperation.
}
  \item{VP1}{
Decrease of prediction accuracy for variable X4 in comparison with X3 to separate class 3 from class 4 (default: VP1=0.05).
}
  \item{VP2}{
Decrease of prediction accuracy for variable X5 in comparison with X3 to separate class 3 from class 4 (default: VP2=0.1).
}
  \item{VP3}{
Decrease of prediction accuracy for variable X6 in comparison with X3 to separate class 3 from class 4 (default: VP3=0.3).
}
}
\details{
With this function data with one grouping variable containing four classes and 20 explanatory variables X1 to X10 is simulated.

Variable X1 separates class 1, X2 separates class 1 and class 2, and X3 separates class 3 from class 4. For all samples belonging to the according classes the explanatory variables X1 to X3 are drawn from a normal distribution with \eqn{\mu=80} and \eqn{\sigma^2=25}. Samples which are not allocated to the corresponding class are drawn from a uniform distribution with minimum 0 and an adjustable maximum value. The maximum values of the uniform distributions are the smallest drawn random values of each variable. 

Variables X4, X5, and X6 are created on basis of X3 and separate class 3 from class 4, too. However, the prediction accuracy of these variables decreases gradually. The decrease is assigned by 'VP1', 'VP2', and 'VP3'. Thus, the according amount of the discriminating samples of former class 3 are disturbed by assigning a value drawn from a uniform distribution. Accordingly, X4, X5 and X6 discriminate class 3 worse than X3. X7 to X10 are noisy variables drawn from a normal distribution that contain no information.

Noise is added to the class assignment by a binomial distribution. Each potential class is only with probability "VG" the equivalent class and with probability 1-"VG" one of the other classes. 

Variable costs correlate with their prediction accuracy so that variables containing more information are more expensive than variables with less or none information. The costs of the variables are generated with function "Sim_Costs". 
}
\author{
Swaantje Casjens
}
\seealso{
\code{\link{Sim_Costs}}, \code{\link{NHEMOtree}}
}
\examples{
  d<- Sim_Data(Obs=200)
  head(d)
}
\keyword{Non-hierarchical evolutionary multi-objective tree learner}
