% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ti_container.R
\name{ti_grandprix}
\alias{ti_grandprix}
\title{Inferring a trajectory inference using \href{https://doi.org/10.1101/227843}{grandprix}}
\usage{
ti_grandprix(n_latent_dims = 2L, n_inducing_points = 40L,
  latent_prior_var = 0.1, latent_var = 0.028)
}
\arguments{
\item{n_latent_dims}{\cr
integer; default: 2L; possible values between 1 and 10}

\item{n_inducing_points}{\cr
integer; default: 40L; possible values between 10 and 500}

\item{latent_prior_var}{\cr}

\item{latent_var}{\cr}
}
\value{
The trajectory model
}
\description{
Will generate a trajectory using \href{https://doi.org/10.1101/227843}{grandprix}. This method was wrapped inside a \href{https://github.com/dynverse/dynmethods/tree/master/containers/grandprix}{container}.
}
\details{
The original code of this method is available \href{https://github.com/ManchesterBioinference/GrandPrix}{here}.

The method is described in: \href{https://doi.org/10.1101/227843}{Ahmed, S., Rattray, M., Boukouvalas, A., 2017. GrandPrix: Scaling up the Bayesian GPLVM for single-cell data.}
}
