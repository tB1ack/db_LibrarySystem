USE db_LibrarySystem
GO
/*
-this is the final stored procedure that has the query for 
 drill queries # 1-7
*/

CREATE PROCEDURE uspGetFinalProject
AS

/*
1) How many copies of the book titled "The Lost Tribe" are 
   owned by the library branch whose name is "Sharpstown"?
*/
SELECT Title, No_Of_Copies AS 'Number of Copies', BranchName AS 'Branch'
FROM BOOK_COPIES a1 INNER JOIN BOOK a2 ON a1.BookId = a2.BookId
INNER JOIN LIBRARY_BRANCH a3 ON a1.BranchId = a3.BranchId
WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown'
;

/*
2) How many copies of the book titled "The Lost Tribe" are 
   owned by each library branch?
*/
SELECT Title, No_Of_Copies AS 'Number of Copies', BranchName AS 'Branch'
FROM BOOK_COPIES a1 INNER JOIN BOOK a2 ON a1.BookId = a2.BookId
INNER JOIN LIBRARY_BRANCH a3 ON a1.BranchId = a3.BranchId
WHERE Title = 'The Lost Tribe'
;

/*
3) Retrieve the names of all borrowers who do not have any 
   books checked out.
*/
SELECT a1.CardNo AS 'Card Number', Name
FROM BORROWER a1
WHERE NOT EXISTS (SELECT a2.BookId FROM BOOK_LOANS a2 WHERE a1.CardNo = a2.CardNo)
;

/*
4) For each book that is loaned out from the "Sharpstown" 
   branch and whose DueDate is today, retrieve the book title, 
   the borrower's name, and the borrower's address.
*/
DECLARE @TodaysDate date
SET @TodaysDate = CONVERT (date, GETDATE()) 

SELECT Title, Name, a1.Address
FROM BORROWER a1 INNER JOIN BOOK_LOANS a2 ON a1.CardNo = a2.CardNo
INNER JOIN BOOK a3 ON a3.BookId = a2.BookId
INNER JOIN LIBRARY_BRANCH a4 ON a4.BranchId = a2.BranchId
WHERE BranchName = 'Sharpstown' AND DueDate = @TodaysDate
;

/*
5) For each library branch, retrieve the branch name and the 
   total number of books loaned out from that branch.
-  this version tells you how many loans are stored in the database
*/
SELECT BranchName AS 'Branch Name', COUNT(a2.BranchId) AS 'Outstanding Book Loans'
FROM LIBRARY_BRANCH a1 INNER JOIN BOOK_LOANS a2 ON a1.BranchId = a2.BranchId
Group By a2.BranchId, BranchName
;

/*
- this is a similar version of the query above except it pulls all
  outstanding loans using the variable created above to narrow the
  search
*/
SELECT BranchName AS 'Branch Name', COUNT(a2.BranchId) AS 'Outstanding Book Loans'
FROM LIBRARY_BRANCH a1 INNER JOIN BOOK_LOANS a2 ON a1.BranchId = a2.BranchId
WHERE DueDate > @TodaysDate
AND DateOut < @TodaysDate
Group By a2.BranchId, BranchName
;

/*
6) Retrieve the names, addresses, and number of books checked out for 
   all borrowers who have more than five books checked out.
*/
SELECT Name, a1.Address AS 'Address', COUNT(a2.CardNo) AS 'Number of Books'
FROM BORROWER a1 INNER JOIN BOOK_LOANS a2 ON a1.CardNo = a2.CardNo
GROUP BY Name, a1.Address
HAVING Count(a2.CardNo) > 5
;

/*
7) For each book authored (or co-authored) by "Stephen King", retrieve 
   the title and the number of copies owned by the library branch whose 
   name is "Central".
*/
SELECT Title, No_Of_Copies AS 'Number of Copies'
FROM BOOK a1 INNER JOIN BOOK_COPIES a2 ON a1.BookId = a2.BookId
INNER JOIN LIBRARY_BRANCH a3 ON a3.BranchId = a2.BranchId
INNER JOIN BOOK_AUTHORS a4 ON a4.BookId = a1.BookId
WHERE AuthorName = 'Stephen King' AND BranchName = 'Central'
;