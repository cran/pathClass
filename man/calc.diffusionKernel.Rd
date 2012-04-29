\name{calc.diffusionKernel}
\alias{calc.diffusionKernel}
\title{Calculation of diffusion kernel matrix...}
\usage{calc.diffusionKernel(L, is.adjacency=FALSE, beta=0)
}
\description{Calculation of diffusion kernel matrix}
\details{Calculation of diffusion kernel matrix}
\value{the diffusion kernel}
\references{Schoelkopf B, Tsuda K, Vert JP: Kernel Methods in Computational Biology, MIT Press; 2004.}
\author{Marc Johannes \email{JohannesMarc@gmail.com}}
\arguments{\item{L}{Laplacian or transition probability matrix}
\item{is.adjacency}{is L a laplace or adjacency matrix}
\item{beta}{beta parameter of the diffusion kernel. beta controls the extent of diffusion.}
}

