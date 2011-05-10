\name{rtapeLapply}
\alias{rtapeLapply}
\title{Iterate over tape, gathering results.}
\usage{rtapeLapply(fNames, FUN, ...)
}
\description{Iterate over tape, gathering results.}
\details{This function read the tape from the oldest to the newest writes and executes the callback function on each read object. Logically, it is an equivalent to \code{lapply(rtapeAsList(fName),FUN,...)}, but it is optimized to store only the currently processed object in the memory.}
\value{A list containing results of \code{FUN} calls.}
\author{Miron B. Kursa \email{M.Kursa@icm.edu.pl}}
\arguments{\item{fNames}{Name of the tape file to read; if this argument is a vector of several names, function behaves as reading a single tape made of all those tapes joined in a given order.}
\item{FUN}{Callback function.}
\item{...}{Additional parameters to \code{FUN}.}
}
\examples{unlink('tmp.tape')
#Record something on the tape
rtapeAdd('tmp.tape',runif(3))
rtapeAdd('tmp.tape',rnorm(3))

#Print tape contents
rtape_apply('tmp.tape',print)
unlink('tmp.tape')}

