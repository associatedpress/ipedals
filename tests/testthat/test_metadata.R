context("Metadata")
library(ipedals)

varlist <- tibble::tribble(
  ~varname, ~DataType,
  "UNITID", "N",
  "FOO",    "A",
  "BAR",    "N")
column_types <- readr::cols(
  UNITID = readr::col_character(),
  FOO = readr::col_character(),
  BAR = readr::col_number())

test_that("get_column_types parses a variable list", {
  expect_equal(ipedals::get_column_types(varlist), column_types)
})
