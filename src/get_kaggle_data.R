# author: Joshua Sia
# date: 2021-11-18

"This script downloads a dataset from a URL or a local file path.
Usage: get_data.R (--url=<url> --file=<file>) --out_file=<out_file>

Options:
--url=<url>             URL from where to download data
--file=<file>           Filaname of Kaggle dataset to download (file must be
                        specified when using URL)
--out_file=<out_file>   Path including filename of where to
                        locally write the file
" -> doc

# --url=https://www.kaggle.com/johnjdavisiv/us-counties-covid19-weather-sociohealth-data
# --file=us_county_sociohealth_data.csv

library(httr)
library(jsonlite)
library(docopt)
library(tidyverse)
library(testthat)

opt <- docopt(doc)

main <- function(opt) {
  if (!file.exists("kaggle.json")) {
    stop("Make sure you have a kaggle.json file")
  }
  user <- fromJSON("kaggle.json", flatten = TRUE)
  .kaggle_base_url <- "https://www.kaggle.com/api/v1"
    
  url <- get_url(opt$url, .kaggle_base_url, opt$file)
    
  rcall <- httr::GET(
    url,
    httr::authenticate(user$username, user$key, type="basic")
    )
  
  if (rcall[[2]] != 200){
    stop("Invalid URL")
  }
  
  content_type <- rcall[[3]]$`content-type`

  if (grepl("zip", content_type)) {
    temp <- tempfile()
    download.file(rcall$url, temp)
    df <- read.csv(unz(temp, opt$file))
    unlink(temp)
  }
  else {
    stop("URL does not lead to a valid data set.")
  }
  write.csv(df, opt$out_file, row.names = FALSE)
}

get_url <- function(url, .kaggle_base_url, filename) {
  idx <- str_locate(url, ".com")
  ref <- str_sub(url, start = idx[2] + 2, end = -1)
  paste0(.kaggle_base_url, "/datasets/download/", ref, "/", filename)
}

test_get_url <- function() {
  test_that("URL is parsed incorrectly", {
    expect_equal(
      get_url("kaggle.com/user/data", "https://www.kaggle.com/api/v1", "file"),
      "https://www.kaggle.com/api/v1/datasets/download/user/data/file"
      )
  })
  test_that("Output object should be a string", {
    expect_type(get_url("a", "b", "c"), "character")
  })
}

test_get_url()

main(opt)