\name{linarpt}

\alias{linarpt}

\title{Linearization of at-risk-of-poverty threshold}

\description{
Estimates the at-risk-of-poverty threshold (defined as percentage (usualy 60\%) of equalised disposable income after social transfers quantile (usualy median)) and computes linearized variable for variance estimation.
}

\usage{
linarpt(Y, id = NULL, weight = NULL, 
        sort = NULL, Dom = NULL, period = NULL,
        dataset = NULL, percentage = 60,
        order_quant = 50L, var_name = "lin_arpt",
        checking = TRUE)
}


\arguments{

\item{Y}{Study variable (for example equalised disposable income after social transfers). One dimensional object convertible to one-column \code{data.table} or variable name as character, column number.}

\item{id}{Optional variable for unit ID codes. One dimensional object convertible to one-column \code{data.table} or variable name as character, column number.}

\item{weight}{Optional weight variable. One dimensional object convertible to one-column \code{data.table} or variable name as character, column number.}

\item{sort}{Optional variable to be used as tie-breaker for sorting. One dimensional object convertible to one-column \code{data.table} or variable name as character, column number.}
  
\item{Dom}{Optional variables used to define population domains. If supplied, linearization of at-risk-of-poverty threshold is done for each domain. An object convertible to \code{data.table} or variable names as character vector, column numbers as numeric vector.}

\item{period}{Optional variable for survey period. If supplied, linearization of at-risk-of-poverty threshold is done for each survey period. Object convertible to \code{data.table} or variable names as character, column numbers as numeric vector.}
  
\item{dataset}{Optional survey data object convertable to \code{data.table}.}

\item{percentage}{A numeric value in range \eqn{\left[ 0,100 \right]}{[0,100]} for \eqn{p} in the formula for at-risk-of-poverty threshold computation:
\deqn{\frac{p}{100} \cdot Z_{\frac{\alpha}{100}}.}{p/100 * Z(\alpha/100).}
For example, to compute poverty threshold equal to 60\% of some income quantile, \eqn{p} should be set equal to 60.}
  
\item{order_quant}{A integer value in range \eqn{\left[ 0,100 \right]}{[0,100]} for \eqn{\alpha} in the formula for at-risk-of-poverty threshold computation:
\deqn{\frac{p}{100} \cdot Z_{\frac{\alpha}{100}}.}{p/100 * Z(\alpha/100).}
For example, to compute poverty threshold equal to some percentage of median income, \eqn{\alpha} should be set equal to 50.}

\item{var_name}{A character specifying the name of the linearized variable.}

\item{checking}{Optional variable if this variable is TRUE, then function checks data preparation errors, otherwise not checked. This variable by default is TRUE.}

}


\details{The implementation strictly follows the Eurostat definition.}


\value{

A list with three objects are returned:

\item{quantile}{A \code{data.table} containing the estimated value of the quintile used for at-risk-of-poverty threshold estimation.}
  
\item{value}{A \code{data.table} containing the estimated at-risk-of-poverty threshold (in percentage).}
  
\item{lin}{A \code{data.table} containing the linearized variables of the at-risk-of-poverty threshold (in percentage).}

}


\references{

Working group on Statistics on Income and Living  Conditions (2004) Common cross-sectional EU indicators based on EU-SILC; the gender pay gap. \emph{EU-SILC 131-rev/04}, Eurostat. \cr
  
Guillaume Osier (2009). Variance estimation for complex indicators of poverty and inequality. \emph{Journal of the European Survey Research Association}, Vol.3, No.3, pp. 167-195, ISSN 1864-3361, URL \url{http://ojs.ub.uni-konstanz.de/srm/article/view/369}. \cr

Jean-Claude Deville (1999). Variance estimation for complex statistics and estimators: linearization and residual techniques. Survey Methodology, 25, 193-203, URL \url{http://www.statcan.gc.ca/pub/12-001-x/1999002/article/4882-eng.pdf}. \cr

}


\seealso{
\code{\link{linarpr}}, \code{\link{incPercentile}}, \code{\link{varpoord}} , \code{\link{vardcrospoor}}, \code{\link{vardchangespoor}}
}


\examples{

data(eusilc)

dati <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)

# Full population
d1 <- linarpt(Y = "eqIncome", id = "IDd",
              weight = "rb050", Dom = NULL,
              dataset = dati, percentage = 60,
              order_quant = 50L)
d1$value

\dontrun{
# By domains
d2 <- linarpt(Y = "eqIncome", id = "IDd",
              weight = "rb050", Dom = "db040",
              dataset = dati, percentage = 60,
              order_quant = 50L)
d2$value
} 

}


\keyword{Linearization}
