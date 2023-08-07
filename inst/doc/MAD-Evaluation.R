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

data

## ----imp1---------------------------------------------------------------------
imputed = hdImpute(data = data, batch = 2)

## ----imp2---------------------------------------------------------------------
imputed

## ----mad----------------------------------------------------------------------
mad(original = data,
    imputed = imputed,
    round = 1)

## ----mad2---------------------------------------------------------------------
mad_scores <- mad(original = data,
    imputed = imputed,
    round = 1)

## ----viz----------------------------------------------------------------------
mad_scores %>%
  ggplot(aes(x = mad)) +
  geom_histogram(fill = "dark green") +
  labs(x = "MAD Scores (%)", y = "Count of Variables", title = "Distribution of MAD Scores") +
  theme_minimal() +
  theme(legend.position = "none")

## ----viz2---------------------------------------------------------------------
mad_scores %>%
  ggplot(aes(x = mad)) +
  geom_boxplot(fill = "dodgerblue") +
  labs(x = "MAD Scores (%)", title = "Distribution of MAD Scores") +
  theme_minimal() +
  theme(legend.position = "none")

