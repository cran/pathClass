\name{fit.networkBasedSVM}
\alias{fit.networkBasedSVM}
\title{Implementation of the network-based Support Vector Machine introduced by Yanni Zhu et al.}
\usage{fit.networkBasedSVM(exps, y, DEBUG=FALSE, n.inner=3, scale=c("center", "scale"),
    sd.cutoff=1, lambdas=10^(-2:4), adjacencyList)
}
\description{Implementation of the network-based Support Vector Machine introduced by Yanni Zhu et al., 2009.}
\details{\code{mapping} must be a data.frame with at least two columns. The column names have to be \code{c('probesetID','graphID')}.
Where 'probesetID' is the probeset ID present in the expression matrix (i.e. \code{colnames(x)}) and 'graphID' is any ID that
represents the nodes in the diffusionKernel (i.e. \code{colnames(diffusionKernel)} or \code{rownames(diffusionKernel)}). The purpose of the this mapping is that
a gene or protein in the network might be represented by more than one probe set on the chip. Therefore, the algorithm must know
which genes/protein in the network belongs to which probeset on the chip.}
\value{a networkBasedSVM object containing \item{features}{the selected features} \item{lambda.performance}{overview how different values of lambda performed in the inner cross validation} \item{fit}{the fitted network based SVM model}}
\references{Zhu Y. et al. (2009). Network-based support vector machine for classification of microarray samples. \emph{BMC Bioinformatics}}
\author{Marc Johannes \email{M.Johannes@DKFZ.de}}
\arguments{\item{exps}{a p x n matrix of expression measurements with p samples and n genes.}
\item{y}{a factor of length p comprising the class labels.}
\item{DEBUG}{should debugging information be plotted.}
\item{n.inner}{number of fold for the inner cross-validation.}
\item{scale}{a character vector defining if the data should be centered and/or scaled.
Possible values are \emph{center} and/or \emph{scale}. Defaults to \code{c('center', 'scale')}.}
\item{sd.cutoff}{a cutoff on the standard deviation (sd) of genes. Only genes with sd > sd.cutoff stay in the analysis.}
\item{lambdas}{a set of values for lambda  regularization parameter of the L\eqn{_\infty}-Norm. Which, if properly chosen,
eliminates factors that are completely irrelevant to the response, what in turn
leads to a factor-wise (subnetwork-wise) feature selection. The 'best' lambda is
found by an inner-cross validation.}
\item{adjacencyList}{a adjacency list representing the network structure. The list can be generated from a
adjacency matrix by using the function \code{\link{as.adjacencyList}}}
}
\examples{\dontrun{
library(Biobase)
data(sample.ExpressionSet)
x <- t(exprs(sample.ExpressionSet))
y <- factor(pData(sample.ExpressionSet)$sex)
# create the mapping
library('hgu95av2.db')
mapped.probes <- mappedkeys(hgu95av2REFSEQ)
refseq <- as.list(hgu95av2REFSEQ[mapped.probes])
times <- sapply(refseq, length)
mapping <- data.frame(probesetID=rep(names(refseq), times=times), graphID=unlist(refseq), row.names=NULL, stringsAsFactors=FALSE)
mapping <- unique(mapping)
library(pathClass)
data(adjacency.matrix)
matched <- matchMatrices(x=x, adjacency=adjacency.matrix, mapping=mapping)
ad.list <- as.adjacencyList(matched$adjacency)
res.nBSVM <- crossval(matched$x, y, theta.fit=fit.networkBasedSVM, folds=3, repeats=1, DEBUG=TRUE, parallel=FALSE, adjacencyList=ad.list, lambdas=10^(-1:2), sd.cutoff=50)
}}

