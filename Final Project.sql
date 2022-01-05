
-- Final Project
-- Tsundoku by Orlane

-- Task:
-- Core Requirements: 
-- 1. Create relational DB of your choice with minimum 5 tables
-- 2. Set Primary and Foreign Key constraints to create relations between the tables
-- 3. Using any type of the joins create a view that combines multiple tables in a logical way
-- 4. In your database, create a stored function that can be applied to a query in your DB
-- 5. Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
-- 6. Create DB diagram where all table relations are shown

-- Advanced Requirements (at least 3)
-- 1. In your database, create a stored procedure and demonstrate how it runs
-- 2. In your database, create a trigger and demonstrate how it runs
-- 3. In your database, create an event and demonstrate how it runs
-- 4a. Create a view that uses at least 3-4 base tables; 
-- 4b. prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis.
-- 5. Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis


CREATE DATABASE Tsundoku;
USE Tsundoku;


-- Table 1: Author Table where the first and last name of the authors are saved and linked with a unique number
CREATE TABLE Author (
	author_id INT NOT NULL PRIMARY KEY,
    author_first_name VARCHAR(50),
    author_last_name VARCHAR(50)
    );
    
-- Inserting values into Table 1
insert into Author (author_id, author_first_name, author_last_name) values (1, 'Hanya', 'Yanagihara');
insert into Author (author_id, author_first_name, author_last_name) values (2, 'Khaled', 'Hosseini');
insert into Author (author_id, author_first_name, author_last_name) values (3, 'Chimamanda Ngozi', 'Adichie');
insert into Author (author_id, author_first_name, author_last_name) values (4, 'bell', 'hooks');
insert into Author (author_id, author_first_name, author_last_name) values (5, 'Elizabeth', 'Acevedo');
insert into Author (author_id, author_first_name, author_last_name) values (6, 'Jodi', 'Picoult');
insert into Author (author_id, author_first_name, author_last_name) values (7, 'Richard', 'Shepherd');
insert into Author (author_id, author_first_name, author_last_name) values (8, 'Sara', 'Jafari');
insert into Author (author_id, author_first_name, author_last_name) values (9, 'Talia', 'Hibbert');
insert into Author (author_id, author_first_name, author_last_name) values (10, 'Ocean', 'Vuong');
insert into Author (author_id, author_first_name, author_last_name) values (11, 'Mohsin', 'Hamid');
insert into Author (author_id, author_first_name, author_last_name) values (12, 'Emma', 'Gannon');
insert into Author (author_id, author_first_name, author_last_name) values (13, 'Brit', 'Bennett');
insert into Author (author_id, author_first_name, author_last_name) values (14, 'Douglas', 'Stuart');
insert into Author (author_id, author_first_name, author_last_name) values (15, 'George', 'Orwell');
insert into Author (author_id, author_first_name, author_last_name) values (16, 'Sharlene', 'Teo');
insert into Author (author_id, author_first_name, author_last_name) values (17, 'Jennifer', 'Nansubuga Makumbi');
insert into Author (author_id, author_first_name, author_last_name) values (18, 'Min Jin', 'Lee');
insert into Author (author_id, author_first_name, author_last_name) values (19, 'Gabriel', 'García Márquez');
insert into Author (author_id, author_first_name, author_last_name) values (20, 'James', 'Baldwin');


-- Table 2: The name of books linked with author id. Can only have books from an author registered in Table 1
CREATE TABLE Book_Author (
	book_id INT NOT NULL PRIMARY KEY,
    author_id INT NOT NULL
    );


-- Adding a constraint to setting the author id as the foreign key
ALTER TABLE Book_Author
ADD CONSTRAINT
fk_author_id 
FOREIGN KEY
(author_id)
REFERENCES
Author
(author_id);

insert into Book_Author (book_id, author_id) values (1, 20);
insert into Book_Author (book_id, author_id) values (2, 19);
insert into Book_Author (book_id, author_id) values (3, 9);
insert into Book_Author (book_id, author_id) values (4, 9);
insert into Book_Author (book_id, author_id) values (5, 9);
insert into Book_Author (book_id, author_id) values (6, 4);
insert into Book_Author (book_id, author_id) values (7, 1);
insert into Book_Author (book_id, author_id) values (8, 5);
insert into Book_Author (book_id, author_id) values (9, 15);
insert into Book_Author (book_id, author_id) values (10, 15);
insert into Book_Author (book_id, author_id) values (11, 15);
insert into Book_Author (book_id, author_id) values (12, 15);
insert into Book_Author (book_id, author_id) values (13, 16);
insert into Book_Author (book_id, author_id) values (14, 2);
insert into Book_Author (book_id, author_id) values (15, 2);
insert into Book_Author (book_id, author_id) values (16, 2);
insert into Book_Author (book_id, author_id) values (17, 8);
insert into Book_Author (book_id, author_id) values (18, 11);
insert into Book_Author (book_id, author_id) values (19, 3);
insert into Book_Author (book_id, author_id) values (20, 10);
insert into Book_Author (book_id, author_id) values (21, 6);
insert into Book_Author (book_id, author_id) values (22, 7);
insert into Book_Author (book_id, author_id) values (23, 12);
insert into Book_Author (book_id, author_id) values (24, 13);
insert into Book_Author (book_id, author_id) values (25, 14);
insert into Book_Author (book_id, author_id) values (26, 17);
insert into Book_Author (book_id, author_id) values (27, 18);
insert into Book_Author (book_id, author_id) values (28, 3);
insert into Book_Author (book_id, author_id) values (29, 11);
insert into Book_Author (book_id, author_id) values (30, 20);


-- Table 3: Book name 

CREATE TABLE Book_Name (
	book_id INT NOT NULL,
    book_name VARCHAR(100)
    );

-- Adding a constraint to setting the book_id as the foreign key
ALTER TABLE Book_Name
ADD CONSTRAINT
fk_book_id 
FOREIGN KEY
(book_id)
REFERENCES
Book_Author
(book_id);


-- Inserting values into Table 3
insert into Book_Name (book_id, book_name) values (1, 'Notes of a Native Son');
insert into Book_Name (book_id, book_name) values (2, 'Love in the Time of Cholera');
insert into Book_Name (book_id, book_name) values (3, 'Get a life, Chloe Brown');
insert into Book_Name (book_id, book_name) values (4, 'Take a hint, Dani Brown');
insert into Book_Name (book_id, book_name) values (5, 'Act your age, Eve Brown');
insert into Book_Name (book_id, book_name) values (6, 'All About Love: New Visions');
insert into Book_Name (book_id, book_name) values (7, 'A Little Life');
insert into Book_Name (book_id, book_name) values (8, 'Clap when you land');
insert into Book_Name (book_id, book_name) values (9, 'Animal Farm');
insert into Book_Name (book_id, book_name) values (10, '1984');
insert into Book_Name (book_id, book_name) values (11, 'The Complete Novels');
insert into Book_Name (book_id, book_name) values (12, 'Homage to Catalonia');
insert into Book_Name (book_id, book_name) values (13, 'Ponti');
insert into Book_Name (book_id, book_name) values (14, 'And the Mountains Echoed');
insert into Book_Name (book_id, book_name) values (15, 'Sea Prayer');
insert into Book_Name (book_id, book_name) values (16, 'The Kite Runner');
insert into Book_Name (book_id, book_name) values (17, 'The Mismatch');
insert into Book_Name (book_id, book_name) values (18, 'Exit West');
insert into Book_Name (book_id, book_name) values (19, 'Purple Hibiscus');
insert into Book_Name (book_id, book_name) values (20, 'On Earth We\'re Briefly Gorgeous');
insert into Book_Name (book_id, book_name) values (21, 'Small Great Things');
insert into Book_Name (book_id, book_name) values (22, 'Unnatural Causes: The Life and Many Deaths of Britain\'s Top Forensic Pathologist');
insert into Book_Name (book_id, book_name) values (23, 'Olive');
insert into Book_Name (book_id, book_name) values (24, 'The Mothers');
insert into Book_Name (book_id, book_name) values (25, 'Shuggie Bain');
insert into Book_Name (book_id, book_name) values (26, 'Manchester Happened');
insert into Book_Name (book_id, book_name) values (27, 'Pachinko');
insert into Book_Name (book_id, book_name) values (28, 'Half of a Yellow Sun');
insert into Book_Name (book_id, book_name) values (29, 'The Reluctant Fundamentalist');
insert into Book_Name (book_id, book_name) values (30, 'If Beale Street Could Talk');


-- Table 4 - setting different genre types. One book can have multiple genres.
CREATE TABLE Genre (
    genre_id INT NOT NULL PRIMARY KEY,
    genre VARCHAR(50)
    );
    
  
-- Inserting values into Table 4
INSERT INTO Genre
(genre_id, genre)
VALUES
(1, 'Non-fiction'),
(2, 'Fiction'),
(3, 'Classics'),
(4, 'Essays'),
(5, 'Race'),
(6, 'Historical'),
(7, 'Magical realism'),
(8, 'Romance'),
(9, 'Contemporary'),
(10, 'LGBTQIA+'),
(11, 'Feminism'),
(12, 'Philosophy'),
(13, 'Self-help'),
(14, 'Science'),
(15, 'Literary'),
(16, 'Poetry'),
(17, 'Young Adult'),
(18, 'Fantasy'),
(19, 'Dystopian'),
(20, 'Science Fiction'),
(21, 'History'),
(22, 'Memoir'),
(23, 'Politics'),
(24, 'Short Stories'),
(25, 'Health'),
(26, 'True Crime');




-- Table 5 - assign genre(s) to each book
CREATE TABLE Book_Genre (
	book_id INT NOT NULL,
    genre_id INT NOT NULL
    );
 
 -- Adding a constraint to setting the book_id as the foreign key
ALTER TABLE Book_Genre
ADD CONSTRAINT
fk_book_id_book_genre 
FOREIGN KEY
(book_id)
REFERENCES
Book_Author
(book_id);

-- Adding a constraint to setting the genre_id as the foreign key
ALTER TABLE Book_Genre
ADD CONSTRAINT
fk_genre_id 
FOREIGN KEY
(genre_id)
REFERENCES
Genre
(genre_id);
    
-- Inserting values into Table 5. One book can have multiple genres.
INSERT INTO Book_Genre
(book_id, genre_id)
VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 5),
(2, 2),
(2, 3),
(2, 6),
(2, 7),
(2, 8),
(3, 2),
(3, 8),
(3, 9),
(4, 2),
(4, 8),
(4, 9),
(4, 10),
(5, 2),
(5, 8),
(5, 9),
(6, 1),
(6, 4),
(6, 11),
(6, 12),
(6, 13),
(7, 2),
(7, 9),
(7, 10),
(7, 15),
(8, 2),
(8, 9),
(8, 10),
(8, 16),
(8, 17),
(9, 2),
(9, 18),
(10, 2),
(10, 3),
(10, 19),
(10, 20),
(11, 2),
(11, 3),
(11, 20),
(12, 1),
(12, 3),
(12, 21),
(12, 22),
(12, 23),
(13, 2),
(13, 9),
(13, 15),
(14, 2),
(14, 6),
(14, 9),
(15, 2),
(15, 16),
(15, 24),
(16, 2),
(16, 6),
(16, 9),
(17, 2),
(18, 2),
(18, 7),
(18, 9),
(19, 2),
(19, 15),
(20, 2),
(20, 9),
(20, 10),
(20, 15),
(21, 2),
(21, 5),
(21, 15),
(22, 1),
(22, 14),
(22, 22),
(22, 25),
(22, 26),
(23, 2),
(23, 9),
(24, 2),
(24, 9),
(24, 15),
(25, 2),
(25, 6),
(25, 10),
(25, 15),
(26, 2),
(26, 24),
(27, 2),
(27, 6),
(28, 2),
(28, 6),
(29, 2),
(29, 9),
(29, 15),
(30, 2);

-- Table 6 - Is the book a digital/physical/audio version. Can own multiple versions of the book.

CREATE TABLE Book_Version (
	type_id INT NOT NULL PRIMARY KEY,
    type_of_book VARCHAR(50)
    );
    
    
-- Inserting values into Table 6 
INSERT INTO Book_Version
(type_id, type_of_book)
VALUES
(1, 'Audio'),
(2, 'Digital'),
(3, 'Physical');



-- Table 7 - Assigning each book with the type

CREATE TABLE Book_Type (
	book_id INT NOT NULL,
    type_id INT NOT NULL
    );
    


-- Adding a constraint to setting the book_id as the foreign key
ALTER TABLE Book_Type
ADD CONSTRAINT
fk_book_id_book_type
FOREIGN KEY
(book_id)
REFERENCES
Book_Author
(book_id);   

-- Adding a constraint to setting the type_id as the foreign key
ALTER TABLE Book_Type
ADD CONSTRAINT
fk_type_id_book_type 
FOREIGN KEY
(type_id)
REFERENCES
Book_Version
(type_id);    
    
-- Inserting values into Table 7
INSERT INTO Book_Type
(book_id, type_id)
VALUES
(1, 2),
(2, 2),
(3, 1),
(4, 2),
(5, 3),
(6, 3),
(7, 2),
(7, 3),
(8, 2),
(9, 1),
(9, 2),
(9, 3),
(10, 1),
(10, 3),
(11, 2),
(12, 2),
(13, 3),
(14, 2),
(14, 3),
(15, 1),
(16, 3),
(17, 2),
(18, 2),
(19, 3),
(20, 2),
(20, 3),
(21, 1),
(21, 3),
(22, 2),
(23, 2),
(24, 2),
(24, 3),
(25, 1),
(26, 1),
(27, 3),
(28, 3),
(29, 2),
(30, 1),
(30, 2); 


-- Table 8: How much does the book cost.

CREATE TABLE Price (
	book_id INT NOT NULL,
    type_id INT NOT NULL,
    price FLOAT
    );

-- Adding a constraint to setting the book_id as the foreign key
ALTER TABLE Price
ADD CONSTRAINT
fk_book_id_price 
FOREIGN KEY
(book_id)
REFERENCES
Book_Author
(book_id); 

-- Adding a constraint to setting the type_id as the foreign key
ALTER TABLE Price
ADD CONSTRAINT
fk_type_id_price 
FOREIGN KEY
(type_id)
REFERENCES
Book_Type
(type_id);



-- Inserting values into Table 8 
INSERT INTO Price
(book_id, type_id, price)
VALUES
(1, 2, 4.99),
(2, 2, 6.99),
(3, 1, 7.99),
(4, 2, 3.99),
(5, 3, 8.99),
(6, 3, 3.99),
(7, 2, 7.49),
(7, 3, 12.99),
(8, 2, 0.99),
(9, 1, 0.00),
(9, 2, 1.99),
(9, 3, 5.99),
(10, 1, 0.00),
(10, 3, 8.99),
(11, 2, 4.99),
(12, 2, 6.99),
(13, 3, 3.99),
(14, 2, 9.99),
(14, 3, 14.99),
(15, 1, 9.99),
(16, 3, 7.99),
(17, 2, 11.99),
(18, 2, 2.99),
(19, 3, 8.99),
(20, 2, 9.99),
(20, 3, 17.99),
(21, 1, 15.99),
(21, 3, 4.99),
(22, 2, 0.99),
(23, 2, 4.99),
(24, 2, 0.00),
(24, 3, 19.99),
(25, 1, 19.99),
(26, 1, 3.99),
(27, 3, 4.99),
(28, 3, 7.99),
(29, 2, 8.99),
(30, 1, 12.99),
(30, 2, 13.99); 


-- Table 9 - Has the book been read    

CREATE TABLE Read_Status (
	book_id INT NOT NULL,
    read_status BOOLEAN -- Where true = read, false = not read
    );
    
-- Adding a constraint to setting the book_id as the foreign key
ALTER TABLE Read_Status
ADD CONSTRAINT
fk_book_id_read_status
FOREIGN KEY
(book_id)
REFERENCES
Book_Author
(book_id); 


-- Insert values into Table 9

INSERT INTO Read_Status 
(book_id, read_status)
VALUES
(1, false),
(2, false),
(3, true),
(4, true),
(5, false),
(6, false),
(7, true),
(8, false),
(9, true),
(10, true),
(11, false),
(12, false),
(13, true),
(14, true),
(15, false),
(16, true),
(17, false),
(18, false),
(19, true),
(20, false),
(21, true),
(22, true),
(23, false),
(24, false),
(25, true),
(26, false),
(27, true),
(28, true),
(29, false),
(30, true);

-- Table 10 - Rating 

CREATE TABLE Rating (
	book_id INT NOT NULL,
    rating INT NOT NULL
    );
    
-- Adding a constraint to setting the book_id as the foreign key
ALTER TABLE Rating
ADD CONSTRAINT
fk_book_id_rating
FOREIGN KEY
(book_id)
REFERENCES
Book_Author
(book_id); 

    
-- Insert values into table

INSERT INTO Rating
(book_id, rating)
VALUES
(3, 4),
(4, 4),
(7, 5),
(9, 4),
(10, 3),
(13, 4),
(14, 5),
(16, 5),
(19, 3),
(21, 3),
(22, 2),
(25, 4),
(27, 3),
(28, 3),
(30, 3);


-- Core Requirement 3: Using any type of the joins create a view that combines multiple tables in a logical way

-- First join - Book name and Author
-- Relevant tables are Author (has name of author), Book_Name (name of book), Book_Author (has the id of both book and author)
USE Tsundoku;
SELECT bn.book_name as 'Book', a.author_first_name as 'First Name', a.author_last_name as 'Surname'
FROM 
Book_name bn
	INNER JOIN	Book_Author ba ON bn.book_id = ba.book_id
	INNER JOIN	Author a ON a.author_id = ba.author_id
ORDER BY bn.book_name;


-- Second join - Author and genre
-- Relevant tables Author (name), Genre (genre),
-- Book_Genre and Book Author (the bridges)

-- SELECT * FROM Genre;

SELECT DISTINCT a.author_first_name as 'First Name', 
a.author_last_name as 'Surname', g.genre as 'Genre'
FROM
Author a
	INNER JOIN Book_Author ba ON a.author_id = ba.author_id
    INNER JOIN Book_Genre bg ON ba.book_id = bg.book_id
    INNER JOIN Genre g ON bg.genre_id = g.genre_id 
ORDER BY a.author_first_name;


-- Third join - Book name, book type and price 
-- Relevant tables: Book name - Book_Name, Book Type - Book_Type, Book_Version, Price - Price

SELECT bn.book_name as 'Book', bv.type_of_book as 'Type', p.price as 'Price in (£)'
FROM Book_Name bn
	INNER JOIN Price p ON bn.book_id = p.book_id
    INNER JOIN Book_Version bv ON p.type_id = bv.type_id
ORDER BY bn.book_name;

-- Fourth join - Book name and rating
-- Relevant tables: Book name - Book_Name, rating - rating

SELECT bn.book_name as 'Book', r.rating as 'Rating'
FROM Book_Name bn
	INNER JOIN Rating r ON bn.book_id = r.book_id
ORDER BY bn.book_name;

-- Fifth join - Average Book genre and rating
-- Relevant tables: Genre - Genre, Book_Genre / Rating - Rating

SELECT g.genre as 'Genre', AVG(r.rating) as 'Rating'
FROM Genre g
	INNER JOIN Book_Genre bg ON g.genre_id = bg.genre_id
    INNER JOIN Rating r ON bg.book_id = r.book_id
GROUP BY g.genre ORDER BY g.genre;

-- Core Requirement 4: In your database, create a stored function that can be applied to a query in your DB

DELIMITER $$
CREATE FUNCTION recommend_book (
	rating INT
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	DECLARE recommendation VARCHAR(30);
    IF (rating >= 5) THEN 
		SET recommendation = 'Yes, I would recommend!';
    ELSEIF (rating < 5 and rating >= 3) THEN
		SET recommendation = 'I would maybe recommend.';
    ELSEIF (rating < 3) THEN
		SET recommendation = 'No, I would not recommend!';
    END IF;
    RETURN (recommendation);
    END $$

DELIMITER ; 
    


-- Core Requirement 5: Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis

SELECT *
FROM Book_Name
WHERE book_id IN (SELECT book_id FROM Rating WHERE rating>= 4);

-- Core Requirement 6: Create DB diagram where all table relations are shown

-- Made a PDF 

-- Advanced Requirement 1: In your database, create a stored procedure and demonstrate how it runs

DELIMITER $$

CREATE PROCEDURE GetContemporaryAuthors()
BEGIN
	SELECT DISTINCT
	a.author_first_name as 'First Name', a.author_last_name as 'Surname'
	FROM 
	Author a
	INNER JOIN Book_Author ba ON a.author_id = ba.author_id
    INNER JOIN Book_Genre bg ON ba.book_id = bg.book_id
    INNER JOIN Genre g ON bg.genre_id = g.genre_id
	WHERE g.genre = 'Contemporary'
    ORDER BY a.author_last_name;
END $$
DELIMITER ;

CALL GetContemporaryAuthors();

-- Advanced Requirement 2: In your database, create a trigger and demonstrate how it runs

SELECT *
FROM GENRE;

CREATE TRIGGER CapitaliseGenre
BEFORE INSERT ON Genre
FOR EACH ROW
SET NEW.genre = CONCAT(UCASE(LEFT(NEW.genre,1)),SUBSTRING(NEW.genre,2));

INSERT INTO Genre (genre_id, genre)
VALUES
(27, 'art'),
(28, 'horror'),
(29, 'Anthology'),
(30, 'Sociology');


-- Advanced Requirement 3: In your database, create an event and demonstrate how it runs



-- Advanced Requirement 4a: Create a view that uses at least 3-4 base tables; 
-- Create a table with author name, book name, genre and rating

CREATE VIEW ratingFiction AS
SELECT
a.author_first_name as 'First Name', a.author_last_name as 'Surname', 
bn.book_name as 'Book', g.genre as 'Genre', r.rating as 'Rating'
FROM 
Author a
	INNER JOIN Book_Author ba USING (author_id)
	INNER JOIN Book_Name bn USING (book_id)
	INNER JOIN Rating r USING (book_id)
	INNER JOIN Book_Genre bg USING (book_id)
	INNER JOIN Genre g USING (genre_id)
WHERE g.genre = 'Fiction'
ORDER BY a.author_last_name;



-- Advanced Requirement 4b: Prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis.
-- Fiction Authors with rating of 5

SELECT
a.author_first_name as 'First Name', a.author_last_name as 'Surname', 
bn.book_name as 'Book', g.genre as 'Genre', r.rating as 'Rating'
FROM 
Author a
	INNER JOIN Book_Author ba USING (author_id)
	INNER JOIN Book_Name bn USING (book_id)
	INNER JOIN Rating r USING (book_id)
	INNER JOIN Book_Genre bg USING (book_id)
	INNER JOIN Genre g USING (genre_id)
WHERE g.genre = 'Fiction' AND r.rating = 5
ORDER BY a.author_last_name;

-- Advanced Requirement 5: Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis

SELECT 
a.author_first_name as 'First Name', a.author_last_name as 'Surname', COUNT(ba.author_id) as 'Count'
FROM Author a
	INNER JOIN Book_Author ba USING (author_id)
GROUP BY a.author_first_name, a.author_last_name
HAVING COUNT(ba.author_id) > 1
ORDER BY COUNT ASC;

SELECT *
FROM Book_Name;


