## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

knitr::opts_chunk$set(message = FALSE)
knitr::opts_chunk$set(warning = FALSE)

options(rmarkdown.html_vignette.check_title = FALSE)

## ----setup, warning = FALSE, message = FALSE----------------------------------
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

## ----corr---------------------------------------------------------------------
all_cor <- feature_cor(data,
                       return_cor = TRUE)

## ----flatten------------------------------------------------------------------
flat_mat <- flatten_mat(all_cor,
                        return_mat = TRUE)

## ----impute-------------------------------------------------------------------
imputed1 <- impute_batches(data = data,
                           features = flat_mat, 
                           batch = 2)

## ----out----------------------------------------------------------------------
imputed1

## ----comp---------------------------------------------------------------------
data

## ----full---------------------------------------------------------------------
imputed2 <- hdImpute(data = data,
                     batch = 2)

## ----full_out-----------------------------------------------------------------
imputed2

