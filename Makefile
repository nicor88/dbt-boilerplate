postgres-up: postgres-down
	docker-compose up -d

postgres-down:
	docker-compose down

install-dbt:
	pip install -r requirements.txt

init-dbt-profile:
	echo ${HOME}
	mkdir -p ${HOME}/.dbt/ && cp profiles.example.yml ${HOME}/.dbt/profiles.yml
