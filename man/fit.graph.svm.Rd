\name{fit.graph.svm}
\alias{fit.graph.svm}
\title{Implementation of a supervised classification framework introduced by Franck Rapaport et al., 2007.}
\usage{
  fit.graph.svm(x, y, DEBUG = FALSE,
    scale = c("center", "scale"), Cs = 10^c(-3:3),
    stepsize = 0.1, mapping, diffusionKernel,
    useOrigMethod = FALSE)
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

  \item{mapping}{a mapping that defines how probe sets are
  summarized to genes.}

  \item{diffusionKernel}{the diffusion kernel which was
  pre-computed by using the function
  \code{\link{calc.diffusionKernel}}}

  \item{useOrigMethod}{use the method originally decribed
  in the paper by Franck Rapaport et al. 2007}
}
\value{
  a graphSVM object \item{features}{the selected features}
  \item{error.bound}{the span bound of the model}
  \item{fit}{the fitted SVM model}
}
\description{
  \code{mapping} must be a data.frame with at least two
  columns. The column names have to be
  \code{c('probesetID','graphID')}. Where 'probesetID' is
  the probeset ID present in the expression matrix (i.e.
  \code{colnames(x)}) and 'graphID' is any ID that
  represents the nodes in the diffusionKernel (i.e.
  \code{colnames(diffusionKernel)} or
  \code{rownames(diffusionKernel)}). The purpose of the
  this mapping is that a gene or protein in the network
  might be represented by more than one probe set on the
  chip. Therefore, the algorithm must know which
  genes/protein in the network belongs to which probeset on
  the chip.
}
\note{
  We combined the original method with a Recursive Feature
  Elimination in order to allow a feature selection. The
  optimal number of features is found by using the span
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
matched <- matchMatrices(x=x, adjacency=adjacency.matrix, mapping=mapping)
dk <- calc.diffusionKernel(L=matched$adjacency, is.adjacency=TRUE, beta=0) # beta should be tuned
res.gSVM <- crossval(matched$x, y, theta.fit=fit.graph.svm, folds=5, repeats=2, DEBUG=TRUE, 
parallel=FALSE, Cs=10^(-3:3), mapping=matched$mapping, diffusionKernel=dk)
}
}
\author{
  Marc Johannes \email{JohannesMarc@gmail.com}
}
\references{
  Rapaport F. et al. (2007). Classification of microarray
  data using gene networks. \emph{BMC Bioinformatics}
}

