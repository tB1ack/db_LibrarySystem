USE db_LibrarySystem
GO

/*
-here we are going to create the tables
*/

CREATE TABLE PUBLISHER (
	Name varchar(50) PRIMARY KEY NOT NULL,
	Address varchar(50) NOT NULL,
	Phone varchar(15) NOT NULL
);

CREATE TABLE BOOK (
	BookId INT PRIMARY KEY NOT NULL,
	Title varchar(50) NOT NULL,
	PublisherName varchar(50) NOT NULL CONSTRAINT fk_PUBLISHER_Name FOREIGN KEY REFERENCES PUBLISHER(Name) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE BOOK_AUTHORS (
	BookId INT PRIMARY KEY NOT NULL CONSTRAINT fk_BOOK_BookId FOREIGN KEY REFERENCES BOOK(BookId) ON UPDATE NO ACTION ON DELETE NO ACTION,
	AuthorName varchar(50) NOT NULL
);

CREATE TABLE LIBRARY_BRANCH (
	BranchId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName varchar(50) NOT NULL,
	Address varchar(50) NOT NULL
);

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL,
	Name varchar(50) NOT NULL,
	Address varchar(50) NOT NULL,
	Phone varchar(15) NOT NULL
);

CREATE TABLE BOOK_LOANS (
	BookId INT NOT NULL CONSTRAINT fk_BOOK_BookId1 FOREIGN KEY REFERENCES BOOK(BookId) ON UPDATE NO ACTION ON DELETE NO ACTION,
	BranchId INT NOT NULL CONSTRAINT fk_LIBRARY_BRANCH_BranchId FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchId) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CardNo INT NOT NULL CONSTRAINT fk_BORROWER_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE NO ACTION ON DELETE NO ACTION,
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);

CREATE TABLE BOOK_COPIES(
	BookId INT NOT NULL CONSTRAINT fk_BOOK_BookId2 FOREIGN KEY REFERENCES BOOK(BookId) ON UPDATE NO ACTION ON DELETE NO ACTION,
	BranchId INT NOT NULL CONSTRAINT fk_LIBRARY_BRANCH_BranchId1 FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchId) ON UPDATE NO ACTION ON DELETE NO ACTION,
	No_Of_Copies INT NOT NULL
);

/*
-here we are going to populate the tables
*/

 INSERT INTO BOOK
	(Title, PublisherName)
	VALUES
		('Don Quixote', 'Penguin Classics'),
		('The Odyssey','Penguin Classics'),
		('Moby Dick','Wordsworth Editions Ltd'),
		('The Great Gatsby','Scribner'),
		('Pride and Prejudice','W. W. Norton & Company'),
		('1984','Berkley'),
		('Great Expectations','W. W. Norton & Company'),
		('The Catcher in the Rye','Back Bay Books'),
		('To Kill a Mockingbird','Warner Books'),
		('The Old Man and the Sea','Scribner'),
		('The Fellowship of the Ring','Ballantine Books'),
		('The Two Towers','Ballantine Books'),
		('The Return of the King','Ballantine Books'),
		('One Flew Over the Cuckoo''s Nest','Penguin Classics'),
		('Harry Potter and the Philosopher''s Stone','Scholastic'),
		('The Call of the Wild','Dover Publications'),
		('Fahrenheit 451','Ballantine Books'),
		('The Stand','New English Library Ltd'),
		('The Things They Carried','Broadway'),
		('The Road','Vintage Books'),
		('The Lost Tribe','Picador USA')
;

INSERT INTO PUBLISHER
	(Name, Address, Phone)
	VALUES
		('Penguin Classics','5648 NE London Ave','819-457-8954'),
		('Wordsworth Editions Ltd','8B East Street','423-895-4256'),
		('Scribner','1230 Avenue of the Americas','212-698-7000'),
		('W. W. Norton & Company','500 Fifth Avenue','212-458-7895'),
		('Berkley','1653 Dell Rd','758-985-3492'),
		('Back Bay Books','871 Welch Ave','789-452-7843'),
		('Warner Books','962 Electric Ave','164-459-7892'),
		('Ballantine Books','6432 Easy Street','457-489-1234'),
		('Scholastic','78B SW Crew Blvd','632-651-6987'),
		('Dover Publications','5986 EastMoreland St','897-856-8362'),
		('New English Library Ltd','23164 Lakeshore','123-149-1789'),
		('Broadway','678 Treelake Canal','234-265-2795'),
		('Vintage Books','3A Opal Dr','364-329-3267'),
		('Picador USA','4316 Azeroth Ln','597-562-5397')
;

INSERT INTO BOOK_AUTHORS
	(BookId, AuthorName)
	VALUES
		(2, 'Miguel de Cervantes'),
		(3, 'Homer'),
		(4, 'Herman Melville'),
		(5, 'F. Scott Fitzgerald'),
		(6, 'Jane Austen'),
		(7, 'George Orwell'),
		(8, 'Charles Dickens'),
		(9, 'J.D. Salinger'),
		(10, 'Harper Lee'),
		(11, 'Earnest Hemingway'),
		(12, 'J.R.R. Tolkien'),
		(13, 'J.R.R. Tolkien'),
		(14, 'J.R.R. Tolkien'),
		(15, 'Ken Kesey'),
		(16, 'J.K. Rowling'),
		(17, 'Jack London'),
		(18, 'Ray Bradbury'),
		(19, 'Stephen King'),
		(20, 'Tim O''Brien'),
		(21, 'Cormac McCarthy'),
		(22, 'Mark Lee')
;

INSERT INTO BORROWER
	(CardNo, Name, Address, Phone)
	VALUES
		(123851,'Jack King','21B Welch Ave','541-485-7845'),
		(123762,'Samantha London','365 Bono St','503-465-9875'),
		(123673,'Cory Rowling','4568 East Yorkshire St','808-785-6954'),
		(123684,'Patrick Hemingway','868 W Union Ln','807-623-1654'),
		(123495,'Bill Lee','117 Arbiter Ave','145-652-3265'),
		(123306,'Mary McCarthy','343 Tsavo Hwy','149-785-5413'),
		(123217,'Sue O''Brien','26548 Broken Blvd','652-321-7946'),
		(123128,'Virginia Bradbury','678 Stotts Circle','624-486-1537')
;

INSERT INTO LIBRARY_BRANCH
	(BranchName, Address)
	VALUES
		('West Oak', '451 E Park Ave'),
		('Sharpstown', '8967 N Billshire St'),
		('Central', '24756 S Canoe Blvd'),
		('Miller','3567 W Slate Rock Rd')
;

INSERT INTO BOOK_COPIES
	(BookId,BranchId,No_Of_Copies)
	VALUES
		(2,1,2),
		(2,3,4),
		(3,2,3),
		(3,4,2),
		(4,1,2),
		(4,3,4),
		(5,2,3),
		(5,4,2),
		(6,1,2),
		(6,3,4),
		(7,2,3),
		(7,4,2),
		(8,1,2),
		(8,3,4),
		(9,2,3),
		(9,4,2),
		(10,1,2),
		(10,3,4),
		(11,2,3),
		(11,4,2),
		(12,1,2),
		(12,3,4),
		(13,2,3),
		(13,4,2),
		(14,1,3),
		(14,3,2),
		(15,2,2),
		(15,4,4),
		(16,1,3),
		(16,3,2),
		(17,2,3),
		(17,4,2),
		(18,1,2),
		(18,3,4),
		(19,2,3),
		(19,3,3),
		(19,4,2),
		(20,1,3),
		(20,3,2),
		(21,2,2),
		(21,4,4),
		(22,1,2),
		(22,2,3)
;

INSERT INTO BOOK_LOANS
	(BookId,BranchId,CardNo,DateOut,DueDate)
	VALUES
		(2,1,123128,'2017-11-05','2017-11-19'),
		(2,1,123217,'2017-11-04','2017-11-18'),
		(2,3,123306,'2017-11-01','2017-11-15'),
		(2,3,123851,'2017-11-02','2017-11-16'),
		(3,2,123495,'2017-11-03','2017-11-17'),
		(3,4,123762,'2017-10-31','2017-11-14'),
		(3,4,123128,'2017-10-29','2017-11-12'),
		(4,1,123128,'2017-10-24','2017-11-07'),
		(4,3,123217,'2017-10-24','2017-11-07'),
		(5,2,123217,'2017-10-25','2017-11-08'),
		(5,2,123306,'2017-10-25','2017-11-08'),
		(5,4,123851,'2017-10-26','2017-11-09'),
		(6,1,123851,'2017-10-26','2017-11-09'),
		(6,1,123762,'2017-10-27','2017-11-10'),
		(7,2,123762,'2017-10-27','2017-11-10'),
		(7,2,123851,'2017-10-28','2017-11-11'),
		(7,4,123217,'2017-10-24','2017-11-07'),
		(7,4,123128,'2017-10-24','2017-11-07'),
		(8,1,123306,'2017-10-23','2017-11-06'),
		(8,3,123128,'2017-10-22','2017-11-05'),
		(9,4,123217,'2017-10-21','2017-11-04'),
		(10,1,123851,'2017-10-21','2017-11-04'),
		(10,3,123217,'2017-10-20','2017-11-03'),
		(10,3,123306,'2017-10-20','2017-11-03'),
		(11,2,123762,'2017-10-20','2017-11-03'),
		(12,1,123762,'2017-10-19','2017-11-02'),
		(12,1,123128,'2017-10-19','2017-11-02'),
		(12,3,123306,'2017-10-18','2017-11-01'),
		(13,4,123128,'2017-10-17','2017-10-31'),
		(14,3,123851,'2017-10-16','2017-10-30'),
		(14,3,123306,'2017-10-15','2017-10-29'),
		(15,2,123217,'2017-10-14','2017-10-28'),
		(15,2,123495,'2017-10-13','2017-10-27'),
		(15,4,123762,'2017-10-13','2017-10-27'),
		(16,1,123495,'2017-10-12','2017-10-26'),
		(16,1,123851,'2017-10-11','2017-10-25'),
		(16,3,123128,'2017-10-11','2017-10-25'),
		(16,3,123306,'2017-10-11','2017-10-25'),
		(17,2,123217,'2017-10-11','2017-10-25'),
		(17,2,123306,'2017-10-10','2017-10-24'),
		(18,1,123128,'2017-10-09','2017-10-23'),
		(19,2,123851,'2017-10-09','2017-10-23'),
		(19,2,123495,'2017-10-08','2017-10-22'),
		(19,4,123762,'2017-10-07','2017-10-21'),
		(19,4,123306,'2017-10-07','2017-10-21'),
		(20,3,123217,'2017-10-06','2017-10-20'),
		(20,3,123128,'2017-10-06','2017-10-20'),
		(21,2,123495,'2017-10-05','2017-10-19'),
		(21,2,123851,'2017-10-04','2017-10-18'),
		(22,1,123306,'2017-10-04','2017-10-18')
;

SELECT * FROM BOOK
SELECT * FROM BOOK_AUTHORS
SELECT * FROM BOOK_COPIES
SELECT * FROM BOOK_LOANS
SELECT * FROM LIBRARY_BRANCH
SELECT * FROM PUBLISHER
SELECT * FROM BORROWER