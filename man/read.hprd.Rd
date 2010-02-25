\name{read.hprd}
\alias{read.hprd}
\title{Parse the HPRD flat file...}
\usage{read.hprd(fname, chipProteins)
}
\description{Parse the HPRD flat file}
\details{This function parses the tab delimited flat file of protein-protein interactions
coming from the HPRD (\url{http://www.hprd.org/download}).}
\value{A sparse adjacency matrix}
\author{Marc Johannes \email{M.Johannes@DKFZ.de}}
\arguments{\item{fname}{path to the HPRD flat file.}
\item{chipProteins}{limit the resulting adjacency matrix to certain proteins.}
}
\examples{\dontrun{
hprd <- read.hprd('BINARY_PROTEIN_PROTEIN_INTERACTIONS.txt')
}}

