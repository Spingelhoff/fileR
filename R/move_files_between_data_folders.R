#' Moves files from one 'folder' in the data directory to another 'folder'.
#'
#' @description
#' Copies and pastes files into target data 'folder.' Original files are then
#' deleted.
#'
#' @param from Character input. Specify 'folder' in data directory to move files
#' from.
#'
#' @param to Character input. Specify 'folder' in data directory to move files
#' to.
#'
#' @export move_files_between_data_folders

move_files_between_data_folders <- function(from, to) {
  if(!is.character(from) || !is.character(to)) {
    stop("from and to parameters must be of type character")
  }
  if(length(from) != 1 || length(to) != 1) {
    stop("from and to parameters must be of length 1")
  }
  files <- list.files(paste0("./data/", from), full.names = TRUE)
  file.copy(
    from = files,
    to = paste0("./data/", to)
  )
  from_test <- list.files(paste0("./data/", from))
  to_test <- list.files(paste0("./data/", to))
  if(!all((from_test %in% to_test))) {
    stop("files were not correctly copied")
  }
  file.remove(files)
  invisible(NULL)
}
