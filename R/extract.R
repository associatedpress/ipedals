#' Load the data CSV from an IPEDS zip file.
#'
#' @importFrom magrittr %>%
#' @param local_path The path to a downloaded zip file.
#' @return A tibble of data.
extract_csv = function(local_path) {
  csv_filenames = unzip(local_path, list = TRUE) %>%
    tibble::as_tibble() %>%
    dplyr::filter(stringr::str_detect(Name, "\\.csv$"))
  csv_filename = csv_filenames[1,]$Name
  csv_conn = unz(local_path, csv_filename)
  readr::read_csv(csv_conn)
}
