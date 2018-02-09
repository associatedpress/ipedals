#' Load the data CSV from an IPEDS zip file.
#'
#' @export
#' @param table_id A table ID.
#' @return A list containing two tibbles: $table and $codebook.
ipeds_table = function(table_id) {
  print(stringr::str_c("Downloading metadata for ", table_id))
  meta_path = download_metadata(table_id)
  varlist = extract_varlist(meta_path)
  codebook = extract_codebook(meta_path)

  column_types = get_column_types(varlist)

  print(stringr::str_c("Downloading data for ", table_id))
  data_path = download_data(table_id)
  table_data = extract_csv(data_path, column_types)
  with_labels = add_labels(table_data, varlist)

  list(table=with_labels, codebook=codebook)
}
