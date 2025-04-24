# scripts/03_model.R

library(readr)
library(tidymodels)

data <- read_rds("data/model_data.rds")

set.seed(123)
data_split <- initial_split(data, strata = species)
train_data <- training(data_split)
test_data <- testing(data_split)

penguin_model <- nearest_neighbor(mode = "classification", neighbors = 5) %>%
  set_engine("kknn")

penguin_workflow <- workflow() %>%
  add_model(penguin_model) %>%
  add_formula(species ~ .)

penguin_fit <- penguin_workflow %>%
  fit(data = train_data)

saveRDS(list(fit = penguin_fit, test_data = test_data), "results/model_fit.rds")
