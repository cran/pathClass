\name{plot.pathClassResult}
\alias{plot.pathClassResult}
\title{Prints the result of one or more cross-validation run(s)...}
\usage{plot.pathClassResult(x, label="", toFile=TRUE, fname="Result", switchLabels=FALSE,
    avg="horizontal", spread.estimate="boxplot", ...)
}
\description{Prints the result of one or more cross-validation run(s)}
\details{This function creates boxplots of the distribution of AUC for each reapeat of the cross-validation.
In a second plot the ROC curve of the AUCs is shown. If your result contains more than one cross-validation
result these are plotted one after the other.}
\author{Marc Johannes \email{M.Johannes@DKFZ.de}}
\arguments{\item{x}{A result of \code{crossval}.}
\item{label}{the main label of the plots.}
\item{toFile}{Should the results plotted into PDF file(s). If your result contains more than one cross-validation
one PDF file is created for each result.}
\item{fname}{the name of the file to save the results in.}
\item{switchLabels}{If your AUC is below 0.5 you can switch the labels to get an AUC above 0.5.}
\item{avg}{the method for averaging the AUCs of several repeats. See \code{'\linkS4class{performance}'} for more information.}
\item{spread.estimate}{method to show the variation around the average of the ROC curve. See \code{'\linkS4class{performance}'} for more information.}
\item{...}{currently ignored.}
}
\examples{library(Biobase)
data(sample.ExpressionSet)
x <- t(exprs(sample.ExpressionSet))
y <- factor(pData(sample.ExpressionSet)$sex)
res.rfe <- crossval(x,y,DEBUG=TRUE,theta.fit=fit.rfe,folds=2,repeats=1,parallel=TRUE,Cs=10^(-3:3))
plot(res.rfe, toFile=FALSE)}

