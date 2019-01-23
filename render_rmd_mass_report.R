
# Render Rmarkdown file to PDF file



# setup ---------------------------------------------------------
library(tidyverse)



# load data -----------------------------------------------------

# name of data file (type csv):
data_file <- "grades.csv"





# we assume eg. a Germany-type csv:
mydata_raw <- read_delim(file = data_file,
                         delim = ";",
                         locale = locale(decimal_mark = ",",
                                         grouping_mark = ".",
                                         encoding = "UTF8"
                              ))


mydata %>% head()



# Main function -------------------------------------------------



render_rmd_mass_report <- function(template = "grading_template.Rmd",
                                   data = mydata) {
  # this function produces a pdf grading report for each student 
  # output: pdf file with grading for each student
  # input: grading data, RMarkdown template
  
  for (i in 1:nrow(data)) {
    
    # render pdf report for each student:
    rmarkdown::render(template,
                      
      # define variables for use in pdf report
      params = list(
        firstname = data[i, "Firstname"],
        name = data[i, "Name"],
        crit1 = data[i, "crit1"],
        crit2 = data[i, "crit2"],
        crit3 = data[i, "crit3"]
        # add here more grading criteria
        # make sure they are found both in the header row of the data file
        # as well as in the Rmd template
      ),
      
      # name output file
      output_file = paste0(
        "Grading_report_for_",
        data[i, "Name"],
        "_",
        data[i, "Firstname"],
        "_asof_",
        Sys.Date(),
        ".pdf"
      )
    )
  }
}




# Run -----------------------------------------------------------


# do it:
render_rmd_mass_report()

