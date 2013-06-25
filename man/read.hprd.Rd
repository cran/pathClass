\name{read.hprd}
\alias{read.hprd}
\title{Parse the HPRD flat file}
\usage{
  read.hprd(fname, chipProteins = NULL)
}
\arguments{
  \item{fname}{path to the HPRD flat file.}

  \item{chipProteins}{limit the resulting adjacency matrix
  to certain proteins.}
}
\value{
  An adjacency matrix
}
\description{
  This function parses the tab delimited flat file of
  protein-protein interactions coming from the HPRD
  (\url{http://www.hprd.org/download}).
}
\examples{
\dontrun{
hprd <- read.hprd('BINARY_PROTEIN_PROTEIN_INTERACTIONS.txt')
}
}
\author{
  Marc Johannes \email{JohannesMarc@gmail.com}
}

