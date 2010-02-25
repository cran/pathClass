\name{desummarize.ranks}
\alias{desummarize.ranks}
\title{Desummarize GeneRanks back to the corresponding probesets...}
\usage{desummarize.ranks(ranks, mapping)
}
\description{Desummarize GeneRanks back to the corresponding probesets}
\details{Desummarize the GeneRanks which were previously calculated for each node in the
underlying biological network back to the corresponding probesets for the Reweighted
Recursive Feature Elimination (RRFE).}
\value{matrix with 1st comlumn probeIDs 2nd column gene IDs}
\arguments{\item{ranks}{the previously calculated GeneRanks or PageRanks.}
\item{mapping}{a matrix or data.frame with 2 columns. The colnames of mapping have to contain at least 'graphID' and 'probesetID'.}
}

