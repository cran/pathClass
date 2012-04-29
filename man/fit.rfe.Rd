\name{fit.rfe}
\alias{fit.rfe}
\title{Recursive Feature Elimination (RFE)...}
\usage{fit.rfe(x, y, DEBUG=FALSE, scale=c("center", "scale"), Cs=10^c(-3:3),
    stepsize=0.1)
}
\description{Recursive Feature Elimination (RFE)}
\details{Implementation of the Recursive Feature Elimination (RFE) algorithm.}
\value{a RFE fit object.
\code{features} = selected features
\code{error.bound} = span bound of the model
\code{fit} = fitted SVM model}
\note{The optimal number of features is found by using the span estimate. See Chapelle, O., Vapnik, V., Bousquet, O., and Mukherjee, S. (2002). Choosing multiple parameters for support vector machines. \emph{Machine Learning}, 46(1), 131-159.}
\author{Marc Johannes \email{JohannesMarc@gmail.com}}
\arguments{\item{x}{a p x n matrix of expression measurements with p samples and n genes.}
\item{y}{a factor of length p comprising the class labels.}
\item{DEBUG}{should debugging information be plotted.}
\item{scale}{a character vector defining if the data should be centered and/or scaled.
Possible values are \emph{center} and/or \emph{scale}. Defaults to \code{c('center', 'scale')}.}
\item{Cs}{soft-margin tuning parameter of the SVM. Defaults to \code{10^c(-3:3)}.}
\item{stepsize}{amount of features that are discarded in each step of the feature elimination. Defaults to 10\%.}
}
\examples{\dontrun{
library(Biobase)
data(sample.ExpressionSet)
x <- t(exprs(sample.ExpressionSet))
y <- factor(pData(sample.ExpressionSet)$sex)
res.rfe <- crossval(x,y,DEBUG=TRUE,theta.fit=fit.rfe,folds=2,repeats=1,parallel=TRUE,Cs=10^(-3:3))
}}

