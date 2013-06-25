\name{predict.rfe}
\alias{predict.rfe}
\title{Predict Method for RFE Fits}
\usage{
  \method{predict}{rfe}(object, newdata, type = "response", ...)
}
\arguments{
  \item{object}{a fitted object of class inheriting from
  'rfe'}

  \item{newdata}{a matrix with variables to predict}

  \item{type}{\code{response} gives the predictions
  \code{class} gives the predicted classes.}

  \item{...}{currently ignored.}
}
\value{
  the predictions.
}
\description{
  Obtains predictions from a fitted RFE object.
}
\examples{
\dontrun{
library(pathClass)
data(example_data)
fit = fit.rfe(x[1:5,], y[1:5], DEBUG=T)
predict(fit, newdata=x[6:10,])
}
}
\author{
  Marc Johannes \email{JohannesMarc@gmail.com}
}

