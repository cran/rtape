\name{rtapeFilter}
\alias{rtapeFilter}
\title{Rerecord the tape dropping certain objects.}
\usage{rtapeFilter(FUN, fNamesIn, fNameOut=fNamesIn, moreArgs,
    fileFormatOut=guessFileFormat(fNameOut))
}
\description{Rerecord the tape dropping certain objects.}
\details{This function reads the objects from one tape, executes a callback function on them and leaves/appends to the other tape only those for which callback returned \code{TRUE}.}
\note{Overwriting is NOT realised in place, rather by a creation of a temporary file and then using it to overwrite the filtered tape.}
\author{Miron B. Kursa \email{M.Kursa@icm.edu.pl}}
\arguments{\item{FUN}{Callback function which gets the current object and returns a boolean value that directs \code{rtape} to either keep (for \code{TRUE}) or discard it.}
\item{fNamesIn}{Name of the tape file to read; if this argument is a vector of several names, function behaves as reading a single tape made of all those tapes joined in a given order.}
\item{fNameOut}{Name of the tape to which store the output of filtering; if this file is one of the input files, this file is overwritten with the output; otherwise the output is appended to this tape. This must be a one-element vector.}
\item{moreArgs}{Additional arguments to \code{FUN}, given as a list.}
\item{fileFormatOut}{File format; should be left default. See \code{\link{guessFileFormat}} and \code{\link{makeFileFormat}} for details.}
}
\examples{unlink(c('tmp.tape'))
#Record something
for(i in 1:10) rtapeAdd('tmp.tape',i)

#Discard even numbers
rtapeFilter(function(x) (x\%\%2)==1,'tmp.tape')

#Check it out
unlist(rtapeAsList('tmp.tape'))->A
print(A);
stopifnot(all(A==c(1,3,5,7,9)))

#Time to clean up
unlink(c('tmp.tape'))}

