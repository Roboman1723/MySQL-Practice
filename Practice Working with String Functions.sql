-- Replace all the spaces in book title's with an arrow '-->', provide an ALIAS of 'title'

SELECT REPLACE(title, ' ', '->') AS title FROM books; 



-- Print two columns with the headings 'forwards' and 'backwards' the authors last name printed forwards and the authors last name printed backwards.

SELECT 
    author_lname AS forwards, 
    REVERSE(author_lname) AS 'backwards' 
FROM books;



-- Print the authors full name in all caps

SELECT
  CONCAT(
  UPPER(author_fname),
  ' ',
  UPPER(author_lname))
  AS 'full name'
FROM books;



-- Combine the title of the book, with the year it was released in one column

SELECT
  CONCAT(title, ' was released in ', released_year)
  AS 'Book Release'
FROM books;



-- Print the book titles and the length of each title. Two column headings: one with 'title' and one 'character count'

SELECT
  title,
  CHAR_LENGTH(title)
  AS 'Character Length'
FROM books;



-- Produce three column headings:
--    1. 'short title' displaying the title of the books with an elipses (...) after the first 10 characters
--    2. 'author' in the format 'last name,first name'
--    3. 'quantity' how many of these books are in stock? 

SELECT
   CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
   CONCAT(author_lname, ',', author_fname) AS author,
   CONCAT(stock_quantity, ' in stock') AS quantity
FROM books;