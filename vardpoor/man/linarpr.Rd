\name{linarpr}

\alias{linarpr}

\title{Linearization of at-risk-of-poverty rate}

\description{
Estimates the at-risk-of-poverty rate (defined as the proportion of persons with equalized disposable income below at-risk-of-poverty threshold) and computes linearized variable for variance estimation.
}


\usage{
linarpr(Y, id = NULL, weight = NULL,
        Y_thres = NULL, wght_thres = NULL,
        sort = NULL, Dom = NULL, period = NULL,
        dataset = NULL, percentage = 60,
        order_quant = 50L, var_name = "lin_arpr",
        checking = TRUE)
}


\arguments{
\item{Y}{Study variable (for example equalized disposable income). One dimensional object convertible to one-column \code{data.table} or variable name as character, column number).}

\item{id}{Optional variable for unit ID codes. One dimensional object convertible to one-column \code{data.table} or variable name as character, column number or logical vector).}

\item{weight}{Optional weight variable. One dimensional object convertible to one-column \code{data.table} or variable name as character, column number or logical vector).}

\item{Y_thres}{Variable (for example equalized disposable income) used for computation and linearization of poverty threshold. One dimensional object convertible to one-column \code{data.table} or variable name as character, column number. Variable specified for \code{inc} is used as \code{income_thres} if \code{income_thres} is not defined.}

\item{wght_thres}{Weight variable used for computation and linearization of poverty threshold. One dimensional object convertible to one-column \code{data.table} or variable name as character, column number or logical vector. Variable specified for \code{weight} is used as \code{wght_thres} if \code{wght_thres} is not defined.}

\item{sort}{Optional variable to be used as tie-breaker for sorting. One dimensional object convertible to one-column \code{data.table} or variable name as character, column number.}

\item{Dom}{Optional variables used to define population domains. If supplied, linearization of at-risk-of-poverty threshold is done for each domain. An object convertible to \code{data.table} or variable names as character vector, column numbers as numeric vector.}

\item{period}{Optional variable for survey period. If supplied, linearization of at-risk-of-poverty threshold is done for each survey period. Object convertible to \code{data.table} or variable names as character, column numbers as numeric vector.}

\item{dataset}{Optional survey data object convertible to \code{data.table}.}

\item{percentage}{A numeric value in range \eqn{\left[ 0,100 \right]}{[0,100]} for \eqn{p} in the formula for at-risk-of-poverty threshold computation:
\deqn{\frac{p}{100} \cdot Z_{\frac{\alpha}{100}}.}{p/100 * Z(\alpha/100).}
For example, to compute at-risk-of-poverty threshold equal to 60\% of some income quantile, \eqn{p} should be set equal to 60.}
  
\item{order_quant}{A integer value in range \eqn{\left[ 0,100 \right]}{[0,100]} for \eqn{\alpha} in the formula for at-risk-of-poverty threshold computation:
\deqn{\frac{p}{100} \cdot Z_{\frac{\alpha}{100}}.}{p/100 * Z(\alpha/100).}
For example, to compute at-risk-of-poverty threshold equal to some percentage of median income, \eqn{\alpha} should be set equal to 50.}

\item{var_name}{A character specifying the name of the linearized variable.}

\item{checking}{Optional variable if this variable is TRUE, then function checks data preparation errors, otherwise not checked. This variable by default is TRUE.}
}


\details{The implementation strictly follows the Eurostat definition.}


\value{
A list with four objects are returned:
  
\item{quantile}{A \code{data.table} containing the estimated value of the quintile used for at-risk-of-poverty threshold estimation.}
  
\item{threshold}{A \code{data.table} containing the estimated at-risk-of-poverty threshold.}
  
\item{value}{A \code{data.table} containing the estimated at-risk-of-poverty rate (in percentage).}
  
\item{lin}{A \code{data.table} containing the linearized variables of the at-risk-of-poverty rate (in percentage).}

}


\references{
Working group on Statistics on Income and Living Conditions (2004) Common cross-sectional EU indicators based on EU-SILC; the gender pay gap. \emph{EU-SILC 131-rev/04}, Eurostat. \cr
  
Guillaume Osier (2009). Variance estimation for complex indicators of poverty and inequality. \emph{Journal of the European Survey Research Association}, Vol.3, No.3, pp. 167-195, ISSN 1864-3361, URL \url{http://ojs.ub.uni-konstanz.de/srm/article/view/369}. \cr

Jean-Claude Deville (1999). Variance estimation for complex statistics and estimators: linearization and residual techniques. Survey Methodology, 25, 193-203, URL \url{http://www.statcan.gc.ca/pub/12-001-x/1999002/article/4882-eng.pdf}. \cr
}


\seealso{
\code{\link{linarpt}}, \code{\link{varpoord}} , \code{\link{vardcrospoor}}, \code{\link{vardchangespoor}}
}


\examples{
data(eusilc)

dati <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)

# Full population
d <- linarpr(Y = "eqIncome", id = "IDd",
             weight = "rb050", Dom = NULL,
             dataset = dati, percentage = 60,
             order_quant = 50L)
d$value

\dontrun{
# By domains
dd <- linarpr(Y = "eqIncome", id = "IDd",
              weight = "rb050", Dom = "db040",
              dataset = dati, percentage = 60,
              order_quant=50L)}
}

\keyword{Linearization}
