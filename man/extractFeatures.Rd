\name{extractFeatures}
\alias{extractFeatures}
\title{Extracts features which have been choosen by the classifier(s).}
\usage{extractFeatures(res, toFile=FALSE, fName="ClassificationFeatures.csv")
}
\description{Extracts features which have been choosen by the classifier(s).}
\details{This function extracts the features which have been selected by the classifiers
during the cross-validation along with the number of times they have been choosen.
When, for example, performing a 5 times repeated 10-fold cross-validation the maximum
number a feature can be choosen is 50.}
\value{a \code{data.frame} indicating the number of times a feature has been choosen.}
\author{Marc Johannes \email{M.Johannes@DKFZ.de}}
\arguments{\item{res}{A result of \code{crossval}.}
\item{toFile}{Should the results be printed into a CSV-file.}
\item{fName}{the name of the file to save the results in.}
}
\examples{library(Biobase)
data(sample.ExpressionSet)
x <- t(exprs(sample.ExpressionSet))
y <- factor(pData(sample.ExpressionSet)$sex)
res.rfe <- crossval(x,y,DEBUG=TRUE,theta.fit=fit.rfe,folds=2,repeats=1,parallel=TRUE,Cs=10^(-3:3))
extractFeatures(res.rfe, toFile=FALSE)}

