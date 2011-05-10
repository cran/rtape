\name{rtapeRerecord}
\alias{rtapeRerecord}
\title{Rerecord the tape.}
\usage{rtapeRerecord(fNamesIn, fNameOut=fNamesIn, FUN, ..., skipNULLs=FALSE,
    fileFormatOut=guessFileFormat(fNameOut))}
\description{Rerecord the tape.}
\details{This function reads the objects from one tape, executes a callback function on them and updates them with/appends to the other tape the objects that the callback has returned.}
\note{Overwriting is NOT realised in place, rather by a creation of a temporary file and then using it to overwrite the filtered tape.}
\author{Miron B. Kursa \email{M.Kursa@icm.edu.pl}}
\arguments{\item{fNamesIn}{Name of the tape file to read; if this argument is a vector of several names, function behaves as reading a single tape made of all those tapes joined in a given order.}
\item{fNameOut}{Name of the tape to which store the output of filtering; if this file is one of the input files, this file is overwritten with the output; otherwise the output is appended to this tape. This must be a one-element vector.}
\item{FUN}{Callback function which transforms the objects.}
\item{...}{Additional arguments to \code{FUN}.}
\item{skipNULLs}{If true, all the \code{NULL}s returned by \code{FUN} are not appended to the output. Useful to remove some objects from the tape; see \code{\link{rtapeFilter}} for convenience function to do just this task.}
\item{fileFormatOut}{File format; should be left default. See \code{\link{guessFileFormat}} and \code{\link{makeFileFormat}} for details.}}
\examples{unlink(c('tmp.tape','tmp2.tape'))
#Record something
for(i in 1:10) rtapeAdd('tmp.tape',i)
#Multiply each object by two
rtapeRerecord('tmp.tape','tmp2.tape','*',2)
#Check it out
unlist(rtapeAsList('tmp.tape'))->A
B<-unlist(rtapeAsList('tmp2.tape'))
print(A);print(B)
stopifnot(all(A==B/2))
unlink(c('tmp.tape','tmp2.tape'))}
