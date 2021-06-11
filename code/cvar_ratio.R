# Released under the MIT License (MIT)
#
# Copyright (c) 2014 Eric Kemp-Benedict
#
#   Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
#   The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# This function was created by the author for a specific analysis.
# It does no checking of inputs.

cvar_ratio <- function(x, max.lag) {
    # Computes a series of the variance of 1st difference divided by lag, following
    # Cochrane, J. H. (1988) ‘How Big Is the Random Walk in GNP?’
    #    Journal of Political Economy, 96(5). 893–920.
    # A horizontal trend is consistent with a random walk, while
    # a declining trend is consistent with a stationary series. Many
    # series look like a random walk up to some lag and then shift
    # to a stationary behavior at longer lags. Plotting the ratio
    # of variance of 1st difference divided by lag can be revealing.
    #
    # Note: Methods exist to automatically detect the shift from
    # random walk to stationary behavior. These are used in computational
    # finance, and can be found in the R package vrtest, available on CRAN.
    # For macroeconomic time series, Cochrane's "plot and look" method can be
    # applied in a straightforward manner, and this function generates
    # the appropriate series.
    #
    # Note: this is a simple function and it does not check inputs.
    #
    # Args:
    #   x        : A time series or vector
    #   max.lag  : Maximum number of lags to compute
    #
    # Returns:
    #   Matrix with ratio (column "yr") and the standard error (column "error")
    #
    # Example:
    #   k <- 20
    #   ct <- cochrane.var.ratio(x, max.lag=k)
    #   # Make plot with error bars, similar to plots in Cochrane's paper
    #   plot(1:k,ct[,"vr"],xlab="Lag",ylab="", type="l",
    #     ylim=c(0.0,2.0),
    #     main=expression(paste("Cochrane variance ratio for x")))
    #   lines(1:k,ct[,"vr"] + ct[,"error"],lty=2)
    #   lines(1:k,ct[,"vr"] - ct[,"error"],lty=2)

    y <- matrix(ncol=2,nrow=max.lag)
    colnames(y) <- c("vr","error")
    N <- length(x)
    mu <- mean(diff(x))
    for (k in 1:max.lag) {
        variance <- var(diff(x, lag=k) - mu)
        dof.corr <- N/(N - k + 1)
        # This will become a ratio below
        y[k,"vr"] <- dof.corr * variance/k
        y[k,"error"] <- sqrt(2/(N - k))
       # y[k,"error"] <- sqrt((0.75*N/k)+1)
    }
    y[,"vr"] <- y[,"vr"]/y[1,"vr"]
    y[,"error"] <- sqrt(y[,"error"]^2 + y[1,"error"]^2)
    #
    return(y)
}

