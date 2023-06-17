# poker_ligan
This project is for keeping track of a poker circuit.

# Setup:
Source data is in seeds folder as a csv, that file is then imported into the model sql queries. 
This projected is connected to bigquery, to run this project follow this guide https://docs.getdbt.com/docs/core/connect-data-platform/bigquery-setup
once everything is installed simply run `dbt seed` to create the source table from the csv file and then `dbt run` to run the models.
