# dbt-boilerplate

## Requirements
* Python >= 3

## Setup
* Install pip install -r requirements.txt
* Copy **_profiles.local.yml_** to **_~/.dbt/_**: 
<pre>mkdir ~/.dbt/ && cp profiles.example.yml ~/.dbt/profiles.yml</pre>

## Run
The mosty easy command to run a model is: `dbt run`, but sometimes we want to be more specific
<pre>
# call a model called my_model
dbt run --models example

# call all the models inside dimensions folder
dbt run --models dimensions

# call all the models with the tag sample
dbt run --models tag:sample

# call a model with a specific target
dbt run --models example --target dev
</pre>

## Test
<pre>
# run all the test for the default target
dbt test

# test specific model
dbt test --models date_dim

</pre>

## Seed
It's possible to create tables from static CSV files inside the `data` folder simply calling:
<pre>
dbt seed --show
</pre>
