rex_line_plot <- function(data1, xaxis_size = 5, xaxis_rows = 3){

# dfplot <-
#     data1 %>% mutate(ENTRY = as.numeric(ENTRY)) %>%
#     mutate(rex = real_exchange(INDEX, INDCPI, USCPI))

dfplot <-
        data1 %>% mutate(ENTRY = as.factor(ENTRY)) %>%
        mutate(rex = real_exchange(INDEX, INDCPI, USCPI))
g <-
    dfplot %>%
    ggplot() +
    geom_line(aes(x = ENTRY, y = rex, group=1)) +

    theme_bw() +
    scale_x_discrete(breaks = levels(dfplot$ENTRY)[floor(seq(1,
                                                                   nlevels(dfplot$ENTRY),
                                                                   length.out = 15))]) +
    #scale_x_discrete(guide = guide_axis(n.dodge = xaxis_rows)) +
    labs(title = "Happiness Index", subtitle = "Some subtitle", caption = "Data source: World Happiness Index", x = "", y = "Happiness Score") +
    theme(legend.position = "top", legend.title = element_blank()) +
    theme(plot.title = element_text(size = 14),
          plot.subtitle = element_text(size = 12),
          axis.text.x = element_text(size = xaxis_size)) +
    guides(color = F)
# If you wanted to make the x-axis vertical:
# theme(axis.text.x=element_text(angle = 90, hjust = 1))

g


}