
rex_plots_combined <- function(pdata) {
# libraries

library(gridExtra)
library(grid)
library(ggplot2)
library(lattice)

    plot_rex <- function(ENTRY, rex, TITL){

        g <-
            ggplot() +
            geom_line(aes(x = ENTRY, y = rex, group=1)) +

            theme_bw() +
            scale_x_discrete(breaks = levels(ENTRY)[floor(seq(1,
                                                              nlevels(ENTRY),
                                                              length.out = 9))]) +
            #scale_x_discrete(guide = guide_axis(n.dodge = xaxis_rows)) +
            labs(title = TITL, caption = "Source: Own Calculations", x = "Year:month", y = "Real Exchange Rate") +
            theme(legend.position = "top", legend.title = element_blank()) +
            #theme(plot.title = element_text(size = 14),
            #  plot.subtitle = element_text(size = 12),
            # axis.text.x = element_text(size = xaxis_size)) +
            guides(color = F)

        g


    }

    ind1 <- plot_rex(pdata$ENTRY,pdata$rexIND, "India")

    lnk1 <- plot_rex(pdata$ENTRY,pdata$rexLNK, "Sri Lanka")

    mal1 <- plot_rex(pdata$ENTRY,pdata$rexMAL, "Malasia")

    mnr1 <- plot_rex(pdata$ENTRY,pdata$rexMNR, "Myanmar")

    trends <- grid.arrange(ind1, lnk1, mal1, mnr1, ncol=1, top="Real Exchange Rates Plot") #use grid.draw to avoid grob information being printed when calling the function
    #trends <- grid.draw(grid.arrange(ind1, lnk1, mal1, mnr1, ncol=1, top="Real Exchange Rates Plot")) #use grid.draw to avoid grob information being printed when calling the function
    trends

}