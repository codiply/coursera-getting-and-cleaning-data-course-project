Coursera Getting and Cleaning Data Course Project
==

This repository contains code and documentation for the preparation of a tidy data set from the *Human Activity Recognition Using Smartphones* dataset found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Files
--

- `tidy.txt`: The tidy dataset produced by `run_analysis.R`
- `CodeBook.md`: A code book describing the variables, the data, and the transformations performed to tidy up the data.
- `run_analysis.R`: The script that creates the tidy dataset. (see also instructions below)

Instructions
--

To reconstruct the tidy dataset:

- Clone this repository,
- Open RStudio,
- Set your path to the path of your cloned repository, and finally
- Open and run `run_analysis.R` from within RStudio.

The script will automatically download, and extract the raw data in a folder `raw`. If the folder already exists in your current path, the script assumes that the data have already been downloaded and it will skip this step.

**Note**: The script has been developed and tested under R version 3.1.2 (2014-10-31) and Windows 7.