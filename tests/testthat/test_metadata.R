context("Metadata")
library(ipedals)

varlist <- tibble::tribble(
  ~varname, ~DataType,
  "FOO",    "A",
  "BAR",    "A")
column_types <- readr::cols(
  FOO = readr::col_character(),
  BAR = readr::col_character())

test_that("get_column_types parses a variable list", {
  expect_equal(ipedals::get_column_types(varlist), column_types)
})
