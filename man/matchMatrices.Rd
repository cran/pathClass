\name{matchMatrices}
\alias{matchMatrices}
\title{Matches the expression data to the adjacency matrix using the provided mapping.}
\usage{matchMatrices(x, mapping, adjacency)
}
\description{Matches the expression data to the adjacency matrix using the provided mapping.}
\details{Usually the dimension of the graph and the expression data do not fit to each other.
Additionally most often the graph comprises another type of knowledge, i.e. the
expression matrix measures 10.000 genes represented as 15.000 probe sets and the graph
provides information on 7.000 proteins. Thus, a node (protein) of the graph might match to
two probe sets in the expression matrix (since both target the gene encoding the protein).
Therefore, this method uses the relationship between probe sets and i.e. proteins which is
encoded in the \code{mapping} to create a graph of probe sets rather then a graph of proteins.}
\value{the matched input \item{x}{the expression matrix containing only the features which are also present in the adjacency matrix}
\item{mapping}{the mapping containing only necessary information}
\item{adjacency}{the adjacency matrix with the same number of nodes as features in x}}
\author{Marc Johannes \email{M.Johannes@DKFZ.de}}
\arguments{\item{x}{the p x n expression matrix with p patients and n genes.}
\item{mapping}{a mapping which encodes the relationship between the colnames of x and the
row/colnames of the adjacency matrix.}
\item{adjacency}{the adjacencymatrix of the underlying graph structure.}
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
}}

