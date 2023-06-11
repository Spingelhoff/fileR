# fileR
 R Package: A pipeable interface to directory and 'folder' creation and use.

## Introduction

The R programming language can be used for a variety of purposes. The use case I find most relevant to my day-to-day life (read day job), is the repetitive conversion of data from one form to another (typically for entry into a database). Without cooperate business infrastructure for R, most work needs to be done on my own workstation.

Many great packages and ecosystems exist for data manipulation in R. One collection of packages which frequently enters my work is the tidyverse. A key feature of these collection of packages is the ability of functions to be piped together.

The fileR package is my attempt at a framework that helps to facilitate repetitive data wrangling by separating file input/outputs into two distinct directories, 'data' and 'results'.

## Rationale/Framework

R by default saves and reads files into and from the working directory. As the number of file inputs and outputs increase, the readability decreases. This can be a problem when returning to older projects.

Sub-folder and directories is the obvious answer to organization problems however, working with file paths is cumbersome and prone to error. Approaches to file organization should be standardized across projects so file inputs and outputs are more readily understood between projects.

To facilitate reproducible and easy file organization, I created a minimal framework for working directory structure. I then created wrappers around base R functions for reading and writing files to interact with that framework.

The working directory is divided into three sections. The working directory itself, the 'data' directory and the 'results' directory. The working directory should only contain R scripts and the 'data' and 'results' directories. The 'data' directory should only contain raw data. The 'results' directory should contain all products of manipulation in R. 'Folders' (sub-directories) can be created within the 'data' and 'results' directory however, are recommended to be terminal.

## List of Functions

Functions were named to be descriptive at the cost of being verbose.

### create_data_folder()

Purpose: To create a folder in the 'data' directory. Data should be moved into pre-existing 'data' locations. 

### create_data_folder()

Purpose: To create a folder in the 'results' directory. All manipulated data should be output into the 'results' directory. 

### list_data_files()

Purpose: To list files in 'data' directory and optionally a sub-directory of the 'data' directory.

### move_all_files_to_data_folder()

Purpose: To move all files recursively in the 'data' directory to a specified 'data' folder. Files in the target folder prior to move are not affected. Additional folders can be specified, optionally.

### move_all_files_to_results_folder()

Purpose: To move all files recursively in the 'results' directory to a specified 'results' folder. Files in the target folder prior to move are not affected. Additional folders can be specified, optionally.

### move_files_between_data_folders()

Purpose: To move all files in one 'data' folder to another 'data' folder.

### move_files_between_results_folders()

Purpose: To move all files in one 'results' folder to another 'results' folder.

### read_all_csv_from_data()

Purpose: To return all csv files in the 'data' directory as a list. Sub-directories of the 'data' directory can also be targeted.

### read_all_csv_from_results()

Purpose: To return all csv files in the 'results' directory as a list. Sub-directories of the 'results' directory should be targeted over the entire 'results' directory. 

### read_csv_from_data()

Purpose: To read a single csv file from the 'data' directory or one of its sub-directories.

### read_csv_from_results()

Purpose: To read a single csv file from the 'data' directory or one of its sub-directories.

### save_csv_to_results_folder()

Purpose: To save an object to the 'results' directory or one of its sub-directories as a csv file. Will create a sub-directory or 'folder' if one does not exist. Will return the object passed in invisibly. 

### setup_fileR_directories()

Purpose: Creates 'data' and 'results' directories. Projects using fileR should start with this function. Optionally creates setup scripts to help quickly start up projects.
