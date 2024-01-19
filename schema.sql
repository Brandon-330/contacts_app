CREATE TYPE category AS ENUM ('family', 'friends', 'work', 'other');

CREATE TABLE categories (
  id serial PRIMARY KEY,
  type category NOT NULL
);

CREATE TABLE contacts (
  id serial PRIMARY KEY,
  name text NOT NULL,
  phone_number bigint CHECK(phone_number > 999999999 AND phone_number < 10000000000) NOT NULL,
  email_address text CHECK(email_address LIKE '%@%' AND email_address LIKE '%.com'),
  description varchar(255),
  category_id int REFERENCES categories(id)
);