## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

knitr::opts_chunk$set(message = FALSE)
knitr::opts_chunk$set(warning = FALSE)

options(rmarkdown.html_vignette.check_title = FALSE)

## ----setup--------------------------------------------------------------------
library(hdImpute)
library(tidyverse)

## ----data---------------------------------------------------------------------
d <- data.frame(X1 = c(1:6), 
                X2 = c(rep("A", 3), 
                       rep("B", 3)), 
                X3 = c(3:8),
                X4 = c(5:10),
                X5 = c(rep("A", 3), 
                       rep("B", 3)), 
                X6 = c(6,3,9,4,4,6))

set.seed(1234)

data <- missForest::prodNA(d, noNA = 0.30) %>% 
  as_tibble()

data

## ----col1---------------------------------------------------------------------
check_feature_na(data = data)

## ----col2---------------------------------------------------------------------
check_feature_na(data = data,
         threshold = 0.5)

## ----col3---------------------------------------------------------------------
check_feature_na(d)

## ----row1---------------------------------------------------------------------
check_row_na(data)

## ----row2---------------------------------------------------------------------
check_row_na(data, which = TRUE)

## ----row3---------------------------------------------------------------------
check_row_na(data, which = TRUE)[2] %>%
  unnest(cols = c(which_rows))

## ----row4---------------------------------------------------------------------
check_row_na(d)

