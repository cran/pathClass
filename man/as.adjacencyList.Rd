\name{as.adjacencyList}
\alias{as.adjacencyList}
\title{Uses a adjacency matrix to create a adjacency list...}
\usage{as.adjacencyList(adjacency.matrix, skip.redundant.nodes=TRUE, is.directed=FALSE)
}
\description{Uses a adjacency matrix to create a adjacency list}
\details{Uses a adjacency matrix to create a adjacency list as needed for \code{\link{fit.networkBasedSVM}}.}
\value{an adjacency list.}
\author{Marc Johannes \email{M.Johannes@DKFZ.de}}
\arguments{\item{adjacency.matrix}{a adjacency matrix.}
\item{skip.redundant.nodes}{if \code{TRUE} and the graph is undirected only the upper triangular matrix (including the diagonal) is used to create the adjacency list.}
\item{is.directed}{determines wether or not the graph is directed.}
}
\examples{\dontrun{
library(pathClass)
data(adjacency.matrix)
ad.list <- as.adjacencyList(adjacency.matrix)
}}

