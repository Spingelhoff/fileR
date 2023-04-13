#' Recursively moves all files in the data directory except those in the target
#' folder to the target folder.
#'
#' @description
#' Copies and pastes all files in the data 'folder' to a target folder while
#' ignoring the target folder. Original files are then deleted.
#'
#' @param to Character input. Specify sub folder in 'data'
#' directory to read from.
#'
#' @export move_all_files_to_data_folder

move_all_files_to_data_folder <- function(to) {
  if(!is.character(to)) {
    stop("to parameter must be of type character")
  }
  if(length(to) != 1) {
    stop("to parameter must be of length 1")
  }
  all_files <- list.files(paste0("./data"), recursive = TRUE, full.names = TRUE)
  target_files <- all_files[!grepl(paste0("^./data/", to, "/"), all_files)]
  file.copy(
    from = target_files,
    to = paste0("./data/", to, "/")
  )
  from_test <- sub("^.*/", "", list.files("./data", recursive = TRUE))
  to_test <- list.files(paste0("./data/", to))
  if(!all((from_test %in% to_test))) {
    stop("files were not correctly copied")
  }
  file.remove(target_files)
  invisible(NULL)
}
