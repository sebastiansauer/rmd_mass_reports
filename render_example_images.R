library(magick)

pdfs <- list.files(path = ".",
                   pattern = "Grading.+.pdf$")


pdfs


pdfs %>% 
  map(~ {
    image_read_pdf(path = .) %>% 
      image_border(image = ., "#000080", "10x10") %>% 
      image_scale(., "500") %>% 
      image_write(., path = paste0(.x, ".png"), format = "png")
    }
  )

