CREATE TABLE contact (
  id serial PRIMARY KEY,
  name text NOT NULL,
  phone_number int CHECK(phone_numer > 99999999 && phone_number < 1000000000) NOT NULL,
  email_address text CHECK(email_address LIKE '%@%' AND email_address LIKE '%.com'),
  description varchar(255)
);

CREATE TYPE category AS ENUM ('family', 'friends', 'work', 'other');

CREATE TABLE categories (
  id serial PRIMARY KEY,
  type category NOT NULL,
  contact_id int REFERENCES contact(id)
);