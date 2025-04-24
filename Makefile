all: results/confusion_matrix.rds

data/clean_data.rds:
	Rscript scripts/01_load_data.R

results/summary_stats.csv data/model_data.rds: data/clean_data.rds
	Rscript scripts/02_methods.R

results/model_fit.rds: data/model_data.rds
	Rscript scripts/03_model.R

results/confusion_matrix.rds: results/model_fit.rds
	Rscript scripts/04_results.R

report:
	quarto render
	
clean:
	rm -rf data/*.rds results/*
	rm -rf docs