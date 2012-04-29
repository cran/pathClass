\name{predict.rfe}
\alias{predict.rfe}
\title{Predict Method for RFE Fits...}
\usage{\method{predict}{rfe}(object, newdata, type="response", ...)
}
\description{Predict Method for RFE Fits}
\details{Obtains predictions from a fitted RFE object.}
\value{the predictions.}
\author{Marc Johannes \email{JohannesMarc@gmail.com}}
\arguments{\item{object}{a fitted object of class inheriting from 'rfe'}
\item{newdata}{a matrix with variables to predict}
\item{type}{\code{response} gives the predictions \code{class} gives the predicted classes.}
\item{...}{currently ignored.}
}
\examples{\dontrun{
library(pathClass)
data(example_data)
fit = fit.rfe(x[1:5,], y[1:5], DEBUG=T)
predict(fit, newdata=x[6:10,])
}}

