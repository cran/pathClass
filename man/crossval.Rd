\name{crossval}
\alias{crossval}
\title{Performs cross-validation with a specified algorithm...}
\usage{crossval(x, y, theta.fit, folds=10, repeats=1, parallel=TRUE, cores,
    DEBUG=FALSE, ...)
}
\description{Performs cross-validation with a specified algorithm}
\details{Performs a cross-validation using the specified algorithms.
If package multicore is loaded the cross-validation will be
performed in parallel. If the multicore package is loaded but a parallel
cross-validation is not wanted \code{parallel} can be set to \code{FALSE}.
If parallel cross-validation is desired the number of cores can be choosen by
using the \code{cores} parameter.}
\value{a list with the results of the cross-validation. See details for more information.}
\note{Parallel cross-validation can only be performed if the multicore-package
was loaded prior to calling this function.}
\seealso{\code{\link{fit.rrfe}}, \code{\link{fit.rfe}}, \code{\link{fit.graph.svm}}, \code{\link{fit.networkBasedSVM}}}
\author{Marc Johannes \email{M.Johannes@DKFZ.de}}
\arguments{\item{x}{a p x n matrix of expression measurements with p samples and n genes.}
\item{y}{a factor of length p comprising the class labels.}
\item{theta.fit}{the method to learn a decision boundary. Currently available are \code{\link{fit.rrfe}}, \code{\link{fit.rfe}}, \code{\link{fit.graph.svm}}, \code{\link{fit.networkBasedSVM}}}
\item{folds}{number of folds to perform}
\item{repeats}{number of how often to repeat the x-fold cross-validation}
\item{parallel}{should the cross-validation be performed in parallel
i.e. on several cpu-cores. (see also \code{Details} section)}
\item{cores}{specify the number of cores that should be used for parallel cross-validation.}
\item{DEBUG}{should debugging information be plotted.
Defaults to n - 1 cores.}
\item{...}{additional parameters to theta fit.}
}
\examples{library(Biobase)
data(sample.ExpressionSet)
x <- t(exprs(sample.ExpressionSet))
y <- factor(pData(sample.ExpressionSet)$sex)
res.rfe <- crossval(x,y,DEBUG=TRUE,theta.fit=fit.rfe,folds=2,repeats=1,parallel=TRUE,Cs=10^(-3:3))}

