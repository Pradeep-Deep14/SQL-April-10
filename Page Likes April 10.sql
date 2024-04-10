CREATE TABLE pages (
    page_id INTEGER PRIMARY KEY,
    page_name VARCHAR(255)
);

INSERT INTO pages (page_id, page_name) VALUES
(20001, 'SQL Solutions'),
(20045, 'Brain Exercises'),
(20701, 'Tips for Data Analysts');


CREATE TABLE page_likes (
    user_id INTEGER,
    page_id INTEGER,
    liked_date DATE,
    FOREIGN KEY (page_id) REFERENCES pages(page_id)
);

INSERT INTO page_likes (user_id, page_id, liked_date) VALUES
(111, 20001, '2022-04-08 00:00:00'),
(121, 20045, '2022-03-12 00:00:00'),
(156, 20001, '2022-07-25 00:00:00');

SELECT * FROM pages
SELECT * FROM page_likes

--Write a SQL query to retrieve the IDs of the Facebook pages that have zero likes. 
--The output should be sorted in ascending order based on the page IDs.


--page_id

SELECT p.* from pages p
LEFT JOIN page_likes p1
ON p.page_id=p1.page_id
GROUP BY p.page_id
HAVING COUNT(p1.page_id)=0
ORDER BY p.page_id



