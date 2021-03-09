install_package <- function(data){
  ipackage <- c()
  for ( package in data) {
    if ( package %in% rownames(installed.packages()) == FALSE) {
      ipackage <- c(ipackage, package)
    } 
  }
  return(ipackage)
}

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

