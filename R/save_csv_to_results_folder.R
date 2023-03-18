#' Pipeable function that saves the object passed in as a csv in the 'results'
#' directory.
#'
#' @description
#' A wrapper around `write.csv()` but with a pre-determined path to
#' a folder in the 'results' directory. Will force sub folder path/creation in
#' 'results' directory.
#'
#' @param x Object to be saved and invisibly returned.
#' @param folder_name Character input. 'results' sub folder name.
#' @param file_name Character input. Name of the csv file without the file
#' extension.
#' @param ... Passes arguments to `write.csv()`
#'
#' @returns The object 'x' that was passed in invisibly.
#'
#' @export save_csv_to_results_folder

save_csv_to_results_folder <- function(x, folder_name, file_name, ...) {
  if(!dir.exists("results")) {
    stop("results directory does not exist")
  }
  if(!is.character(folder_name) | !is.character(file_name)) {
    stop("folder_name and file_name must be of type character")
  }
  if(!dir.exists(paste0("./results/", folder_name))) {
    dir.create(paste0("./results/", folder_name))
  }
  write.csv(x, paste0("./results/", folder_name, "/", file_name, ".csv"), ...)
  invisible(x)
}
