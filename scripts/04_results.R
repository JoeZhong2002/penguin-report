library(tidymodels)
dir.create("results", showWarnings = FALSE)

model_obj <- readRDS("results/model_fit.rds")
penguin_fit <- model_obj$fit
test_data <- model_obj$test_data

predictions <- predict(penguin_fit, test_data, type = "class") %>%
  bind_cols(test_data)

conf_mat_res <- conf_mat(predictions, truth = species, estimate = .pred_class)

saveRDS(conf_mat_res, "results/confusion_matrix.rds")
