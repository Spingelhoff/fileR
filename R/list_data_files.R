#' List files in data directory
#'
#' @description
#' Searches data directory for optional sub folder denoted by folder_name
#' argument. If folder does not exist, function will throw an error.
#'
#' @param folder_name Character input. 'data' sub folder name.
#'
#' @returns List of file names.
#'
#' @export list_data_files

list_data_files <- function(folder_name = NULL) {
  if(is.null(folder_name)) {
    return(list.files("./data"))
  } else if(!dir.exists(paste0("./data/", folder_name))) {
    stop(paste0(folder_name, " does not exist in data directory"))
  } else {
    return(list.files(paste0("./data/", folder_name)))
  }
}
