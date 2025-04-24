library(tidyverse)
library(palmerpenguins)

dir.create("data", showWarnings = FALSE)

data <- penguins %>% drop_na()

write_rds(data, "data/clean_data.rds")