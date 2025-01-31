% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getMetadata.R
\name{getMetadata}
\alias{getMetadata}
\title{Extract metadata information}
\usage{
getMetadata(
  x,
  save = FALSE,
  declared = TRUE,
  OS = "Windows",
  encoding = "UTF-8",
  ...
)
}
\arguments{
\item{x}{A path to a file, or a data frame object}

\item{save}{Logical, save an .R file in the same directory}

\item{declared}{Logical, embed the data as a declared object}

\item{OS}{The target operating system, for the eol - end of line separator,
if saving the file}

\item{encoding}{The character encoding used to read a file}

\item{...}{.Additional arguments for this function (internal uses only)}
}
\value{
An R list roughly equivalent to a DDI Codebook, containing all variables,
their corresponding variable labels and value labels, and (if applicable)
missing values if imported and found.
}
\description{
Extract a list containing the variable labels, value labels and any
available information about missing values.
}
\details{
This function reads an XML file containing a DDI codebook version 2.5, or an
SPSS or Stata file and returns a list containing the variable labels, value
labels, plus some other useful information.

It additionally attempts to automatically detect a type for each variable:
\tabular{rl}{
\strong{\code{cat}}: \tab categorical variable using numeric values\cr
\strong{\code{catchar}}: \tab categorical variable using character values\cr
\strong{\code{catnum}}: \tab categorical variable for which numerical summaries\cr
\tab can be calculated (ex. a 0...10 Likert response scale)\cr
\strong{\code{num}}: \tab numerical\cr
\strong{\code{numcat}}: \tab numerical variable with few enough values (ex. number of
children)\cr
\tab for which a table of frequencies is possible in addition to
frequencies
}

By default, this function extracts the metadata into an R list object, but
when the argument \code{save} is activated, the argument \code{OS} (case insensitive)
can be either:\cr
\code{"Windows"} (default), or \code{"Win"},\cr
\code{"MacOS"}, \code{"Darwin"}, \code{"Apple"}, \code{"Mac"},\cr
\code{"Linux"}.\cr

The end of line separator changes only when the target OS is different from
the running OS.

For the moment, only DDI version 2.5 (Codebook) is supported, but DDI
Lifecycle is planned to be implemented.
}
\examples{
x <- data.frame(
    A = declared(
        c(1:5, -92),
        labels = c(Good = 1, Bad = 5, NR = -92),
        na_values = -92
    ),
    C = declared(
        c(1, -91, 3:5, -92),
        labels = c(DK = -91, NR = -92),
        na_values = c(-91, -92)
    )
)

getMetadata(x)$dataDscr

}
\author{
Adrian Dusa
}
