\name{getGeneRanks}
\alias{getGeneRanks}
\title{Calculate GeneRanks as used by RRFE...}
\usage{getGeneRanks(x, y, mapping, Gsub, method="foldChange", d=0.5)
}
\description{Calculate GeneRanks as used by RRFE}
\details{Uses the GeneRank  to calculate the ranks for genes. Afterwards the ranks 
are transformed as needed for the RRFE algorithm.}
\value{a ranking of the genes for which pathway knowledge was available.}
\references{Johannes M, et al. (2010). Integration Of Pathway Knowledge Into A Reweighted Recursive Feature Elimination Approach For Risk Stratification Of Cancer Patients. \emph{Bioinformatics}}
\author{Marc Johannes \email{JohannesMarc@gmail.com}}
\arguments{\item{x}{a p x n matrix of expression measurements with p samples and n genes.}
\item{y}{a factor of length p comprising the class labels.}
\item{mapping}{a mapping that defines how probe sets are summarized to genes.}
\item{Gsub}{an adjacency matrix that represents the underlying biological network.}
\item{method}{see help of \link{summarizeProbes}}
\item{d}{the damping factor which controls the influence of the network data and the fold change on the ranking of the genes.
Defaults to 0.5}
}
\examples{\dontrun{
library(pathClass)
data(example_data)
ranks = getGeneRanks(x, y, mapping=mapping, Gsub=adjacency.matrix)
}}

