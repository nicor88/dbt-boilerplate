# dbt-boilerplate

## Requirements
* Python >= 3

## Setup
* Install dbt running: `make install-dbt`
* Init your dbt profile running: `make init-dbt-profile`
* Run: `make postgres-up` to run a local instance of Postgres DB
* If you want to stop your Postgres instance, run `make postgres-down`

## Seed
The first step to do, it's to run the seed command, that will import static tables to your destination db.
It's possible to create tables from static CSV files inside the `data` folder simply calling:
<pre>
dbt seed --show
</pre>

## Run
The mostly easy command to run a model is: `dbt run`, but sometimes we want to be more specific
<pre>
# call a model called my_model
dbt run --models my_model

# call all the models inside dimensions folder
dbt run --models dimensions

# call all the models with the tag sample
dbt run --models tag:fact

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

## Docs
<pre>
# generate docs
dbt docs generate

# serve docs
dbt docs serve
</pre>


## Notes
This repo is based on the amazing example of [jaffle_shop](https://github.com/fishtown-analytics/jaffle_shop)

## TODO 
- [x] Add a Makefile to init dbt, install libs, spin up Postgres locally
- [ ] Find other interesting dataset to make other examples
