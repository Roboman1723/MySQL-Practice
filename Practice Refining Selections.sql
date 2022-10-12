-- SELECT all story collections. Titles that contain the word 'stories'.

SELECT title FROM books WHERE title LIKE '%stories%';


-- Find the longest book in the table, print out its title and page count.

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;


-- Print out a summary column in the format (title - year) containing the 3 most recent books.

SELECT
  CONCAT(title, ' - ', released_year) AS 'summary'
FROM books
ORDER BY released_year DESC
LIMIT 3;


-- Find all books with an author last name that contains a space (" ").

SELECT
  title,
  author_lname
FROM books
WHERE author_lname LIKE '% %';

-- Find the three books with the lowest stock quantity. Select the title, released year, and stock quantity in your output.

SELECT title, released_year, stock_quantity 
FROM books ORDER BY 3
LIMIT 3;


-- Print title and author last name, sorted first by the authors last name, then by the title.

SELECT title, author_lname FROM books ORDER BY author_lname, title;

-- Go through every book and print out the authors first and last name in all caps with the words: 
-- MY FAVORITE AUTHOR IS (AUTHOR NAME)!
    -- • Make sure to include the exclamation mark at the end
--     • Sort alphabetically
--     • Fit in one column
--     • Give the column an alias of "yell"

SELECT
  CONCAT('MY FAVORITE AUTHOR IS ', UPPER(author_fname), ' ', UPPER(author_lname), '!') AS yell
FROM books
ORDER BY author_lname;


