#!/usr/bin/env bash

# Create folder for dataset
mkdir -p ./dataset

# Download the dataset
curl http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/jaffle_shop_orders.csv --output ./dataset/shop_orders.csv

curl http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/jaffle_shop_customers.csv --output ./dataset/shop_customers.csv

curl http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/stripe_payments.csv --output ./dataset/stripe_payments.csv

# Get the path to the directory containing this script
PROJECTDIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Get the Docker directory
DOCKERDIR="${PROJECTDIR}/docker"

# Move to the docker directory
cd "${DOCKERDIR}"

# Local dbt learn project directory
export LOCAL_DBT_PATH="${LOCAL_DBT_PATH:=${PROJECTDIR}/dbt_learn}"

# Launch the containers
docker-compose \
--project-name dbt-learn \
up \
--detach
