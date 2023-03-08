#' Creates a folder in the data directory.
#'
#' @description
#' Checks for the existence of specified sub folder in 'data' directory and
#' creates it if it does not exist. Requires data and results directory to be
#' set up.
#'
#' @param folder_name Character input. Sub folder name.
#'
#' @returns NULL
#'
#' @export create_data_folder

create_data_folder <- function(folder_name) {
  if(!is.character(folder_name)) {
    stop("folder_name must be of type character")
  }
  if(!dir.exists("data") | !dir.exists("results")) {
    stop("data and/or results directories do not exist")
  }
  if(dir.exists(paste0("./data/", folder_name))) {
    warning(paste0(folder_name, " already exists"))
  } else {
    dir.create(paste0("./data/", folder_name))
  }
}
