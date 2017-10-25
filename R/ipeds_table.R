#' Load the data CSV from an IPEDS zip file.
#'
#' @param table_id A table ID.
#' @return A tibble of data.
ipeds_table = function(table_id) {
  local_path = download_data(table_id)
  extract_csv(local_path)
}
