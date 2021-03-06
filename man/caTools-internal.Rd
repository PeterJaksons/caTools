\name{EndRule}
\alias{EndRule}
\title{internal function}
\description{internal function}
\usage{EndRule(x, y, k, dimx,
             endrule=c("NA", "trim", "keep", "constant", "func"), 
             align = c("center", "left", "right"), Func, \dots)}
\arguments{
  \item{x}{numeric vector of length n}
  \item{k}{width of moving window; must be an integer between one and n.}
  \item{dimx}{original dimension of x (usually \code{dim(x)}) used to choose 
    dimentions of the output. }
  \item{endrule}{character string indicating how the values at the beginning 
    and the end, of the data, should be treated. Only first and last \code{k2} 
    values at both ends are affected, where \code{k2} is the half-bandwidth 
    \code{k2 = k \%/\% 2}.
     \itemize{
       \item \code{"mad"} - applies the mad function to
       smaller and smaller sections of the array. Equivalent to: 
       \code{for(i in 1:k2) out[i]=mad(x[1:(i+k2)])}. 
       \item \code{"trim"} - trim the ends; output array length is equal to 
         \code{length(x)-2*k2 (out = out[(k2+1):(n-k2)])}. This option mimics 
         output of \code{\link{apply}} \code{(\link{embed}(x,k),1,FUN)} and other 
         related functions.
       \item \code{"keep"} - fill the ends with numbers from \code{x} vector 
         \code{(out[1:k2] = x[1:k2])}. This option makes more sense in case of 
	 smoothing functions, kept here for consistency.
       \item \code{"constant"} - fill the ends with first and last calculated 
         value in output array \code{(out[1:k2] = out[k2+1])}
       \item \code{"NA"} - fill the ends with NA's \code{(out[1:k2] = NA)}
       \item \code{"func"} - same as \code{"mad"} option except that implemented
       in R for testing purposes. Avoid since it can be very slow for large windows.
     }
  }
  \item{y}{numeric vector of length n, which is partially filled output of 
    one of the \code{run} functions. Function \code{EndRule} will fill the 
    remaining beginning and end sections using method chosen by \code{endrule} 
    argument.}
  \item{align}{specifies whether result should be centered (default), 
  left-aligned or right-aligned. }
  \item{Func}{Function name that \code{EndRule} will use in case of 
    \code{endrule="func"}.}
  \item{\dots}{Additional parameters to \code{Func} that \code{EndRule} will 
    use in case of \code{endrule="func"}.}
}
\value{
  Returns a numeric vector of the same length as \code{x}. Only in case of 
   \code{endrule="trim"}.the output will be shorter. 
}
\author{Jarek Tuszynski (SAIC) \email{jaroslaw.w.tuszynski@saic.com}} 
\keyword{internal}
