# rmd_mass_reports
Generating mass reports using Rmarkdown in R


This repo describes a way how to compile many similar reports using RMarkdown in R. 
Specifically, it is assumed that there's a tabular data, where each row is a document,
and each column holds the variables to appear in the reports. 
In addition, a template is provided where the variables are then parsed into. 
This template is built on latex, so that the output document is a pdf file.
