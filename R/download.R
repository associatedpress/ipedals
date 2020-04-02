#' Download the data file for a given IPEDS table.
#'
#' @param table_id A table ID.
#' @param local_dir A path to a directory where the raw data file should be
#'   saved.
#' @return The path to the downloaded zip file of that table's data.
download_data <- function(table_id, local_dir) {
  url <- stringr::str_c(
    "https://nces.ed.gov/ipeds/datacenter/data/", table_id, ".zip")
  local_path <- file.path(local_dir, stringr::str_c(table_id, ".zip"))
  if (file.exists(local_path)) {
    print(stringr::str_c(
      "Data for ", table_id, " already exists at ", local_path))
  } else {
    print(stringr::str_c(
      "Downloading data for ", table_id, " to ", local_path))
    dir.create(local_dir, recursive = TRUE, showWarnings = FALSE)
    httr::GET(
      url, httr::write_disk(local_path, overwrite = TRUE), httr::progress())
  }
  local_path
}

#' Download the metadata for a given IPEDS table.
#'
#' @param table_id A table ID.
#' @param local_dir A path to a directory where the raw data file should be
#'   saved.
#' @return The path to the downloaded zip file of that table's metadata.
download_metadata <- function(table_id, local_dir) {
  url <- stringr::str_c(
    "https://nces.ed.gov/ipeds/datacenter/data/", table_id, "_Dict.zip")
  local_path <- file.path(local_dir, stringr::str_c(table_id, "_Dict.zip"))
  if (file.exists(local_path)) {
    print(stringr::str_c(
      "Metadata for ", table_id, " already exists at ", local_path))
  } else {
    print(stringr::str_c(
      "Downloading metadata for ", table_id, " to ", local_path))
    dir.create(local_dir, recursive = TRUE, showWarnings = FALSE)
    httr::GET(
      url, httr::write_disk(local_path, overwrite = TRUE), httr::progress())
  }
  local_path
}
