#' Load the data CSV from an IPEDS zip file.
#'
#' @importFrom magrittr %>%
#' @param local_path The path to a downloaded zip file.
#' @param column_types A column specification as returned by `readr::cols`.
#' @return A tibble of data.
extract_csv = function(local_path, column_types) {
  csv_filenames = unzip(local_path, list = TRUE) %>%
    tibble::as_tibble() %>%
    dplyr::filter(stringr::str_detect(Name, "\\.csv$"))
  csv_filename = csv_filenames[1,]$Name
  csv_conn = unz(local_path, csv_filename)
  readr::read_csv(csv_conn, col_types = column_types)
}

#' Load the column type/title metadata from an IPEDS zip file.
#'
#' @importFrom magrittr %>%
#' @param local_path The path to a downloaded zip file.
#' @return A tibble of data.
extract_varlist = function(local_path) {
  xlsx_filenames = unzip(local_path, list = TRUE) %>%
    tibble::as_tibble() %>%
    dplyr::filter(stringr::str_detect(Name, "\\.xlsx$"))
  xlsx_filename = xlsx_filenames[1,]$Name
  local_dir = dirname(local_path)
  unzip(local_path, xlsx_filename, exdir = local_dir)
  readxl::read_excel(file.path(local_dir, xlsx_filename), sheet = "varlist")
}

