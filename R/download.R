#' Download the data file for a given IPEDS table.
#'
#' @param table_id A table ID.
#' @return The path to the downloaded zip file of that table's data.
download_data = function(table_id) {
  url = stringr::str_c(
    "https://nces.ed.gov/ipeds/datacenter/data/", table_id, ".zip")
  local_dir = tempdir()
  local_path = file.path(local_dir, stringr::str_c(table_id, ".zip"))
  httr::GET(
    url, httr::write_disk(local_path, overwrite = TRUE), httr::progress())
  local_path
}

#' Download the metadata for a given IPEDS table.
#'
#' @param table_id A table ID.
#' @return The path to the downloaded zip file of that table's metadata.
download_metadata = function(table_id) {
  url = stringr::str_c(
    "https://nces.ed.gov/ipeds/datacenter/data/", table_id, "_Dict.zip")
  local_dir = tempdir()
  local_path = file.path(local_dir, stringr::str_c(table_id, ".zip"))
  httr::GET(
    url, httr::write_disk(local_path, overwrite = TRUE), httr::progress())
  local_path
}
