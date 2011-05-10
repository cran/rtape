\name{rtapeAdd}
\alias{rtapeAdd}
\title{Add object to the tape.}
\usage{rtapeAdd(fName, what, skipNULLs=FALSE, fileFormat=guessFileFormat(fName),
    safe=FALSE, retryTime=0.1)
}
\description{Add object to the tape.}
\details{This function serializes and appends a given object on the end of the tape file. If the tape file does not exists, it is created.}
\note{Remember to use the same \code{fileFormat} value to all writes to a certain tape (or use default format guesser to guarantee this); if not, the tape will become unreadable. For the same reason, don't try to put custom headers/footers or append other data inside tape stream.
This function is thread/process safe only if you use \code{safe} mode. However, in this case it may jam on a broken dirlock (for instance when the locking R process crashed during write); you may fix this problem manually by removing the locking dir. Its name is always \code{.rtape_<tape file name>_lock}. Waiting in retry mode is performed via \code{\link{Sys.sleep}}, so it is not a busy wait.}
\author{Miron B. Kursa \email{M.Kursa@icm.edu.pl}}
\arguments{\item{fName}{Name of the tape file.}
\item{what}{Object to be stored.}
\item{skipNULLs}{If true and \code{what} is \code{NULL}, nothing is written to the tape.}
\item{fileFormat}{File format; should be left default. See \code{\link{guessFileFormat}} and \code{\link{makeFileFormat}} for details.}
\item{safe}{If \code{"try"} or \code{"retry"}, rtape will use dirlock to ensure that no other rtape safe appending is in progress. In case of conflict, the function in "try" mode immediately returns \code{FALSE} and does not try again, while in "retry" mode it sleeps \code{retryTime} seconds and tries again till the dirlock is opened.}
\item{retryTime}{If \code{safe} is \code{"retry"}, this parameter sets the interval between writing attempts. Expressed in seconds.}
}
\examples{unlink('tmp.tape')
#Record something on the tape
rtapeAdd('tmp.tape',iris)
rtapeAdd('tmp.tape',sin(1:10))
#Read whole tape to the list, so we could examine it
rtapeAsList('tmp.tape')->stored
print(stored)
unlink('tmp.tape')}

