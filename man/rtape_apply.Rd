\name{rtape_apply}
\alias{rtape_apply}
\title{Iterate over tape, discarding results.}
\usage{rtape_apply(fNames, FUN, ...)}
\description{Iterate over tape, discarding results.}
\details{This function read the tape from the oldest to the newest writes and executes the callback function on each read object. Logically, it is an equivalent to \code{ignore<-lapply(rtapeAsList(fName),FUN,...)}, but it is optimized to store only the currently processed object in the memory and to discard \code{FUN} results as soon as they appear.}
\author{Miron B. Kursa \email{M.Kursa@icm.edu.pl}}
\arguments{\item{fNames}{Name of the tape file to read; if this argument is a vector of several names, function behaves as reading a single tape made of all those tapes joined in a given order.}
\item{FUN}{Callback function.}
\item{...}{Additional parameters to \code{FUN}.}}
\examples{unlink('tmp.tape')
#Record something on the tape
rtapeAdd('tmp.tape',runif(3))
rtapeAdd('tmp.tape',rnorm(3))

#Print tape contents
rtape_apply('tmp.tape',print)
unlink('tmp.tape')}
