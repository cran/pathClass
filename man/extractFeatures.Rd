\name{extractFeatures}
\alias{extractFeatures}
\title{Extracts features which have been choosen by the classifier(s).}
\usage{
  extractFeatures(res, toFile = FALSE,
    fName = "ClassificationFeatures.csv")
}
\arguments{
  \item{res}{A result of \code{crossval}.}

  \item{toFile}{Should the results be printed into a
  CSV-file.}

  \item{fName}{the name of the file to save the results
  in.}
}
\value{
  a \code{data.frame} indicating the number of times a
  feature has been choosen.
}
\description{
  This function extracts the features which have been
  selected by the classifiers during the cross-validation
  along with the number of times they have been choosen.
  When, for example, performing a 5 times repeated 10-fold
  cross-validation the maximum number a feature can be
  choosen is 50.
}
\examples{
\dontrun{
library(Biobase)
data(sample.ExpressionSet)
x <- t(exprs(sample.ExpressionSet))
y <- factor(pData(sample.ExpressionSet)$sex)
res.rfe <- crossval(x,y,DEBUG=TRUE,theta.fit=fit.rfe,folds=2,repeats=1,parallel=TRUE,Cs=10^(-3:3))
extractFeatures(res.rfe, toFile=FALSE)
}
}
\author{
  Marc Johannes \email{JohannesMarc@gmail.com}
}

