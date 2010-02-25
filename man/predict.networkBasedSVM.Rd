\name{predict.networkBasedSVM}
\alias{predict.networkBasedSVM}
\title{Predict Method for Network-based SVM Fits...}
\usage{predict.networkBasedSVM(object, newdata, ...)
}
\description{Predict Method for Network-based SVM Fits}
\details{Obtains predictions from a fitted networkBasedSVM object.}
\value{the predictions.}
\author{Marc Johannes \email{M.Johannes@DKFZ.de}}
\arguments{\item{object}{a fitted object of class inheriting from 'networkBasedSVM'}
\item{newdata}{a matrix with variables to predict}
\item{...}{currently ignored.}
}
\examples{\dontrun{
library(pathClass)
data(example_data)
matched <- matchMatrices(x=x, adjacency=adjacency.matrix, mapping=mapping)
ad.list <- as.adjacencyList(matched$adjacency)
fit = fit.networkBasedSVM(matched$x[1:5,], y[1:5], DEBUG=TRUE,  adjacencyList=ad.list, lambdas=10^(-1:2), sd.cutoff=50)
predict(fit, newdata=matched$x[6:10,])
}}

