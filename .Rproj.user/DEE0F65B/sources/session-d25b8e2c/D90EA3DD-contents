library(tidyverse)

dir.create("results", showWarnings = FALSE)

data <- read_rds("data/clean_data.rds")

# 查看摘要 & 作图
glimpse(data)
summary_stats <- summarise(data,
                           mean_bill_length = mean(bill_length_mm),
                           mean_bill_depth = mean(bill_depth_mm)
)
write_csv(summary_stats, "results/summary_stats.csv")

# 保存图像
p <- ggplot(data, aes(x = species, y = bill_length_mm, fill = species)) +
  geom_boxplot() +
  theme_minimal()
ggsave("results/bill_length_plot.png", p)

# 特征选择 & 类型转换
data <- data %>%
  select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
  mutate(species = as.factor(species))

write_rds(data, "data/model_data.rds")
