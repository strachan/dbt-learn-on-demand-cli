CREATE DATABASE raw;

GRANT ALL PRIVILEGES ON DATABASE raw TO postgres;

\connect raw;

CREATE SCHEMA jaffle_shop;

CREATE TABLE jaffle_shop.customers
(
    id integer,
    first_name varchar,
    last_name varchar
);

COPY jaffle_shop.customers (id, first_name, last_name)
FROM '/tmp/dataset/shop_customers.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE jaffle_shop.orders
(
  id integer,
  user_id integer,
  order_date date,
  status varchar,
  _etl_loaded_at timestamp default current_timestamp
);

COPY jaffle_shop.orders (id, user_id, order_date, status)
FROM '/tmp/dataset/shop_orders.csv' DELIMITER ',' CSV HEADER;

CREATE SCHEMA stripe;

CREATE TABLE stripe.payment (
  id integer,
  orderid integer,
  paymentmethod varchar,
  status varchar,
  amount integer,
  created date,
  _batched_at timestamp default current_timestamp
);

COPY stripe.payment (id, orderid, paymentmethod, status, amount, created)
FROM '/tmp/dataset/stripe_payments.csv' DELIMITER ',' CSV HEADER;
