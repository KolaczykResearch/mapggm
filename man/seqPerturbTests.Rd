% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/findPerturbations.R
\name{seqPerturbTests}
\alias{seqPerturbTests}
\title{Sequentially test for perturbations at a series of locations}
\usage{
seqPerturbTests(Y, Omega, Sigma, perturb.mat, return.value = "stat")
}
\arguments{
\item{Y}{matrix or data frame (rows=subjects, columns=variables)}

\item{Omega}{precision matrix}

\item{Sigma}{covariance matrix}

\item{perturb.mat}{matrix indicating sets of which variables to test for perturbations}

\item{return.value}{return statistics (\code{'stat'}) or p-values (\code{'pval'})}
}
\value{
test statistics for perturbations at each of perturb.mat columns
}
\description{
Given a matrix of possible perturbation locations, perform the sequential
testing procedure described by Griffin et al. Return either test statistics
or p-values.
}
\examples{
library(mvtnorm)
Omega <- matrix(0, nrow=6, ncol=6)
Omega[1:4,1:4] <- -1
diag(Omega) <- 6
Sigma <- solve(Omega)
mu <- c(1,1,0,0,0,0)
Y <- rmvnorm(20, mean=Sigma \%*\% mu, sigma=Sigma)
perturb.mat <- matrix(c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE,
                        FALSE, FALSE, TRUE, TRUE, FALSE, FALSE), ncol=2)
perturbTests(Y, Omega, Sigma, perturb.mat, return.value='stat') # initial ranking
seqPerturbTests(Y, Omega, Sigma, perturb.mat, return.value='stat') # sequential adjusted
}
\references{
Griffin, P.J., Johnson, W.E., and Kolaczyk, E.K. Detection of multiple
perturbations in multi-omics biological networks (under review)
}

