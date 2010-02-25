\name{summarizeProbes}
\alias{summarizeProbes}
\title{Summarize probe sets...}
\usage{summarizeProbes(exprs, mapping, method="median", groups, adjacency)
}
\description{Summarize probe sets}
\details{Summarize multiple probe sets targeting one gene into one value for that gene.
On most microarays there will be more than one probe set for a gene. However, in
the underlying network the gene will only be present one time. Therefore, in
order to calculate a Gene(Page)Rank weight for this gene, all expression measurements
have to be summarized.

summarizes all probes of a gene to one
value for that gene
if the summarization method is 'none' then the only
thing which is done is that all probesets for which no
pathway is available are discarded.}
\value{matrix with 1st comlumn probeIDs 2nd column gene IDs}
\arguments{\item{exprs}{\eqn{n \times p}{n x p} matrix with \eqn{n} probe sets and \eqn{p} samples.}
\item{mapping}{a matrix or data.frame with 2 columns. The colnames of mapping have to contain at least 'graphID' and 'probesetID'.
These two columns define the mapping between the probe sets on the microarray and the nodes of the graph.}
\item{method}{defines how several probe sets should be combined. One of \code{median}, \code{mean}, \code{foldChange} or \code{none}.}
\item{groups}{defines the grouping of samples. Only needed if \code{method} is \code{foldChange}.}
\item{adjacency}{a matrix that represents the graph of the underlying biological network.}
}

