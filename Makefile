# Joshua Sia
# 2021-11-26
#
# Driver script for analysis pipeline of socioeconomic features associated with COVID-19 cases
#
# Usage:
# make all

all : doc/covid_socioeconomic_report.html

# Download data file
data/raw/US_counties_COVID19_health_weather_data.csv :
		Rscript src/get_kaggle_data.R --url=https://www.kaggle.com/johnjdavisiv/us-counties-covid19-weather-sociohealth-data --file=US_counties_COVID19_health_weather_data.csv --out_dir=data/raw

# Perform data wrangling
data/processed/cleaned_data.csv : data/raw/US_counties_COVID19_health_weather_data.csv
		Rscript src/data_wrangling.R --input=data/raw/US_counties_COVID19_health_weather_data.csv --output=data/processed

# EDA
results/highest_covid_cases.rds results/lowest_covid_cases.rds results/numeric_feats_dist.png results/cases_per_100k.png : data/processed/cleaned_data.csv
		Rscript src/eda_covid_socioeconomics.R --in_file=data/processed/cleaned_data.csv --out_dir=results

# Perform data analysis
results/feature_coefs.png results/mlr_model.rds : data/processed/cleaned_data.csv
		Rscript src/analyse_socioeconomic_features.R --in_file=data/processed/cleaned_data.csv --out_dir=results

# Render report
doc/covid_socioeconomic_report.html : doc/covid_socioeconomic_report.Rmd results/highest_covid_cases.rds results/lowest_covid_cases.rds results/numeric_feats_dist.png results/cases_per_100k.png results/feature_coefs.png results/mlr_model.rds
		Rscript -e "rmarkdown::render('doc/covid_socioeconomic_report.Rmd')"

clean :
		rm -rf results/*
		rm -rf data/processed/*
