#Evaluate the result of the following queries:

  SELECT 10 != 10; 
  
  -- Solution: 0 or False
 
  SELECT 15 > 14 && 99 - 5 <= 94; 
  
  -- Solution: 1 or True

  SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; (Select 1 in (5,3) or is 9 between 8 and 10?)
  
  -- Solution: 1 or True, the first part is false because 1 is not a number in the set of numbers 5 and 3. However because this
  -- is an OR statement indicated by the dual pipe ||, the second part is True, 9 is between 8 and 10. This indicates the result
  -- will be 1 or True because at least one side of the argument is True.


#SELECT all books written before 1980 (Not including 1980)

-- Solution: 
SELECT
  title, released_year
FROM books
WHERE released_year < 1980;


#SELECT all books written by Eggers or Chabon

-- Solution:
SELECT title, author_lname FROM books
WHERE author_lname IN ('Eggers', 'Chabon');


#SELECT all books written by Lahiri published after the year 2000

-- Solution:
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;


#SELECT all books where the page count is between 100 and 200 pages.

-- Solution:
SELECT title, pages FROM books
WHERE pages BETWEEN 100 AND 200;


#SELECT all books where the author last name starts with a C or an S

-- Solution:
SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%';

-- Solution 2: We can utilize the SUBSTRING function along with an IN subset to shorten the code.
SELECT title, author_lname FROM books
WHERE SUBSTR(author_lname,1,1) IN ('C','S');

-- (author_lname,1,1) indicates we are looking at the author_lname column, and asking for JUST the first letter.
-- the 1,1 indicates we are starting with letter 1 and ending at letter 1.


#Create a CASE statement that produces the title, author_lname, and a new column called 'TYPE' with the following 
#conditions:

  -- If the the title of a book contains the word 'stories' classify its TYPE as 'Short Stories'
  -- If the title is exactly 'Just Kids' or 'A Heartbreaking Work of Staggering Genius' classify its TYPE as a 'Memoir'
  -- Everything else should be classified as a 'Novel'

-- Solution:

SELECT 
    title, 
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;


#Create a CASE statement that produces the title, author_lname, and a new column called 'COUNT' which indicates how many
#books the author has written. Be sure to indicate the correct singular or plural for book(s).

-- Solution:

-- We can start by concatenating the first/last name of the author into a single column with the alias "Name". 

-- We then create a case statement using the WHEN clause to specify that when an author's total book count is just one , then their Count value should be displayed using the string "1 book".

-- The ELSE clause utilizes a concatenation of their total published book count, along with the string " books". 

-- We apply the GROUP BY author_lname, author_fname statement because in this data set we have two authors with the same last name. By using this statement, we can separate Dan Harris from Freida Harris
-- to eliminate inconsistencies.

-- Additionally we can use ORDER BY to place their total book count in ascending order.


SELECT
  CONCAT(author_fname, ' ', author_lname) AS 'Name',
  CASE
    WHEN COUNT(*) = 1 THEN '1 book'
    ELSE CONCAT(COUNT(*), ' books')
  END AS COUNT
FROM books
GROUP BY author_lname,
         author_fname
ORDER BY COUNT(*);

