---
editor_options: 
  markdown: 
    wrap: 72
---

# U.S. Social Determinants of Health per County
Authors: Joshua Sia, Morgan Rosenberg, Sufang Tan, Yinan Guo \[Group
25\]
Data analysis project for DSCI 522 (Data Science Workflows); a course in
the Master of Data Science program at the University of British
Columbia.
## **About**
The data set used in this project contains county-level data on health,
socioeconomics, weather, and COVID-19 cases compiled by John Davis. It
can be found
[here](https://www.kaggle.com/johnjdavisiv/us-counties-covid19-weather-sociohealth-data),
specifically, the `US_counties_COVID19_health_weather_data.csv` file.
Each row in the data set represents a date corresponding to the number
of COVID-19 cases in the county, as well as other features about the
county (e.g. smokers percentage, population, income ratio, etc.).
## **EDA**
The results of EDA can be found here.
## **Dependencies**
-   Python 3.9.5 and Python packages:
    -   docopt
-   R version 4.1.1 and R packages:
    -   docopt=0.7.1
    -   tidyverse=1.3.1
    -   httr=1.4.2
    -   jsonlite=1.7.2
# **References**
# **Proposal**
## Data Set:
US Counties: COVID19 + Weather + Socio/Health data
## License:
CC0 Public Domain
### Research Question \[Inference\]:
How are certain features associated with the prevalence of COVID-19
cases?
#### 1. Which features (columns) should be included in this analysis (there are \<200 columns right now)? \[Inference\]
Proposed: we will begin by selecting features by intuition, and then
iteratively remove statistically insignificant / practically non-useful
features, while adding new features we become curious about.
#### 2. What is an appropriate model to assess the relationship between features and COVID-19 cases? \[Inference\]
Proposed: a linear regression model will be the most effective to
identify statistically significant relationships between features and
COVID-19 cases.
### Analysis Tools:
-   Subset list of column features based on intuition to select
    explanatory variables
-   Check descriptive statistics (e.g. distribution, maximum, minimum,
    mean, etc.)
-   Linear regression with number of cases as the response variable and
    the features as the explanatory variables
### Potential EDA and Communicating Results:
Table: list of COVID-19 prevalence per county (total cases, per capita,
growth rate). This will inform our baseline understanding of the most
affected counties, which could then give us contextual understanding to
further our EDA, and interpretation of our analysis. We will experiment
by arranging this data in different orders (e.g. group by county, sort
in descending order of each column) and display the most informative
version(s) of the chart.
Figure: successive scatterplots comparing total cases/ capita / county
with mean incidence / county of each of our potential features This will
inform general observable trends between the features and the incidence
of COVID-19, and give an early indication if our question and summary
statistics (total COVID-19 cases and feature values) will bear useful
insights These will be displayed in a \~5x5 table of charts so that we
can quickly glance and infer the above insights
Google Docs version:
<https://docs.google.com/document/d/1xz1IXzIOj5ipOBCKeWuyp-FSJ5Tw5v0nJb0PJr-Zozw/edit>
