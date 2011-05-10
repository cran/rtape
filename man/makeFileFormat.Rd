\name{makeFileFormat}
\alias{makeFileFormat}
\title{Setting tape file format/compression.}
\usage{makeFileFormat(compression="gz", compressionLevel=ifelse(compression == "bz", 9, 6))
}
\description{Setting tape file format/compression.}
\details{\code{rtape} uses R connections to store data; this function creates a function that is used to create a connection by the other \code{rtape}'s functions. Changing its parameters allows advanced user to change compression format/level and thus control the speed/file size trade-off. The default values (gzip, 6th level of compression) should give performance similar to this of \code{\link{save}}.}
\value{The function to be passed to the \code{fileFormat*} arguments of other \code{rtape}'s functions.}
\note{Effectively, this function is needed only to set up the format of the new, blank tape (i.e. in the first call to \code{\link{rtapeAdd}} or for altering compression along with tape reconstruction operations performed by \code{\link{rtapeRerecord}} or \code{\link{rtapeFilter}}); when dealing with already existing tapes, the \code{\link{guessFileFormat}} will recognise the right format from the file header.}
\author{Miron B. Kursa \email{M.Kursa@icm.edu.pl}}
\arguments{\item{compression}{Name of the compression algorithm; should be one of the \code{"gz"}, \code{"bz"}, \code{"xz"}. Exact name should be given. See \code{\link{connections}} for details.}
\item{compressionLevel}{\code{compression} parameter passed to \code{\link{gzfile}}, \code{\link{bzfile}} or \code{\link{xzfile}}.}
}

