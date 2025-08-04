
postgres=# \c library_db
You are now connected to database "library_db" as user "postgres".
library_db=# CREATE TABLE books (
library_db(#   book_id SERIAL PRIMARY KEY,
library_db(#   title VARCHAR(100),
library_db(#   author VARCHAR(100),
library_db(#   year_published INT,
library_db(#   isAvailable BOOLEAN,
library_db(#   price NUMERIC(9,3),
library_db(#   publication VARCHAR(100)
library_db(# );
INSERT INTO books(title, author, year_published, isAvailable, price, publication)
VALUES
('Harry Potter','Jk Rowling',2007,TRUE,499.9,'Bloomsbury'),
('Pride and Prejudice','Jane Austen',1813,TRUE,592.32,'Hurtwell'),
('A Boy At Seven','John Bidwell',1984,FALSE,320.2,'Fear Aspen'),
('The Open Boat','Stephen Crane',1871,TRUE,860.33,'Classic'),
('To Kill a MockingBird','Harper Lee',1960,FALSE,999.99,'Bloomsbury'),
('The Great Gatsby','F.Scott',1920,FALSE,456.9,'Jazz age'),
('Broken Glass','Alain Mabanckou',2005,TRUE,496.9,'Helen stevenson'),
('The Girl With Dragon Tattoo','Steig Larsson',2005,TRUE,560.0,'Bloomsbury'),
('A Little Life','Hanya Yanagihara',2015,FALSE,430.09,'KK rbw'),
('Chronicles','Bob Dylan',2004,TRUE,500.00,'Bloomsbury'),
('A Northern Light','Christina',1980,FALSE,680.80,'Blob'),
('A Little Princess','Jullie',1905,TRUE,970.9,'Klickle'),
('Light','M John Harrison',2002,FALSE,780.0,'Kinkey'),
('Bad Blood','Lorna Sage',2000,TRUE,650.32,'Oraclein'),
('Noughts and Crosses','Malorie Blackman',2001,TRUE,750.30,'Bloomsbury');
library_db=# SELECT*FROM books;
library_db=# SELECT*FROM books WHERE year_published>2000;
library_db=# SELECT*FROM books WHERE price<599.00 ORDER BY price DESC;
library_db=# SELECT*FROM books ORDER BY price DESC LIMIT 3;
library_db=# SELECT*FROM books ORDER BY year_published DESC OFFSET 2 LIMIT 2;
library_db=# SELECT*FROM books WHERE publication= 'Bloomsbury' ORDER BY title ASC;




