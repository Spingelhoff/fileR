% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setup_fileR_directories.R
\name{setup_fileR_directories}
\alias{setup_fileR_directories}
\title{Set up 'data' and 'result' directories as prescribed by organizeR.}
\usage{
setup_fileR_directories()
}
\description{
Looks for directories named 'data' and 'result' in current directory. Will
creates them if directories do not exist. This is the set up for all other
functions in the package and it is expected projects start by calling this
function.
}
