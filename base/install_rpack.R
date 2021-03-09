args <- commandArgs(trailingOnly = TRUE)

if (length(args)==0){
  view <- "base"
} else {
  view <- args[1]
}

print(view)

if ( as.integer(R.Version()$major) >= 4 ) { # R < 4.x
  tidy <- c( 
              'broom', 
              'caret', 
              'choroplethr',
              'curl',
	      'dataCompareR',
              'DataExplorer',
              'datapasta',
              'datasets',
              'data.table', 
              'dplyr', 
              'DT',
	      'dygraphs',
	      'echarts4r',
              'esquisse',
	      'feather',
	      'flexdashboard',
              'forcats', 
              'formatR',
	      'fst',
              'future',
              'gapminder',
              'gcookbook',
              'gganimate',
	      'ggforce',
	      'ggmap',
              'ggplot2', 
              'ggthemes',
              'ggvis',
	      'githubinstall',
	      'gmodels',
	      'googleAnalyticsR',
	      'googleAuthR',
              'googlesheets4',
	      'googleVis',
	      'highcharter',
              'htmlTable', 
              'janitor', 
              'kableExtra',
              'keras', 
              'knitr', 
              'leaflet',
	      'listviewer',
              'lubridate',
	      'openxlsx',
              'mlr', 
              'odbc',
	      'officer',
	      'pacman',
	      'patchwork',
              'plotly',
	      'plumber',
              'proftools',
	      'profvis',
              'quantmod', 
              'rbokeh', 
              'Rcrawler',
	      'remedy',
              'remotes',
              'reticulate', 
              'rmarkdown', 
              'RMySQL',
              'RPostgreSQL',
              'RSQLite', 
              'rvest',
	      'scales',
              'selectr',
	      'shiny',
              'shinythemes',
              'snow', 
              'SnowballC',
              'splitstackshape', 
              'sqldf',
              'stringi',
              'tensorflow', 
              'testthat',
              'tidyquant',
              'tidyr',
              'tidytext', 
              'tidyverse',
              'tidyxl',
              'tsbox',
              'usmap',
              'validate',
              'xts')

  lubio <- c( 'ape',
               'argparse',
               'bigmemory',
               'Biobase',
               'biomaRt',
               'Biostrings',
               'circlize',
               'crosstalk',
               'ctc',
               'dendextend',
               'DESeq2',
               'DEXSeq',
               'doParallel',
               'edgeR',
               'fastcluster',
               'flashClust',
               'geneLenDataBase',
               'GenomicAlignments',
               'GenomicFeatures',
               'Glimma',
               'GOplot',
               'goseq',
               'gplots',
               'Heatplus',
               'Hmisc',
               'igraph',
               'lme4',
               'micropan',
               'microseq',
               'MLSeq',
               'multtest',
               'parallelDist',
               'phangorn',
               'phytools',
               'prophet',
               'pvclust',
               'qvalue',
               'randomForest',
               'Rdpack',
               'ROTS',
               'Rsamtools',
               'rstan',
               'rtracklayer',
               'Rtsne',
               'sctransform',
               'seqinr',
               'Seurat',
               'sm',
               'tximport',
               'tximportData',
               'uwot',
               'vegan',
               'VennDiagram',
               'WGCNA',
               'zoo')

  geo <- c( 'classInt',
              'deldir',
              'geofacet',
              'geoR',
              'geosphere',
              'gstat',
              'hdf5r',
              'lidR',
              'mapdata',
              'mapsapi',
              'maptools',
              'mapview',
              'ncdf4',
              'proj4',
              'RandomFields',
              'raster',
              'RColorBrewer',
              'rgdal',
              'rgeos',
              'rlas',
              'RNetCDF',
              'sf',
              'sp',
              'spacetime',
              'spatstat',
              'spdep',
              'sf', 
              'terrainr',
	      'tidycensus',
	      'tmap',
	      'tmaptools',
              'usmap')

  library(rvest)
  library(dplyr)
  spatial <- gsub(" \\(core\\)","", 
      read_html("https://cran.r-project.org/web/views/Spatial.html") %>%
      html_nodes(xpath = "/html/body/ul[1]") %>%
      html_children() %>%
      html_text()
    )
  graphics <- gsub(" \\(core\\)","",
      read_html("https://cran.r-project.org/web/views/Graphics.html") %>% 
      html_nodes(xpath = "/html/body/ul[1]") %>% 
      html_children() %>% 
      html_text()
    )
  databases <- gsub(" \\(core\\)","",
      read_html("https://cran.r-project.org/web/views/Databases.html") %>% 
      html_nodes(xpath = "/html/body/ul[1]") %>% 
      html_children() %>% 
      html_text()
    )
  nlp <- gsub(" \\(core\\)","",
      read_html("https://cran.r-project.org/web/views/NaturalLanguageProcessing.html") %>% 
      html_nodes(xpath = "/html/body/ul[1]") %>% 
      html_children() %>% 
      html_text()
    )
  stats <- gsub(" \\(core\\)","",
      read_html("https://cran.r-project.org/web/views/TeachingStatistics.html") %>% 
      html_nodes(xpath = "/html/body/ul[1]") %>% 
      html_children() %>% 
      html_text()
    )


ipackage <- c()
# Default views are tidy, graphics, databases, nlp, stats
  if ( view == "base" ){
    for ( package in c(tidy,graphics,databases,nlp,stats)) {
      if ( package %in% rownames(installed.packages())  == FALSE) {
        ipackage <- c(ipackage, package)
      }
    }
    if ( ! is.null(ipackage)) BiocManager::install(ipackage, update=TRUE, ask=FALSE)
  } else if ( view == "geo" || view == "spatial") {
    for ( package in c(tidy,graphics,databases,nlp,stats,geo,spatial)) {
      if ( package %in% rownames(installed.packages())  == FALSE) {
        ipackage <- c(ipackage, package)
      }
    }
    if ( ! is.null(ipackage)) BiocManager::install(ipackage, update=TRUE, ask=FALSE)
    remotes::install_git("https://git.rud.is/hrbrmstr/albersusa.git")
  } else if ( view == "lubio" ) {
    for ( package in c(tidy,graphics,databases,nlp,stats,lubio)) {
      if ( package %in% rownames(installed.packages())  == FALSE) {
        ipackage <- c(ipackage, package)
      }
    }
    if ( ! is.null(ipackage)) BiocManager::install(ipackage, update=TRUE, ask=FALSE)
  } else {
    for ( package in c(tidy,graphics,databases,nlp,stats,lubio,geo,spatial)) {
      if ( package %in% rownames(installed.packages())  == FALSE) {
        ipackage <- c(ipackage, package)
      }
    }
    if ( ! is.null(ipackage)) BiocManager::install(ipackage, update=TRUE, ask=FALSE)
    remotes::install_git("https://git.rud.is/hrbrmstr/albersusa.git")
  }

  warnings()

} else {
  source('install_3x.R')
}

nrow(as.data.frame(installed.packages()[,c(1,3,4)]))
