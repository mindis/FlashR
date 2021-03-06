% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FlashR.R
\name{fm.get.matrix}
\alias{fm.get.dense.matrix}
\alias{fm.get.matrix}
\alias{fm.load.dense.matrix}
\alias{fm.load.dense.matrix.bin}
\alias{fm.load.sparse.matrix}
\alias{fm.load.sparse.matrix.bin}
\title{Load a matrix to FlashR.}
\usage{
fm.get.dense.matrix(name)

fm.load.dense.matrix(src.file, in.mem, ele.type = "D", delim = ",",
  ncol = .Machine$integer.max, name = "")

fm.load.dense.matrix.bin(src.file, in.mem, nrow, ncol, byrow, ele.type,
  name = "")

fm.load.sparse.matrix(file, in.mem = TRUE, is.sym = FALSE, ele.type = "B",
  delim = ",", name = "")

fm.load.sparse.matrix.bin(spm, spm.idx, t.spm = NULL, t.spm.idx = NULL,
  in.mem = TRUE)
}
\arguments{
\item{name}{a string indicating the name of the dense matrix after being
loaded to FlashR.}

\item{src.file}{a string that indicates the file in the Linux filesystem
that stores data to be loaded to FlashR.}

\item{in.mem}{Determine the loaded matrix is stored in memory or on SAFS.}

\item{ele.type}{A string that represents the element type in a matrix.
"B" means binary, "I" means integer, "L" means long integer,
"F" means single-precision floating point, "D" means double-precision floating point.}

\item{delim}{The delimiter of separating elements in the text format.}

\item{ncol}{the number of columns in the binary dense matrix.}

\item{nrow}{the number of rows in the binary dense matrix.}

\item{byrow}{a logical value indicating if the data in the binary matrix
is stored by rows.}

\item{spm}{The file that stores the sparse matrix.}

\item{spm.idx}{The file that stores the index of the sparse matrix.}

\item{t.spm}{The file that stores the transpose of the sparse matrix.}

\item{t.spm.idx}{The file that stores the index of the transpose of the sparse matrix.}
}
\value{
a FlashR matrix.
}
\description{
There are many different ways of loading a matrix to FlashR.
\code{fm.load.dense.matrix} loads a dense matrix in the text format from
the Linux filesystem.
\code{fm.load.dense.matrix.bin} loads a dense matrix in the binary format
from the Linux filesystem.
\code{fm.load.sparse.matrix} loads a FlashR sparse matrix from files.
The matrix in the file is in the FlashR format.
\code{fm.get.dense.matrix} returns a named dense matrix that has already
been loaded to FlashR.
}
\details{
If a user provides \code{name} and \code{in.mem} is \code{TRUE}, the created
vector/matrix will be kept on disks persistently. That is, even if a user
exits from R, the vector/matrix will still be kept on disks. A user can
access to the dense matrix with \code{fm.get.dense.matrix} the next time
when he/she opens FlashR.
}
\examples{
mat <- fm.get.dense.matrix("mat123")	# get a dense matrix named "mat123", stored in SAFS.
mat <- fm.load.dense.matrix("./mat123.cvs", TRUE) # load a dense matrix from a local file "mat123.cvs" to memory.
mat <- fm.load.sparse.matrix("./spm123.mat", "./spm123.mat_idx") # load a symmetric sparse matrix in FlashMatrix format (whose data is stored in "spm123.mat" and the index is stored in "spm123.mat_idx") to memory.
}
\author{
Da Zheng <dzheng5@jhu.edu>
}

