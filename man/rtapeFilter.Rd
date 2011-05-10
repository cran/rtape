\name{rtapeFilter}
\alias{rtapeFilter}
\title{Rerecord the tape dropping certain objects.}
\usage{rtapeFilter(fNamesIn, fNameOut=fNamesIn, FUN, ...,
    fileFormatOut=guessFileFormat(fNameOut))}
\description{Rerecord the tape dropping certain objects.}
\details{This function reads the objects from one tape, executes a callback function on them and leaves/appends to the other tape only those for which callback returned \code{TRUE}.}
\note{Overwriting is NOT realised in place, rather by a creation of a temporary file and then using it to overwrite the filtered tape.}
\author{Miron B. Kursa \email{M.Kursa@icm.edu.pl}}
\arguments{\item{fNamesIn}{Name of the tape file to read; if this argument is a vector of several names, function behaves as reading a single tape made of all those tapes joined in a given order.}
\item{fNameOut}{Name of the tape to which store the output of filtering; if this file is one of the input files, this file is overwritten with the output; otherwise the output is appended to this tape. This must be a one-element vector.}
\item{FUN}{Callback function which gets the current object and returns a boolean value that directs \code{rtape} to either keep (for \code{TRUE}) or discard it.}
\item{...}{Additional arguments to \code{FUN}.}
\item{fileFormatOut}{File format; should be left default. See \code{\link{guessFileFormat}} and \code{\link{makeFileFormat}} for details.}}
