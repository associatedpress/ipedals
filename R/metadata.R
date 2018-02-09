#' Read labels from a varlist sheet and add them to the given data table.
#'
#' @param table_data A tibble of IPEDS data.
#' @param varlist A tibble of an IPEDS metadata file's `varlist` sheet.
#' @return The modified `table_data`.
add_labels = function(table_data, varlist) {
  field_names = colnames(table_data)
  for (i in seq_along(field_names)) {
    field_name = field_names[[i]]
    label = dplyr::filter(varlist, varname == field_name)$varTitle
    attr(table_data[[field_name]], "label") = label
  }
  table_data
}

#' Build a full column specification from an IPEDS varlist.
#'
#' @param varlist A tibble of an IPEDS metadata file's `varlist` sheet.
#' @return A column specification as returned by `readr::cols`.
get_column_types = function(varlist) {
  specs = list()
  for (i in 1:nrow(varlist)) {
    row = varlist[i,]
    var_name = row$varname
    data_type = row$DataType
    if (data_type == "A") {
      specs[[var_name]] = readr::col_character()
    }
  }
  do.call(readr::cols, specs)
}
