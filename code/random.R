random <- function(periods){

## initialize {x_t} and {w_t}
xx <- ww <- rnorm(n = periods, mean = 0, sd = 1)
## compute values 2 thru TT
for (t in 2:periods) {
    xx[t] <- xx[t - 1] + ww[t]
}

xx

}