cvar_plot <- function(x, max.lag, varname="x", ylim.ct=NA) {
    # For a given series x, plots the ACF of x and diff(x), the normal quantile
    # plot of diff(x) and the Cochrane variance ratio test, with errors.
    #
    # Note: this function does not check inputs.
    #
    # Args:
    #   x        : A time series or vector
    #   max.lag  : Maximum number of lags to display
    #   varname  : A string name for the variable (expressions won't work)
    #   ylim.ct  : Either "NA" to have them computed automatically or specified ylimits for the
    #              Cochrane variance ratio plot
    #
    # Returns:
    #   Nothing
    #
    # Example:
    #   cochrane.plot(log(GDP), max.lag=20, varname=expression(log(Y)))
    acf.x <- acf(x, lag.max=max.lag, plot=F)
    acf.dx <- acf(diff(x), lag.max=max.lag, plot=F)
    ct <- cochrane.var.ratio(x, max.lag=max.lag)

    # Compute ylim if not specified
    if (is.na(ylim.ct)) {
        ct.min <- min(ct[,"vr"] - ct[,"error"])
        ct.max <- max(ct[,"vr"] + ct[,"error"])
        ylim.ct <- c(ct.min, ct.max)
    }

    # Save graphics parameters
    mgp.def = par()$mgp
    mfrow.def = par()$mfrow
    cex.axis.def = par()$cex.axis
    cex.main.def = par()$cex.main

    par(mgp=c(2,1,0))
    par(mfrow=c(2,2))
    par(cex.axis=0.8, cex.main=1)
    plot(acf.x, main=varname)
    plot(acf.dx, main=bquote(paste(Delta,.(varname))))
    qqnorm(diff(x), main=bquote(paste("Normal Q-Q Plot for", Delta, .(varname))))
    qqline(diff(x))
    plot(1:max.lag,ct[,"vr"],xlab="Lag",ylab="", type="l",
         ylim=ylim.ct,
         main=paste("Cochrane variance ratio for", varname))
    lines(1:max.lag,ct[,"vr"] + ct[,"error"],lty=2)
    lines(1:max.lag,ct[,"vr"] - ct[,"error"],lty=2)

    # Restore graphics parameters
    par(mfrow=mfrow.def)
    par(mgp=mgp.def)
    par(cex.axis=cex.axis.def)
    par(cex.main=cex.main.def)
}