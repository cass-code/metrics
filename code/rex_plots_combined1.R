
rex_plots_combined1 <- function(pdata) {
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
    # If you wanted to make the x-axis vertical:
    # theme(axis.text.x=element_text(angle = 90, hjust = 1))
    
    g
    
    
  }
  
  
  pak1 <- plot_rex(pdata$ENTRY,pdata$rexPAK, "Pakistan")
  
  phl1 <- plot_rex(pdata$ENTRY,pdata$rexPHL, "Philippines")
  
  thi1 <- plot_rex(pdata$ENTRY,pdata$rexTHI, "Thailand")
  
  trends <- grid.draw(grid.arrange(pak1, phl1, thi1, ncol=1))
  trends
  
}