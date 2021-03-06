\name{incPercentile}

\alias{incPercentile}

\title{Estimation of weighted percentiles}

\description{
The function computes the estimates of weighted percentiles.
}

\usage{
incPercentile(Y, weights = NULL, sort = NULL,
              Dom = NULL,  period = NULL,
              k = c(20L, 80L), dataset = NULL,
              checking = TRUE)
}

\arguments{

  \item{Y}{Study variable (for example equalized disposable income). One dimensional object convertible to one-column \code{data.table} or variable name as character, column number.}

  \item{weights}{Optional weight variable. One dimensional object convert to one-column \code{data.table} or variable name as character, column number.}

  \item{sort}{Optional variable to be used as tie-breaker for sorting. One dimensional object convertible to one-column \code{data.table} or variable name as character, column number.}

  \item{Dom}{Optional variables used to define population domains. If supplied, the estimates of percentiles are computed for each domain. An object convertable to \code{data.table} or variable names as character vector, column numbers.}

  \item{period}{Optional variable for survey period. If supplied, linearization of at-risk-of-poverty threshold is done for each survey period. Object convertible to \code{data.table} or variable names as character, column numbers as numeric vector.}

  \item{k}{A vector of integers between 0 and 100 specifying the percentiles to be computed (0 gives the minimum, 100 gives the maximum).}

  \item{dataset}{Optional survey data object convertible to \code{data.table}.}

  \item{checking}{Optional variable if this variable is TRUE, then function checks data preparation errors, otherwise not checked. This variable by default is TRUE.}

}

\value{
A data.table containing the estimates of weighted income percentiles specified by \code{k}.
}

\references{
Working group on Statistics on Income and Living Conditions (2004) Common cross-sectional EU indicators based on EU-SILC; the gender pay gap. \emph{EU-SILC 131-rev/04}, Eurostat.
}

\examples{
data(eusilc)
incPercentile(Y = "eqIncome", weights = "rb050", Dom = "db040", dataset = eusilc)
}

\seealso{
\code{\link{linarpt}}, \code{\link{linarpr}}, \code{\link{linqsr}}
}

\keyword{Linearization}
