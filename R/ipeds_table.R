#' Load a table's data and important metadata directly from the IPEDS website.
#'
#' @export
#' @param table_id A table ID.
#' @param local_dir An optional path to a directory where data files should be
#'   saved. If omitted, will use a temporary directory.
#' @return A list containing three tibbles: $table, $variables and $codebook.
ipeds_table <- function(table_id, local_dir) {
  if (missing(local_dir)) {
    local_dir <- tempdir()
  }
  meta_path <- download_metadata(table_id, local_dir)
  varlist <- extract_varlist(meta_path)
  codebook <- extract_codebook(meta_path)

  column_types <- get_column_types(varlist)

  data_path <- download_data(table_id, local_dir)
  table_data <- extract_csv(data_path, column_types)

  list(table = table_data, variables = varlist, codebook = codebook)
}
