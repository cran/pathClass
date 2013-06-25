\name{fit.rrfe}
\alias{fit.rrfe}
\title{Reweighted Recursive Feature Elimination (RRFE)}
\usage{
  fit.rrfe(x, y, DEBUG = FALSE,
    scale = c("center", "scale"), Cs = 10^c(-3:3),
    stepsize = 0.1, useAllFeatures = F, mapping, Gsub,
    d = 0.5)
}
\arguments{
  \item{x}{a p x n matrix of expression measurements with p
  samples and n genes.}

  \item{y}{a factor of length p comprising the class
  labels.}

  \item{DEBUG}{should debugging information be plotted.}

  \item{scale}{a character vector defining if the data
  should be centered and/or scaled. Possible values are
  \emph{center} and/or \emph{scale}. Defaults to
  \code{c('center', 'scale')}.}

  \item{Cs}{soft-margin tuning parameter of the SVM.
  Defaults to \code{10^c(-3:3)}.}

  \item{stepsize}{amount of features that are discarded in
  each step of the feature elimination. Defaults to 10\%.}

  \item{useAllFeatures}{should all features be used for
  classification (see also \code{Details}).}

  \item{mapping}{a mapping that defines how probe sets are
  summarized to genes.}

  \item{Gsub}{an adjacency matrix that represents the
  underlying biological network.}

  \item{d}{the damping factor which controls the influence
  of the network data and the fold change on the ranking of
  the genes. Defaults to 0.5}
}
\value{
  a RRFE fit object. \item{features}{the selected features}
  \item{error.bound}{the span bound of the model}
  \item{fit}{the fitted SVM model}
}
\description{
  Implementation of the Reweighted Recursive Feature
  Elimination (RRFE) algorithm. \code{mapping} must be a
  data.frame with at least two columns. The column names
  have to be \code{c('probesetID','graphID')}. Where
  'probesetID' is the probeset ID present in the expression
  matrix (i.e. \code{colnames(x)}) and 'graphID' is any ID
  that represents the nodes in the graph (i.e.
  \code{colnames(Gsub)} or \code{rownames(Gsub)}). The
  purpose of the this mapping is that a gene or protein in
  the network might be represented by more than one probe
  set on the chip. Therefore, the algorithm must know which
  genes/protein in the network belongs to which probeset on
  the chip. However, the method is able to use all feature
  when one sets the parameter \code{useAllFeatures} to
  \code{TRUE}. When doing so, RRFE assigns the minimal
  wheight returned by GeneRank to those genes which are not
  present in \code{Gsub}.
}
\note{
  The optimal number of features is found by using the span
  estimate. See Chapelle, O., Vapnik, V., Bousquet, O., and
  Mukherjee, S. (2002). Choosing multiple parameters for
  support vector machines. \emph{Machine Learning}, 46(1),
  131-159.
}
\examples{
\dontrun{
library(Biobase)
data(sample.ExpressionSet)
x <- t(exprs(sample.ExpressionSet))
y <- factor(pData(sample.ExpressionSet)$sex)
# create the mapping
library('hgu95av2.db')
mapped.probes <- mappedkeys(hgu95av2REFSEQ)
refseq <- as.list(hgu95av2REFSEQ[mapped.probes])
times <- sapply(refseq, length)
mapping <- data.frame(probesetID=rep(names(refseq), times=times), graphID=unlist(refseq), 
row.names=NULL, stringsAsFactors=FALSE)
mapping <- unique(mapping)
library(pathClass)
data(adjacency.matrix)
res.rrfe <- crossval(x, y, DEBUG=TRUE, theta.fit=fit.rrfe, folds=3, repeats=1, parallel=TRUE,
 Cs=10^(-3:3), mapping=mapping, Gsub=adjacency.matrix, d=1/2)
}
}
\author{
  Marc Johannes \email{JohannesMarc@gmail.com}
}
\references{
  Johannes M, et al. (2010). Integration Of Pathway
  Knowledge Into A Reweighted Recursive Feature Elimination
  Approach For Risk Stratification Of Cancer Patients.
  \emph{Bioinformatics}
}

