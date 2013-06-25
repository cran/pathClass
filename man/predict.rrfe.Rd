\name{predict.rrfe}
\alias{predict.rrfe}
\title{Predict Method for RRFE Fits}
\usage{
  \method{predict}{rrfe}(object, newdata, type = "response", ...)
}
\arguments{
  \item{object}{a fitted object of class inheriting from
  'rrfe'}

  \item{newdata}{a matrix with variables to predict}

  \item{type}{\code{response} gives the predictions
  \code{class} gives the predicted classes.}

  \item{...}{currently ignored.}
}
\value{
  the predictions.
}
\description{
  Obtains predictions from a fitted RRFE object.
}
\examples{
\dontrun{
library(pathClass)
data(example_data)
fit = fit.rrfe(x[1:5,], y[1:5], DEBUG=T, mapping=mapping, Gsub=adjacency.matrix)
predict(fit, newdata=x[6:10,])
}
}
\author{
  Marc Johannes \email{JohannesMarc@gmail.com}
}

