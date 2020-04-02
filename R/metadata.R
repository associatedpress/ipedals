#' Build a full column specification from an IPEDS varlist.
#'
#' @param varlist A tibble of an IPEDS metadata file's `varlist` sheet.
#' @return A column specification as returned by `readr::cols`.
get_column_types <- function(varlist) {
  specs <- list()
  for (i in 1:nrow(varlist)) {
    row <- varlist[i,]
    var_name <- row$varname
    data_type <- row$DataType
    if (data_type == "A") {
      specs[[var_name]] <- readr::col_character()
    }
  }
  do.call(readr::cols, specs)
}
