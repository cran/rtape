\name{guessFileFormat}
\alias{guessFileFormat}
\title{Automatically pick proper tape file format.}
\usage{guessFileFormat(fName)}
\description{Automatically pick proper tape file format.}
\details{This function guesses the tape file format from the file header or assumes default (gzip) if given non-existing file name. Main package functions use this routine to automatically set up file format; if you really need to control it, see \code{\link{makeFileFormat}}.}
\value{The function to be passed to the \code{fileFormat*} arguments of other \code{rtape}'s functions.}
\author{Miron B. Kursa \email{M.Kursa@icm.edu.pl}}
\arguments{\item{fName}{Name of the the file to guess format of; if the file is not-existing, the function returns default file format.}}
