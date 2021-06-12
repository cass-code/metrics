---
# IMPORTANT: Change settings here, but DO NOT change the spacing.
# Remove comments and add values where applicable.
# The descriptions below should be self-explanatory

# title: "Real Exchange Rate Behaviour: A Replication and Robustness Check
#subtitle: "This will appear as Right Header"

documentclass: "elsarticle"

# --------- Thesis title (Optional - set to FALSE by default).
# You can move the details below around as you please.
Thesis_FP: TRUE
Entry1: "Real Exchange Rate Behaviour: A Replication and Robustness Check"
Entry2: "Cassandra Pengelly | 20346212" # textbf for bold
Entry3: "Econometrics 871: Time Series Project"
Uni_Logo: Tex/Logo.png # Place a logo in the indicated location (from your root, e.g. defaults to ~/Tex/Logo.png) and uncomment this line. Leave uncommented for no image
Logo_width: 0.5
# Entry4: "Under the supervision of: \\vfill Prof. Joe Smith and Dr. Frank Smith"
# Entry5: "Stellenbosch University"
# Entry6: April 2020
# Entry7:
# Entry8:

# --------- Front Page
# Comment: ----- Follow this pattern for up to 5 authors
# AddTitle: TRUE # Use FALSE when submitting to peer reviewed platform. This will remove author names.
# Author1: "Nico Katzke^[__Contributions:__  \\newline _The authors would like to thank no institution for money donated to this project. Thank you sincerely._]"  # First Author - note the thanks message displayed as an italic footnote of first page.
# Ref1: "Prescient Securities, Cape Town, South Africa" # First Author's Affiliation
# Email1: "nfkatzke\\@gmail.com" # First Author's Email address
# 
# Author2: "John Smith"
# Ref2: "Some other Institution, Cape Town, South Africa"
# Email2: "John\\@gmail.com"
# CommonAffiliation_12: TRUE # If Author 1 and 2 have a common affiliation. Works with _13, _23, etc.
# 
# Author3: "John Doe"
# Email3: "Joe\\@gmail.com"
# 
# CorrespAuthor_1: TRUE  # If corresponding author is author 3, e.g., use CorrespAuthor_3: TRUE
# 
# # Comment out below to remove both. JEL Codes only given if keywords also given.
# keywords: "Multivariate GARCH \\sep Kalman Filter \\sep Copula" # Use \\sep to separate
# JELCodes: "L250 \\sep L100"

# ----- Manage headers and footers:
#BottomLFooter: $Title$
#BottomCFooter:
#TopLHeader: \leftmark # Adds section name at topleft. Remove comment to add it.
BottomRFooter: "\\footnotesize Page \\thepage" # Add a '#' before this line to remove footer.
addtoprule: TRUE
addfootrule: TRUE               # Use if footers added. Add '#' to remove line.

# --------- page margins:
margin: 2.3 # Sides
bottom: 2 # bottom
top: 2.5 # Top
HardSet_layout: TRUE # Hard-set the spacing of words in your document. This will stop LaTeX squashing text to fit on pages, e.g.
# This is done by hard-setting the spacing dimensions. Set to FALSE if you want LaTeX to optimize this for your paper.

# --------- Line numbers
linenumbers: FALSE # Used when submitting to journal

# ---------- References settings:
# You can download cls format here: https://www.zotero.org/ - simply search for your institution. You can also edit and save cls formats here: https://editor.citationstyles.org/about/
# Hit download, store it in Tex/ folder, and change reference below - easy.
bibliography: Tex/ref.bib       # Do not edit: Keep this naming convention and location.
csl: Tex/harvard-stellenbosch-university.csl # referencing format used.
# By default, the bibliography only displays the cited references. If you want to change this, you can comment out one of the following:
#nocite: '@*' # Add all items in bibliography, whether cited or not
# nocite: |  # add specific references that aren't cited
#  @grinold2000
#  @Someoneelse2010

# ---------- General:
RemovePreprintSubmittedTo: TRUE  # Removes the 'preprint submitted to...' at bottom of titlepage
Journal: "Journal of Finance"   # Journal that the paper will be submitting to, if RemovePreprintSubmittedTo is set to TRUE.
toc: TRUE                       # Add a table of contents
numbersections: TRUE             # Should sections (and thus figures and tables) be numbered?
fontsize: 11pt                  # Set fontsize
linestretch: 1.2                # Set distance between lines.
link-citations: TRUE            # This creates dynamic links to the papers in reference list.

### Adding additional latex packages:
# header-includes:
#    - \usepackage{colortbl} # Add additional packages here.

output:
  pdf_document:
    keep_tex: TRUE
    template: Tex/TexDefault.txt
    fig_width: 3.5 # Adjust default figure sizes. This can also be done in the chunks of the text.
    fig_height: 3.5
# abstract: |
#   Abstract to be written here. The abstract should not be too long and should provide the reader with a good understanding what you are writing about. Academic papers are not like novels where you keep the reader in suspense. To be effective in getting others to read your paper, be as open and concise about your findings here as possible. Ideally, upon reading your abstract, the reader should feel he / she must read your paper in entirety.
---

<!-- First: Set your default preferences for chunk options: -->

<!-- If you want a chunk's code to be printed, set echo = TRUE. message = FALSE stops R printing ugly package loading details in your final paper too. I also suggest setting warning = FALSE and checking for warnings in R, else you might find ugly warnings in your paper. -->




<!-- ############################## -->
<!-- # Start Writing here: -->
<!-- ############################## -->

# Introduction \label{Introduction}

How do we compare living standards and economic productivity between countries? This is one of the questions that macroeconomics attempts to answers and a number of tools have been developed within the field to this end. One of these tools is the Purchasing Power Parity (PPP) theory, which uses a basket of goods to compare the currencies of different countries. This theory has been widely tested using data, and the results have been divisive and somewhat puzzling.@puz.

In this essay, I replicate^[More accurately, try my best to replicate] the paper "Real Exchange Rate Behaviour: Evidence from Black Markets" by @Kul, which tests the PPP hypothesis. I include some other tests in addition to those in the paper as a robustness check on the results. 

This essay^[This essay was written in R using the package by @Texevier] is organised as follows. Section \ref{Context} contextualises Luintel's paper and discusses the robustness checks. Section \ref{Data} discusses the data and reports the results of the Wald-Wolfowitz tests. Section \ref{Unit} deals with the unit root tests. Section \ref{Var} reports the results of the variance ratio test and section \ref{Struc} presents the structural break tests.The code for this replication can be found on Github (here:)[https://github.com/cass-code/metrics.git].


# Context and Evaluation \label{Context}

provide a brief section that outlines the context and questions of the replicated study:
The first part should outline what the authors do, how they motivate the question as of economic interest and/or importance, how they motivate their methods and how they argue that their contribution is novel

The second part can be a critical evaluation of their approach and choices which leads to your choices of robustness checks/extensions



Over the past decade, the purchasing-power parity (PPP) puzzle has taken two forms.  Its early form arose from early tests of unit roots in real exchange rates, which failed to reject  the  null  hypothesis,  thus  casting  doubts  on  the  long-term  PPP  hypothesis  of  real  exchange  rates'  mean  reversion.  Following  the  development  of  more  powerful  tests  that  resulted in rejections of unit roots, the PPP-puzzle re-surfaced in the form of surprisingly slow rates of convergence of real exchange rates to their long-run means. Rogoff (1996) expressed  this  puzzle  in  terms  of  the  estimated  "half-life"  of  real  exchange  rate  shocks  being 3 to 5 years. Recent research has attempted to solve that second form of the puzzle by adopting non-linear stochastic models of real exchange rates. Despite this introduction of  non-linearities,  the  literature  has  continued  to  focus  on  the  notion  of  "half-life"  as  a  measure of persistence.  



The theory of purchasing power parity (PPP) is one of the most widely tested economics. The overall findings can be summarized as follows. Studies based data wholly reject PPP.1 Rogoff (1996, p. 644) calls this set of evidence 'the abject law of one price. Time-series studies based on aggregate price indices for also largely reject PPP and suggest that the real exchange rate behaves as random walk hypothesis implies that shocks to the real exchange rate are persistent is no tendency for PPP to hold in the short run or in the long run. Rogoff summarizes this set of findings as 'something of an embarrassment' to the argues that every 'reasonable' theoretical model suggests a mean reverting real the long run.3



The behaviour of real exchange rates (relative to the US dollar) is examined using monthly from the black markets for foreign exchange of eight Asian developing countries. The data The black market real exchange rates do not show excess volatility during the recent float contrast to the results reported elsewhere. Unit root tests in heterogeneous panels and variance confirm their stationarity. Thus, we find support for PPP but not for the 'survivorship' Rogoff, 1995). There is little evidence of segmented trends. Issues raised by Rogoff (1996) would hold across countries with differing growth experience-and Lothian and Taylor whether the degree of relative price volatility may bias results in favour of mean reverting rates -are addressed. Copyright © 2000 John Wiley & Sons, Ltd. 1. INTRODUCTION 

References are to be made as follows: @fama1997[p. 33] and @grinold2000 Such authors could also be referenced in brackets [@grinold2000] and together [@fama1997 \& @grinold2000]. 

# Data \label{Data}

The data used for the analysis is a series on black market nominal exchange rates and consumer price indices (CPI) for 8 developing Asian countries, namely: India, Sri Lanka, Myanmar, Malaysia, Pakistan, Philippines, Taiwan and Thailand. I take a subset of these countries by excluding Taiwan^[I excluded Taiwan because there is some data missing from the set and I don't know how to adjust an unbalanced panel. However, it is also interesting to test if the results hold when taking a subset] from the analysis. @Kul sources data from various issues of *Pick's Currency Year Book* and *World Currency Year Book*. The data used for Luintel's paper is accessible through the Journal of Applied Econometrics archive, which is where I attained my data. The sample period runs for 31 periods from January 1958 to June 1989. This sample period is split into two parts: Bretton Woods and after Bretton Woods (also referred to as pre-float period and the float period).

The nominal exchange rates are units currencies per unit of US dollar. There were two mistakes in the nominal exchange rate datasets: for Myanmar November 1974,  there was a value of 1.45, which I replaced with 16.5 (based on interpolation). And for the Philippines in September 1975,  there was a value of 0.7 with which I replaced with 7.7 (based on interpolation).^[I discovered these mistakes when there was a dramatic difference in my plots of the real exchange rates and Luintel's plots.] Luintel sources the CPI figures from issues of International Financial Statistics (which are included in Luintel's dataset available in the JAE data archives).  

To calculate the real exchange rates, I follow the lead of @Kul and apply the following formula to the nominal exchange rates:

$$
rex = log(Nominal Exchange Rate) - log(CPI) + log(United States CPI)
$$

I plot the real exchange rate series below in \ref{Figure1}. The plots below match those of @Kul [p. 166] and indicate that the real exchange rates are trending. Additionally, the graphs show that the black market exchange rates are somewhat volatile. As expected, we see that after the first oil shock of 1973 the currencies appreciated and then slowly reverted. The plots suggest that the trends are segmented. I test this hypothesis using formal tests, reported below the plots in \ref{Figure3}.


\begin{center}\includegraphics{Write_Up--2-_files/figure-latex/Figure1-1} \end{center}
\begin{figure}[H]

{\centering \includegraphics{Write_Up--2-_files/figure-latex/Figure2-1} 

}

\caption{Plot of Real Exchange Rates over Time\label{Figure1}}\label{fig:Figure2}
\end{figure}


|Test/Country   |   India| SriLanka| Malasia| Myanmar| Pakistan| Philippines| Thailand|
|:--------------|-------:|--------:|-------:|-------:|--------:|-----------:|--------:|
|Wald-Wolfowitz | -16.065|   -18.54| -17.097| -18.231|  -16.272|     -17.097|  -15.962|

# Unit Root Tests \label{Unit}

First, I employed the Augmented Dickey-Fuller test for the individual exchange rates to see whether there was a unit root present. The test results show 


\begin{tabular}{l|r|r|r}
\hline
Countries & Full Sample & Bretton Woods (1958:1-1973:3) & Post-Bretton Woods (1973:4-1989:6)\\
\hline
India (Rupee) & -2.695892 & -2.065067 & -3.6562004\\
\hline
Sri Lanka (Rupee) & -3.221138 & -2.114240 & -2.4449256\\
\hline
Malaysia (Ringgit) & -1.469487 & -2.160595 & -3.7735890\\
\hline
Myanmar (Kyat) & -1.528096 & -1.713724 & -0.1574589\\
\hline
Pakistan (Rupee) & -3.354481 & -2.969905 & -5.9078684\\
\hline
Phillipines (Peso) & -3.094185 & -2.068390 & -3.3811039\\
\hline
Thailand (Baht) & -2.439860 & -3.360884 & -3.9291658\\
\hline
\end{tabular}

# Variance Ratio Test \label{Var}

The following table shows results of the Variance Ratio test for the full sample for up to 20 months. The results of the variance ratio test for the Bretton Woods period and post Bretton Woods period (for up to 20 months^[The results for 190 months is available upon request; it has been omitted purely to save space]) can be found in the Appendix (\ref{A})


\begingroup\fontsize{12pt}{13pt}\selectfont
\begin{longtable}{lrrrrrrr}
\caption{Variance Ratio Test for Full Sample Up to month 20} \\ 
  \toprule
Months & India & SriLanka & Malaysia & Myanmar & Pakistan & Philippines & Thailand \\ 
  \hline 
\endhead 
\hline 
{\footnotesize Continued on next page} 
\endfoot 
\endlastfoot 
 \midrule
1 & 1.00 & 1.00 & 1.00 & 1.00 & 1.00 & 1.00 & 1.00 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  2 & 1.00 & 0.95 & 0.79 & 1.04 & 0.91 & 0.91 & 0.74 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  3 & 1.02 & 0.86 & 0.79 & 1.05 & 0.81 & 0.86 & 0.68 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  4 & 1.01 & 0.87 & 0.75 & 1.00 & 0.71 & 0.82 & 0.58 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  5 & 0.95 & 0.89 & 0.73 & 0.98 & 0.65 & 0.80 & 0.52 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  6 & 0.91 & 0.90 & 0.73 & 0.95 & 0.61 & 0.77 & 0.48 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  7 & 0.86 & 0.91 & 0.69 & 0.93 & 0.58 & 0.76 & 0.44 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  8 & 0.83 & 0.90 & 0.69 & 0.92 & 0.56 & 0.77 & 0.42 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  9 & 0.81 & 0.89 & 0.66 & 0.90 & 0.53 & 0.81 & 0.40 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  10 & 0.81 & 0.88 & 0.63 & 0.89 & 0.50 & 0.79 & 0.39 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  11 & 0.81 & 0.88 & 0.61 & 0.91 & 0.49 & 0.79 & 0.37 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  12 & 0.83 & 0.88 & 0.57 & 0.95 & 0.46 & 0.78 & 0.37 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  13 & 0.86 & 0.87 & 0.57 & 0.96 & 0.47 & 0.79 & 0.37 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  14 & 0.88 & 0.87 & 0.57 & 0.98 & 0.48 & 0.79 & 0.37 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  15 & 0.90 & 0.88 & 0.57 & 1.00 & 0.48 & 0.80 & 0.37 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  16 & 0.92 & 0.88 & 0.57 & 1.02 & 0.49 & 0.79 & 0.37 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  17 & 0.92 & 0.89 & 0.58 & 1.03 & 0.49 & 0.78 & 0.36 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  18 & 0.92 & 0.88 & 0.59 & 1.04 & 0.49 & 0.77 & 0.36 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  19 & 0.91 & 0.88 & 0.60 & 1.05 & 0.50 & 0.76 & 0.36 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
  20 & 0.90 & 0.87 & 0.62 & 1.08 & 0.52 & 0.75 & 0.36 \\ 
  se & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 & 0.10 \\ 
   \bottomrule
\end{longtable}
\endgroup
# Structural Break Test \label{Struc}


To make your graphs look extra nice in latex world, you could use Tikz device. Replace dev - 'png' with 'tikz' in the chunk below. Notice this makes the build time longer and produces extra tex files - so if you are comfortable with this, set your device to Tikz and try it out:



To reference the plot above, add a ``\\label'' after the caption in the chunk heading, as done above. Then reference the plot as such: As can be seen, Figures \ref{Figure1}  and \ref{Figure2} are excellent, with Figure \ref{Figure2} being particularly aesthetically pleasing due to its device setting of Tikz. The nice thing now is that it correctly numbers all your figures (and sections or tables) and will update if it moves. The links are also dynamic.

I very strongly suggest using ggplot2 (ideally in combination with dplyr) using the ggtheme package to change the themes of your figures.

Also note the information that I have placed above the chunks in the code chunks for the figures. You can edit any of these easily - visit the Rmarkdown webpage for more information.

# Splitting a page

You can also very easily split a page using built-in Pandoc formatting. I comment this out in the code (as this has caused issues building the pdf for some users - which I presume to be a Pandoc issue), but you are welcome to try it out yourself by commenting out the following section in your Rmd file.



# Math section

\begin{align}
\beta = \sum_{i = 1}^{\infty}\frac{\alpha^2}{\sigma_{t-1}^2} \label{eq1} \\
\int_{x = 1}^{\infty}x_{i} = 1 \notag
\end{align}

If you would like to see the equations as you type in Rmarkdown, use $ symbols instead (see this for yourself by adjusted the equation):

$$
\beta = \sum_{i = 1}^{\infty}\frac{\alpha^2}{\sigma_{t-1}^2} \\
\int_{x = 1}^{\infty}x_{i} = 1
$$

Note again the reference to equation \ref{eq1}. Writing nice math requires practice. Note I used a forward slashes to make a space in the equations. I can also align equations using  __\&__, and set to numbering only the first line. Now I will have to type ``begin equation'' which is a native \LaTeX command. Here follows a more complicated equation:


# Results

Tables can be included as follows. Use the _xtable_ (or kable) package for tables. Table placement = H implies Latex tries to place the table Here, and not on a new page (there are, however, very many ways to skin this cat. Luckily there are many forums online!).


\begin{table}[H]
\centering
\begin{tabular}{rrrrrrrrrrrr}
  \hline
 & mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb \\ 
  \hline
1 & 21.00 & 6.00 & 160.00 & 110.00 & 3.90 & 2.62 & 16.46 & 0.00 & 1.00 & 4.00 & 4.00 \\ 
  2 & 21.00 & 6.00 & 160.00 & 110.00 & 3.90 & 2.88 & 17.02 & 0.00 & 1.00 & 4.00 & 4.00 \\ 
  3 & 22.80 & 4.00 & 108.00 & 93.00 & 3.85 & 2.32 & 18.61 & 1.00 & 1.00 & 4.00 & 1.00 \\ 
  4 & 21.40 & 6.00 & 258.00 & 110.00 & 3.08 & 3.21 & 19.44 & 1.00 & 0.00 & 3.00 & 1.00 \\ 
  5 & 18.70 & 8.00 & 360.00 & 175.00 & 3.15 & 3.44 & 17.02 & 0.00 & 0.00 & 3.00 & 2.00 \\ 
   \hline
\end{tabular}
\caption{Short Table Example \label{tab1}} 
\end{table}

To reference calculations __in text__, _do this:_ From table \ref{tab1} we see the average value of mpg is 20.98.

Including tables that span across pages, use the following (note that I add below the table: ``continue on the next page''). This is a neat way of splitting your table across a page.

Use the following default settings to build your own possibly long tables. Note that the following will fit on one page if it can, but cleanly spreads over multiple pages:


\hfill

<!-- hfill can be used to create a space, like here between text and table. -->


## Huxtable



```{=latex}
 
  \providecommand{\huxb}[2]{\arrayrulecolor[RGB]{#1}\global\arrayrulewidth=#2pt}
  \providecommand{\huxvb}[2]{\color[RGB]{#1}\vrule width #2pt}
  \providecommand{\huxtpad}[1]{\rule{0pt}{#1}}
  \providecommand{\huxbpad}[1]{\rule[-#1]{0pt}{#1}}

\begin{table}[ht]
\begin{centerbox}
\begin{threeparttable}
\captionsetup{justification=centering,singlelinecheck=off}
\caption{Regression Output}
 \label{Reg01}
\setlength{\tabcolsep}{0pt}
\begin{tabular}{l l l l}


\hhline{>{\huxb{0, 0, 0}{0.8}}->{\huxb{0, 0, 0}{0.8}}->{\huxb{0, 0, 0}{0.8}}->{\huxb{0, 0, 0}{0.8}}-}
\arrayrulecolor{black}

\multicolumn{1}{!{\huxvb{0, 0, 0}{0}}c!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\centering \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont } \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{c!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\centering \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont Reg1} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{c!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\centering \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont Reg2} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{c!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\centering \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont Reg3} \hspace{6pt}\huxbpad{6pt}} \tabularnewline[-0.5pt]


\hhline{>{\huxb{255, 255, 255}{0.4}}->{\huxb{0, 0, 0}{0.4}}->{\huxb{0, 0, 0}{0.4}}->{\huxb{0, 0, 0}{0.4}}-}
\arrayrulecolor{black}

\multicolumn{1}{!{\huxvb{0, 0, 0}{0}}l!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedright \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont (Intercept)} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont -2256.361 ***} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont 5763.668 ***} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont 4045.333 ***} \hspace{6pt}\huxbpad{6pt}} \tabularnewline[-0.5pt]


\hhline{}
\arrayrulecolor{black}

\multicolumn{1}{!{\huxvb{0, 0, 0}{0}}l!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedright \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont } \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont (13.055)~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont (740.556)~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont (286.205)~~~} \hspace{6pt}\huxbpad{6pt}} \tabularnewline[-0.5pt]


\hhline{}
\arrayrulecolor{black}

\multicolumn{1}{!{\huxvb{0, 0, 0}{0}}l!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedright \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont carat} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont 7756.426 ***} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont ~~~~~~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont 7765.141 ***} \hspace{6pt}\huxbpad{6pt}} \tabularnewline[-0.5pt]


\hhline{}
\arrayrulecolor{black}

\multicolumn{1}{!{\huxvb{0, 0, 0}{0}}l!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedright \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont } \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont (14.067)~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont ~~~~~~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont (14.009)~~~} \hspace{6pt}\huxbpad{6pt}} \tabularnewline[-0.5pt]


\hhline{}
\arrayrulecolor{black}

\multicolumn{1}{!{\huxvb{0, 0, 0}{0}}l!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedright \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont depth} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont ~~~~~~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont -29.650 *~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont -102.165 ***} \hspace{6pt}\huxbpad{6pt}} \tabularnewline[-0.5pt]


\hhline{}
\arrayrulecolor{black}

\multicolumn{1}{!{\huxvb{0, 0, 0}{0}}l!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedright \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont } \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont ~~~~~~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont (11.990)~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont (4.635)~~~} \hspace{6pt}\huxbpad{6pt}} \tabularnewline[-0.5pt]


\hhline{>{\huxb{255, 255, 255}{0.4}}->{\huxb{0, 0, 0}{0.4}}->{\huxb{0, 0, 0}{0.4}}->{\huxb{0, 0, 0}{0.4}}-}
\arrayrulecolor{black}

\multicolumn{1}{!{\huxvb{0, 0, 0}{0}}l!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedright \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont N} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont 53940~~~~~~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont 53940~~~~~~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont 53940~~~~~~~~} \hspace{6pt}\huxbpad{6pt}} \tabularnewline[-0.5pt]


\hhline{}
\arrayrulecolor{black}

\multicolumn{1}{!{\huxvb{0, 0, 0}{0}}l!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedright \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont R2} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont 0.849~~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont 0.000~~~~} \hspace{6pt}\huxbpad{6pt}} &
\multicolumn{1}{r!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedleft \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont 0.851~~~~} \hspace{6pt}\huxbpad{6pt}} \tabularnewline[-0.5pt]


\hhline{>{\huxb{0, 0, 0}{0.8}}->{\huxb{0, 0, 0}{0.8}}->{\huxb{0, 0, 0}{0.8}}->{\huxb{0, 0, 0}{0.8}}-}
\arrayrulecolor{black}

\multicolumn{4}{!{\huxvb{0, 0, 0}{0}}l!{\huxvb{0, 0, 0}{0}}}{\huxtpad{6pt + 1em}\raggedright \hspace{6pt} {\fontsize{12pt}{14.4pt}\selectfont  *** p $<$ 0.001;  ** p $<$ 0.01;  * p $<$ 0.05.} \hspace{6pt}\huxbpad{6pt}} \tabularnewline[-0.5pt]


\hhline{}
\arrayrulecolor{black}
\end{tabular}
\end{threeparttable}\par\end{centerbox}

\end{table}
 
```


# Lists

To add lists, simply using the following notation

* This is really simple

    + Just note the spaces here - writing in R you have to sometimes be pedantic about spaces...

* Note that Rmarkdown notation removes the pain of defining \LaTeX environments!

# Conclusion


\newpage

# References {-}

<div id="refs"></div>

\newpage

# Appendix {-}

## Appendix A: \label{A} {-}


\begingroup\fontsize{12pt}{13pt}\selectfont
\begin{longtable}{lrrrrrrr}
\caption{Variance Ratio Test for Bretton Woods period up to month 20} \\ 
  \toprule
Months & India & SriLanka & Malaysia & Myanmar & Pakistan & Philippines & Thailand \\ 
  \hline 
\endhead 
\hline 
{\footnotesize Continued on next page} 
\endfoot 
\endlastfoot 
 \midrule
1 & 1.00 & 1.00 & 1.00 & 1.00 & 1.00 & 1.00 & 1.00 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  2 & 1.06 & 0.88 & 0.80 & 1.03 & 1.01 & 1.02 & 0.79 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  3 & 1.03 & 0.80 & 0.73 & 1.01 & 0.92 & 0.90 & 0.72 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  4 & 0.99 & 0.77 & 0.66 & 0.95 & 0.76 & 0.84 & 0.61 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  5 & 0.92 & 0.79 & 0.59 & 0.93 & 0.61 & 0.81 & 0.50 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  6 & 0.88 & 0.80 & 0.56 & 0.91 & 0.55 & 0.79 & 0.47 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  7 & 0.84 & 0.80 & 0.53 & 0.90 & 0.50 & 0.79 & 0.39 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  8 & 0.82 & 0.80 & 0.55 & 0.89 & 0.49 & 0.81 & 0.36 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  9 & 0.80 & 0.80 & 0.55 & 0.88 & 0.44 & 0.83 & 0.36 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  10 & 0.80 & 0.78 & 0.56 & 0.87 & 0.39 & 0.82 & 0.36 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  11 & 0.79 & 0.78 & 0.56 & 0.90 & 0.36 & 0.81 & 0.37 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  12 & 0.80 & 0.78 & 0.53 & 0.96 & 0.34 & 0.82 & 0.35 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  13 & 0.83 & 0.76 & 0.53 & 0.98 & 0.35 & 0.84 & 0.35 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  14 & 0.86 & 0.74 & 0.55 & 1.00 & 0.36 & 0.85 & 0.34 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  15 & 0.90 & 0.74 & 0.56 & 1.04 & 0.35 & 0.87 & 0.32 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  16 & 0.88 & 0.72 & 0.56 & 1.07 & 0.34 & 0.87 & 0.31 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  17 & 0.89 & 0.71 & 0.56 & 1.09 & 0.33 & 0.87 & 0.30 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  18 & 0.89 & 0.71 & 0.56 & 1.10 & 0.34 & 0.88 & 0.31 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  19 & 0.87 & 0.70 & 0.57 & 1.11 & 0.35 & 0.88 & 0.31 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  20 & 0.84 & 0.69 & 0.58 & 1.15 & 0.36 & 0.89 & 0.32 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
   \bottomrule
\end{longtable}
\endgroup

\begingroup\fontsize{12pt}{13pt}\selectfont
\begin{longtable}{lrrrrrrr}
\caption{Variance Ratio Test for post Bretton Woods period up to 20 months} \\ 
  \toprule
Months & India & SriLanka & Malaysia & Myanmar & Pakistan & Philippines & Thailand \\ 
  \hline 
\endhead 
\hline 
{\footnotesize Continued on next page} 
\endfoot 
\endlastfoot 
 \midrule
1 & 1.00 & 1.00 & 1.00 & 1.00 & 1.00 & 1.00 & 1.00 \\ 
  se & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 \\ 
  2 & 0.95 & 1.01 & 0.78 & 1.05 & 0.78 & 0.85 & 0.71 \\ 
  se & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 \\ 
  3 & 0.99 & 0.91 & 0.80 & 1.14 & 0.68 & 0.84 & 0.66 \\ 
  se & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 \\ 
  4 & 0.98 & 0.93 & 0.75 & 1.14 & 0.61 & 0.82 & 0.58 \\ 
  se & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 \\ 
  5 & 0.93 & 0.94 & 0.76 & 1.12 & 0.60 & 0.81 & 0.53 \\ 
  se & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 \\ 
  6 & 0.88 & 0.94 & 0.73 & 1.06 & 0.54 & 0.78 & 0.49 \\ 
  se & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 \\ 
  7 & 0.82 & 0.94 & 0.69 & 1.02 & 0.50 & 0.76 & 0.45 \\ 
  se & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 \\ 
  8 & 0.77 & 0.92 & 0.68 & 1.00 & 0.45 & 0.76 & 0.44 \\ 
  se & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 & 0.14 \\ 
  9 & 0.75 & 0.89 & 0.62 & 0.98 & 0.40 & 0.81 & 0.40 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  10 & 0.75 & 0.86 & 0.60 & 0.98 & 0.39 & 0.79 & 0.38 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  11 & 0.75 & 0.85 & 0.55 & 0.98 & 0.38 & 0.79 & 0.34 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  12 & 0.76 & 0.84 & 0.51 & 0.99 & 0.37 & 0.78 & 0.33 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  13 & 0.76 & 0.82 & 0.47 & 1.00 & 0.39 & 0.78 & 0.32 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  14 & 0.75 & 0.83 & 0.45 & 0.99 & 0.40 & 0.77 & 0.32 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  15 & 0.73 & 0.83 & 0.43 & 0.98 & 0.39 & 0.77 & 0.31 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  16 & 0.72 & 0.83 & 0.42 & 0.99 & 0.39 & 0.75 & 0.31 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  17 & 0.72 & 0.83 & 0.42 & 0.98 & 0.38 & 0.74 & 0.30 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  18 & 0.71 & 0.81 & 0.42 & 0.98 & 0.38 & 0.72 & 0.28 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  19 & 0.68 & 0.80 & 0.42 & 0.99 & 0.38 & 0.70 & 0.27 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
  20 & 0.64 & 0.78 & 0.41 & 0.99 & 0.39 & 0.68 & 0.25 \\ 
  se & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 & 0.15 \\ 
   \bottomrule
\end{longtable}
\endgroup


## Appendix B {-}

