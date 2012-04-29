\name{predict.graphSVM}
\alias{predict.graphSVM}
\title{Predict Method for Graph-SVM Fits...}
\usage{\method{predict}{graphSVM}(object, newdata, type="response", ...)
}
\description{Predict Method for Graph-SVM Fits}
\details{Obtains predictions from a fitted graphSVM object.}
\value{the predictions.}
\author{Marc Johannes \email{JohannesMarc@gmail.com}}
\arguments{\item{object}{a fitted object of class inheriting from 'graphSVM'}
\item{newdata}{a matrix with variables to predict}
\item{type}{\code{response} gives the predictions \code{class} gives the predicted classes.}
\item{...}{currently ignored.}
}
\examples{\dontrun{
library(pathClass)
data(example_data)
matched <- matchMatrices(x=x, adjacency=adjacency.matrix, mapping=mapping)
dk <- calc.diffusionKernel(L=matched$adjacency, is.adjacency=TRUE, beta=0) # beta should be tuned
fit <- fit.graph.svm(matched$x[1:5,], y[1:5], DEBUG=TRUE, mapping=matched$mapping, diffusionKernel=dk)
predict(fit, newdata=matched$x[6:10,])
}}

