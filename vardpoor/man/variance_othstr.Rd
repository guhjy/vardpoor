\name{variance_othstr}
\alias{variance_othstr}
\title{Variance estimation for sample surveys by the new stratification}
\description{Computes the variance estimation by the new stratification.}
\usage{variance_othstr(Y, H, H2, w_final, N_h=NULL, N_h2, s2g=FALSE, period=NULL, dataset=NULL)}
\arguments{
  \item{Y}{either a numeric data.frame, matrix, data.table with
  column names giving the variables of interest, or (if \code{dataset} 
  is not \code{NULL}) a character string, an integer or a
  logical vector (length is the same as 'dataset' column count)
  specifying the corresponding column of \code{dataset}.}

  \item{H}{either 1 column data.frame, matrix, data.table with
  column name giving elements  indicating the unit stratum,
  or (if \code{dataset} is not \code{NULL}) a character string,
  an integer or a logical vector (length is the same as 'dataset'
  column count) specifying the corresponding column of \code{dataset}.}

  \item{H2}{either 1 column data.frame, matrix, data.table with
  column name giving elements  indicating the unit new stratum,
  or (if \code{dataset} is not \code{NULL}) a character string,
  an integer or a logical vector (length is the same as 'dataset'
  column count) specifying the corresponding column of \code{dataset}.}

  \item{w_final}{either a numeric vector, 1 column data.frame, matrix,
  data.table giving the final weights, or (if \code{dataset} is not
  \code{NULL}) a character string,  an integer or a logical vector
  (length is the same as 'dataset' column count) specifying the
  corresponding column of \code{dataset}.}

  \item{N_h}{either a matrix giving the first column - stratum, but
  the second column - the total of the population in each stratum.}

  \item{N_h2}{either a matrix giving the first column - new stratum, but
  the second column - the total of the population in each stratum.}

  \item{s2g}{by default is FALSE; calculate variance, but if s2g is TRUE, 
  then variance estimation is taken as S^2g value.}

  \item{period}{optional; either a data.frame, matrix, data.table
  with column names giving different periods, or (if 
  \code{dataset} is not \code{NULL}) character strings,
  integers or a logical vectors (length is the same as 
  'dataset' column count) specifying the corresponding
  columns of \code{dataset}. If supplied, the values for
  each period are computed independently.
  }

  \item{dataset}{an optional name of the individual dataset
  \code{data.frame}.}

}
\value{a \code{data.table} containing the  values of the
  variance estimation by totals.
}
\details{
It is possible to compute population size \eqn{M_g} from sampling frame. The standard deviation of \eqn{g}-th stratum is

\deqn{S_g^2 =\frac{1}{M_g-1} \sum\limits_{k=1}^{M_g} \left(y_{gk}-\bar{Y}_g \right)^2= \frac{1}{M_g-1} \sum\limits_{k=1}^{M_g} y_{gk}^2 - \frac{M_g}{M_g-1}\bar{Y}_g^2} 

\eqn{\sum\limits_{k=1}^{M_g} y_{gk} ^2} and \eqn{\bar{Y}_g^2} have to be estimeted to estimate \eqn{S_g^2}. Estimate of \eqn{\sum\limits_{k=1}^{M_g} y_{gk}^2} is 
\eqn{\sum\limits_{h=1}^{H} \frac{N_h}{n_h} \sum\limits_{i=1}^{n_h} y_{gi}^2 z_{hi}}, where
\eqn{ z_{hi} = \left\{
\begin{array}{ll}
0, & h_i \in \theta_g \\
1, & h_i \notin \theta_g
\end{array}
\right. }, \eqn{\theta_g} is the index group of successfully surveyed units belonging to \eqn{g}-th stratum. Estimate of \eqn{\bar{Y}_g^2} is 
\deqn{\hat{\bar{Y}}_g^2=\left( \hat{\bar{Y}}_g \right)^2-\hat{Var} \left(\hat{\bar{Y}} \right)}

\deqn{\hat{\bar{Y}}_g =\frac{\hat{Y}_g}{M_g}= \frac{1}{M_g} \sum\limits_{h=1}^{H} \frac{N_h}{n_h} \sum\limits_{i=1}^{n_h} y_{hi} z_{hi}}

\deqn{\hat{Var} \left(\hat{\bar{Y}} \right) =\frac{1}{M_g^2} \sum\limits_{h=1}^{H} N_h^2 \left(\frac{1}{n_h} - \frac{1}{N_h}\right) \sigma_h^2}

\deqn{\sigma_h^2 =\frac{1}{n_h-1} \sum\limits_{i=1}^{n_h} \left(y_{hi} z_{hi} - \frac{1}{n_h} \sum\limits_{t=1}^{n_h} y_{ht} z_{ht} \right)^2}

So the estimate of \eqn{S_g^2} is

\eqn{s_g^2=\frac{1}{M_g-1} \sum\limits_{h=1}^{H} \frac{N_h}{n_h} \sum\limits_{i=1}^{n_h} y_{hi}^2 z_{hi} -}

\eqn{-\frac{M_g}{M_g-1} \left( \left( \frac{1}{M_g} \sum\limits_{h=1}^{H} \frac{N_h}{n_h} \sum\limits_{i=1}^{n_h} y_{hi} z_{hi} \right)^2 - \frac{1}{M_g^2} \sum\limits_{h=1}^{H} N_h^2 \left(\frac{1}{n_h} - \frac{1}{N_h}\right) \frac{1}{n_h-1} \sum\limits_{i=1}^{n_h} \left(y_{hi} z_{hi} - \frac{1}{n_h} \sum\limits_{t=1}^{n_h} y_{ht} z_{ht} \right)^2 \right)} 

Two conditions have to realize to estimate \eqn{S_g^2: n_h>1, \forall g} and \eqn{\theta_g \ne , \forall g.}

Variance of \eqn{\hat{Y}} is
\deqn{ Var\left( \hat{Y} \right) = \sum\limits_{g=1}^{G} M_g^2 \left( \frac{1}{m_g} - \frac{1}{M_g} \right) S_g^2 }


Estimate of \eqn{\hat{Var}\left( \hat{Y} \right)} is

\deqn{\hat{Var}\left( \hat{Y} \right) = \sum\limits_{g=1}^{G} M_g^2 \left( \frac{1}{m_g} - \frac{1}{M_g} \right)s_g^2}

}
\references{ 
M. Liberts. (2004) Non-response Analysis and Bias Estimation in a Survey on Transportation of Goods by Road.
}
\examples{
period=NULL
dataset=NULL
Y <- data.table(matrix(runif(50)*5, ncol=5))

H <- data.table(H=trunc(5*runif(10)))
H2 <- data.table(H2=trunc(3*runif(10)))

N_h <- data.table(matrix(0:4,5,1))
setnames(N_h, names(N_h), "H")
N_h[, sk:=10]

N_h2 <- data.table(matrix(0:2,3,1))
setnames(N_h2, names(N_h2), "H2")
N_h2[, sk2:=4]

w_final <- rep(2, 10)
PSU <- 1:10
variance_othstr(Y, H, H2, PSU, w_final, N_h=N_h, N_h2=N_h2, period=NULL, dataset=NULL) 

} 
\seealso{
  \code{\link{domain}},         \code{\link{lin.ratio}},    \code{\link{linarpr}},
  \code{\link{linarpt}},        \code{\link{lingini}},      \code{\link{lingini2}},
  \code{\link{lingpg}},         \code{\link{linpoormed}},   \code{\link{linqsr}},
  \code{\link{linrmpg}},        \code{\link{residual_est}}, \code{\link{vardom}},
  \code{\link{vardom_othstr}},  \code{\link{vardomh}},      \code{\link{varpoord}}
} 
\keyword{vardpoor}