USE db_library
/* THESE PROCEEDURES WERE CREATED IN MY ACTUAL DATABASE*/

/* For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */
SELECT a2.branch_name AS 'Branch Name', SUM (b_copies) AS 'Copies'
FROM book_copies a1
RIGHT JOIN library_branch a2 ON a1.branch_id = a2.branch_id
GROUP BY branch_name

/* Retrieve the names of all borrowers who do not have any books checked out. */
SELECT a1.b_name AS 'Borrower' FROM borrower a1
LEFT JOIN book_loans a2 ON a1.card_n = a2.card_n 
WHERE a2.card_n IS NULL


/* How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
SELECT a1.title, b_copies, a3.branch_name	
FROM book_copies a2
INNER JOIN book_name a1 ON a2.book_id = a1.book_id
INNER JOIN library_branch a3 ON a2.branch_id = a3.branch_id
WHERE  a1.title = 'The Lost Tribe'

/* For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.  */
SELECT a2.title, a3.b_name, a3.b_address, due_date	
FROM book_loans a1
INNER JOIN book_name a2 ON a1.book_id = a2.book_id
INNER JOIN borrower a3 ON a1.card_n = a3.card_n
WHERE  branch_id = 2 AND due_date = DATEADD(day, DATEDIFF(day, 0, GETDATE()), 0)

/* 	Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */
SELECT b_name AS 'Borrower Name', b_address AS 'Address',COUNT(a2.card_n) AS 'Checked Out'
FROM book_loans a2 
INNER JOIN borrower a1 ON a2.card_n = a1.card_n
INNER JOIN book_name a3 ON a2.book_id = a3.book_id
GROUP BY a2.card_n, a1.b_name, a1.b_address
HAVING COUNT (a2.card_n) >5

/* For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central". */
SELECT a1.title, a2.b_copies
FROM book_copies a2
INNER JOIN book_name a1 ON a2.book_id = a1.book_id
INNER JOIN book_authors a3 ON a1.book_id = a3.book_id
WHERE author_name = 'Steven King' AND branch_id = 4

/* How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
SELECT a1.title, b_copies	
FROM book_copies a2
INNER JOIN book_name a1 ON a2.book_id = a1.book_id
WHERE a2.branch_id = 2 AND a1.title = 'The Lost Tribe'
	
