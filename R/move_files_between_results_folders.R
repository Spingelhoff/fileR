#' Moves files from one 'folder' in the results directory to another 'folder'.
#'
#' @description
#' Copies and pastes files into target results 'folder.' Original files are then
#' deleted.
#'
#' @param from Character input. Specify 'folder' in results directory to move files
#' from.
#'
#' @param to Character input. Specify 'folder' in results directory to move files
#' to.
#'
#' @export move_files_between_results_folders

move_files_between_results_folders <- function(from, to) {
  if(!is.character(from) || !is.character(to)) {
    stop("from and to parameters must be of type character")
  }
  if(length(from) != 1 || length(to) != 1) {
    stop("from and to parameters must be of length 1")
  }
  files <- list.files(paste0("./results/", from), full.names = TRUE)
  file.copy(
    from = files,
    to = paste0("./results/", to)
  )
  from_test <- list.files(paste0("./results/", from))
  to_test <- list.files(paste0("./results/", to))
  if(!all((from_test %in% to_test))) {
    stop("files were not correctly copied")
  }
  file.remove(files)
  invisible(NULL)
}
