
# Render Rmarkdown file to PDF file

library(tidyverse)

mydata <- read.csv("grades.csv")



render_rmd_mass_report <- function(template = "grading_template.Rmd",
                                   data = mydata) {
  for (i in 1:nrow(data)) {
    rmarkdown::render(template,
      params = list(
        name = data[i, "Name"],
        crit1 = data[i, "crit1"],
        crit2 = data[i, "crit2"],
        crit3 = data[i, "crit3"]
      ),
      output_file = paste0(
        "Grading_report_for_",
        data[i, "Name"],
        "_asof_",
        Sys.Date(),
        ".pdf"
      )
    )
  }
}




# do it:
render_rmd_mass_report()

