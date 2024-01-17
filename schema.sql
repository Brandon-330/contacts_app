CREATE TABLE contact (
  id serial PRIMARY KEY,
  name text NOT NULL,
  phone_number int CHECK(phone_numer > 99999999 && phone_number < 1000000000) NOT NULL,
  email text 
  description varchar(255)
)
--NOT FINISHED YET