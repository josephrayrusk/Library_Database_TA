USE db_library

DROP TABLE book_authors
DROP TABLE book_loans
DROP TABLE book_copies
DROP TABLE book_name
DROP TABLE borrower
DROP TABLE library_branch
DROP TABLE publisher


CREATE TABLE publisher (
		pname_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		p_name VARCHAR (100) NOT NULL, 
		p_address VARCHAR (100) NOT NULL,
		p_phone VARCHAR (20)
	);
SELECT * FROM publisher

CREATE TABLE library_branch (
		branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		branch_name VARCHAR (20) NOT NULL,
		branch_address VARCHAR (20)
	);
SELECT * FROM library_branch

CREATE TABLE borrower (
		card_n INT PRIMARY KEY NOT NULL IDENTITY (1001,1),
		b_name VARCHAR (30) NOT NULL,
		b_address VARCHAR (100) NOT NULL,
		b_phone VARCHAR (20) NOT NULL
	);
SELECT * FROM borrower

CREATE TABLE book_name (
        book_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
        title VARCHAR(50) NOT NULL,
		p_name VARCHAR(50) NOT NULL
    );
SELECT * FROM book_name

CREATE TABLE book_copies (
		bookcopies_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_id INT CONSTRAINT fk_book_id FOREIGN KEY REFERENCES book_name(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		branch_id INT CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		b_copies INT NOT NULL
	);
SELECT * FROM book_copies

CREATE TABLE book_loans (
		bookloan_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_id INT CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES book_name(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		branch_id INT CONSTRAINT fk_branch_id2 FOREIGN KEY REFERENCES library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		card_n INT CONSTRAINT fk_card_n FOREIGN KEY REFERENCES borrower(card_n) ON UPDATE CASCADE ON DELETE CASCADE,
		out_date DATE NOT NULL,
		due_date DATE NOT NULL
	);
SELECT * FROM book_loans

CREATE TABLE book_authors (
		author_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_id INT FOREIGN KEY REFERENCES book_name (book_id),
		author_name VARCHAR(50) NOT NULL,
	);
SELECT * FROM book_authors

INSERT INTO publisher
	(p_name, p_address, p_phone)
	VALUES
	('Scribner','6542 South Street, Ontario Ca, 92658','845-265-7653'),
	('Henery Holt','4862 Pershing, Chicago ','865-265-7653'),
	('Scholastic','6542 South Street, Ontario Ca, 92658','645-279-7650'),
	('Tyndale','6542 South Street, Ontario Ca, 92658','808-265-7983'),
	('Little','6542 South Street, Ontario Ca, 92658','805-265-7653'),
	('Ballantine Books','6542 South Street, Ontario Ca, 92658','445-212-6485'),
	('Houghton Mifflin Harcourt','6542 South Street, Ontario Ca, 92658','789-124-1132'),
	('Hal Leonard','6542 South Street, Ontario Ca, 92658','542-265-9752'),
	('Picador','6542 South Street, Ontario Ca, 92658','322-265-7793'),
	('Various','6542 South Street, Ontario Ca, 92658','468-265-6353'),
	('Berkley','6542 South Street, Ontario Ca, 92658','951-265-5553'),
	('Warner Books','6542 South Street, Ontario Ca, 92658','800-265-7156'),
	('For Dummies','6542 South Street, Ontario Ca, 92658','505-025-7785'),
	('Crown','6542 South Street, Ontario Ca, 92658','841-798-1324'),
	('Allen & Uwin','6542 South Street, Ontario Ca, 92658','845-468-1543'),
	('HarperCollins Publishers','6542 South Street, Ontario Ca, 92658','791-987-2357'),
	('Knopf Doubleday Publishing Group','6542 South Street, Ontario Ca, 92658','606-223-5423'),
	('Viking','6542 South Street, Ontario Ca, 92658','909-465-7953')

SELECT * FROM publisher

INSERT INTO library_branch
	(branch_name, branch_address)
	VALUES
	('San Diego','1252 Park Blvd'),
	('Sharpstown','2361 Main Street'),
	('Santa Barbra','987 Coast Ave'),
	('Central','98908 Vancouver')

SELECT * FROM library_branch

INSERT INTO borrower
	(b_name, b_address, b_phone)
	VALUES
	('John Stevens','23487 South Side','546-897-8597'),
	('Philip Evans',' 21387 Willow Lane','265-798-5749'),
	('Bill Myer','653 Ocean View','632-795-7925'),
	('Anna Myer','5648 Tennesse Ave','135-795-7889'),
	('Steve Carpenter','65423 Paseo Del Cielo','359-798-1566'),
	('John Vasquez','3215 Vacouver St','265-798-4422'),
	('Stacy Rindt','3333 Myer St','568-795-7145'),
	('Jill Jackson','75597 East Lake Dr','487-896-4324')

SELECT * FROM borrower

INSERT INTO book_name
	(title, p_name)
	VALUES
	('The Last Stand', 'Viking'),
	('It','Scribner'),
	('Fire and Fury','Henry Holt'),
	('Harry Potter: Chamber of Secrets','Scholastic'),
	('Left Behind','Tyndale'),
	('Twilight','Little'),
	('Art of the Deal','Ballantine Books'),
	('The Hobbit','Houghton Mifflin Harcourt'),
	('The King and I','Hal Leonard'),
	('The Lost Tribe','Picador'),
	('Peter Pan','Various'),
	('The Mist','Berkley'),
	('The Notebook','Warner Books'),
	('HTML for Dummies','For Dummies'),
	('Moby Dick','Various'),
	('Adventures of Huckleberry Finn','Various'),
	('Change We Can Belive In','Crown'),
	('The Lord of The Rings: Fellowship of the Ring','Allen & Uwin'),
	('The Woman in the Window','HarperCollins Publishers'),
	('The Girl with the Dragon Tattoo','Knopf Doubleday Publishing Group')
	
	SELECT * FROM book_name

	INSERT INTO book_copies
	(book_id, branch_id, b_copies)
	VALUES
	('101','1','4'),
	('103','1','2'),
	('105','1','3'),
	('107','1','2'),
	('109','1','3'),
	('111','1','5'),
	('113','1','3'),
	('115','1','6'),
	('117','1','11'),
	('119','1','8'),
	('101','2','4'),
	('102','2','2'),
	('103','2','3'),
	('104','2','2'),
	('105','2','3'),
	('106','2','5'),
	('107','2','3'),
	('108','2','6'),
	('109','2','11'),
	('105','2','4'),
	('110','2','2'),
	('102','3','4'),
	('104','3','2'),
	('106','3','3'),
	('108','3','2'),
	('110','3','3'),
	('112','3','5'),
	('114','3','3'),
	('116','3','6'),
	('118','3','11'),
	('101','3','4'),
	('115','3','2'),
	('101','4','4'),
	('102','4','2'),
	('103','4','3'),
	('104','4','2'),
	('105','4','3'),
	('106','4','5'),
	('107','4','3'),
	('111','4','6'),
	('109','4','11'),
	('105','4','4'),
	('110','4','2')

	SELECT * FROM book_copies

INSERT INTO book_loans
/*There are 19 book_id's, 4 branch id's, 8 card numbers) */
	(book_id, branch_id, card_n, out_date, due_date)
	VALUES
	('100','1','1005','2018-02-02','2018-02-05'),
	('110','4','1004','2018-02-02','2018-03-03'),
	('100','1','1005','2018-02-02','2018-03-03'),
	('108','2','1006','2018-02-02','2018-02-05'),
	('102','1','1002','2018-02-02','2018-03-03'),
	('101','4','1004','2018-02-02','2018-03-03'),
	('101','1','1006','2018-02-02','2018-03-03'),
	('113','3','1007','2018-02-02','2018-03-03'),
	('114','1','1004','2018-02-02','2018-03-03'),
	('118','3','1001','2018-02-02','2018-03-03'),
	('103','1','1002','2018-02-02','2018-03-03'),
	('107','1','1003','2018-02-02','2018-03-03'),
	('104','4','1001','2018-02-02','2018-03-03'),
	('119','1','1006','2018-02-02','2018-03-03'),
	('105','1','1007','2018-02-02','2018-03-03'),
	('106','1','1002','2018-02-02','2018-03-03'),
	('111','3','1003','2018-02-02','2018-03-03'),
	('100','1','1005','2018-02-02','2018-03-03'),
	('105','4','1002','2018-02-02','2018-03-03'),
	('117','1','1005','2018-02-02','2018-03-03'),
	('113','3','1003','2018-02-02','2018-03-03'),
	('102','1','1003','2018-02-02','2018-03-03'),
	('118','3','1006','2018-02-02','2018-03-03'),
	('119','4','1003','2018-02-02','2018-03-03'),
	('108','1','1007','2018-02-02','2018-03-03'),
	('102','1','1002','2018-02-02','2018-03-03'),
	('115','1','1007','2018-02-02','2018-03-03'),
	('118','2','1004','2018-02-02','2018-03-03'),
	('109','1','1003','2018-02-02','2018-03-03'),
	('112','4','1003','2018-02-02','2018-03-03'),
	('115','1','1004','2018-02-02','2018-03-03'),
	('103','3','1003','2018-02-02','2018-03-03'),
	('100','3','1002','2018-02-02','2018-03-03'),
	('101','3','1007','2018-02-02','2018-03-03'),
	('118','4','1005','2018-02-02','2018-03-03'),
	('103','1','1001','2018-02-02','2018-03-03'),
	('116','1','1003','2018-02-02','2018-03-03'),
	('117','2','1004','2018-02-02','2018-03-03'),
	('119','2','1002','2018-02-02','2018-03-03'),
	('108','1','1005','2018-02-02','2018-03-03'),
	('105','4','1007','2018-02-02','2018-03-03'),
	('102','4','1005','2018-02-02','2018-03-03'),
	('106','2','1001','2018-02-02','2018-03-03'),
	('109','4','1006','2018-02-02','2018-03-03'),
	('115','2','1007','2018-02-02','2018-03-03'),
	('112','1','1007','2018-02-02','2018-03-03'),
	('107','3','1005','2018-02-02','2018-03-03'),
	('106','1','1007','2018-02-02','2018-03-03'),
	('100','1','1005','2018-02-02','2018-03-03'),
	('104','3','1007','2018-02-02','2018-03-03'),
	('119','4','1002','2018-02-02','2018-03-03')

	SELECT * FROM book_loans

INSERT INTO book_authors
	(book_id, author_name)
	VALUES
	('100','Nathaniel Philbrick'),
	('101','Steven King'),
	('102','Michael Wolff'),
	('103','JK Rowling'),
	('104','Tim LaHaye'),
	('105','Stephanie Meyer'),
	('106','Donald Trump'),
	('107','JRR Tolken'),
	('108','Margaret Landon'),
	('109','Mark Lee'),
	('110','J.M. Barrie'),
	('111','Steven King'),
	('112','Nicholas Sparks'),
	('113','Ed Tittel'),
	('114','Herman Melville'),
	('115','Mark Twain'),
	('116','Barack Obama'),
	('117','JRR Tolken'),
	('118','A.J. Finn'),
	('119','Stieg Larsson')

	SELECT * FROM book_authors