-- SQL PROJECT --
-- MUSIC STORE DATA ANALYSIS PROJECT --

-- DATABASE CREATION --
CREATE database music_store;
USE music_store;

-- TABLE CREATION --
-- 1. Genre
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(120)
);

-- 2. MediaType
CREATE TABLE MediaType (
    media_type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(120)
);

SELECT * FROM Genre;
SELECT * FROM MediaType;


-- 2. Employee 
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(120),
    first_name VARCHAR(120),
    title VARCHAR(120),
    reports_to INT,
    levels VARCHAR(255),
    birthdate DATE,
    hire_date DATE,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    phone VARCHAR(50),
    fax VARCHAR(50),
    email VARCHAR(100)
);

SELECT employee_id, first_name, last_name, reports_to
FROM Employee
WHERE reports_to IS NOT NULL
AND reports_to NOT IN (
    SELECT employee_id
    FROM Employee
);

UPDATE Employee
SET reports_to = NULL
WHERE employee_id = 1;

ALTER TABLE Employee
ADD CONSTRAINT fk_employee_reports_to
FOREIGN KEY (reports_to)
REFERENCES Employee(employee_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

SELECT * FROM Employee;

-- 3. Customer
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(120),
    last_name VARCHAR(120),
    company VARCHAR(120),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    phone VARCHAR(50),
    fax VARCHAR(50),
    email VARCHAR(100),
    support_rep_id INT,

    FOREIGN KEY (support_rep_id)
        REFERENCES Employee(employee_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
SELECT * FROM Customer;

-- 4. Artist 
CREATE TABLE Artist ( 
 artist_id INT PRIMARY KEY AUTO_INCREMENT, 
 name VARCHAR(120) 
); 

SELECT * FROM Artist;

-- 5. Album 
CREATE TABLE Album ( 
album_id INT PRIMARY KEY AUTO_INCREMENT, 
title VARCHAR(160), 
artist_id INT, 
FOREIGN KEY (artist_id) REFERENCES Artist(artist_id) 
ON DELETE CASCADE
ON UPDATE CASCADE
); 

SELECT * FROM Album;


-- 6. Track
CREATE TABLE Track (
    track_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    album_id INT,
    media_type_id INT,
    genre_id INT,
    composer VARCHAR(220),
    milliseconds INT,
    bytes INT,
    unit_price DECIMAL(10,2),

    FOREIGN KEY (album_id)
        REFERENCES Album(album_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (media_type_id)
        REFERENCES MediaType(media_type_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (genre_id)
        REFERENCES Genre(genre_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
SELECT * FROM Track;


-- 7. Invoice
CREATE TABLE Invoice (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    invoice_date DATE,
    billing_address VARCHAR(255),
    billing_city VARCHAR(100),
    billing_state VARCHAR(100),
    billing_country VARCHAR(100),
    billing_postal_code VARCHAR(20),
    total DECIMAL(10,2),

    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

SELECT * FROM Invoice;


-- 8. InvoiceLine
CREATE TABLE InvoiceLine (
    invoice_line_id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT,
    track_id INT,
    unit_price DECIMAL(10,2),
    quantity INT,

    FOREIGN KEY (invoice_id)
        REFERENCES Invoice(invoice_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (track_id)
        REFERENCES Track(track_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

SELECT * FROM InvoiceLine;

-- 9. Playlist 
CREATE TABLE Playlist ( 
  playlist_id INT PRIMARY KEY AUTO_INCREMENT, 
 name VARCHAR(255) 
); 

SELECT * FROM Playlist;


-- 10. PlaylistTrack
CREATE TABLE PlaylistTrack (
    playlist_id INT,
    track_id INT,

    PRIMARY KEY (playlist_id, track_id),

    FOREIGN KEY (playlist_id)
        REFERENCES Playlist(playlist_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (track_id)
        REFERENCES Track(track_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
SELECT * FROM PlaylistTrack;

-- QUERIES --
#1. Who is the senior most employee based on job title?  
SELECT * FROM Employee
ORDER BY levels DESC
LIMIT 1;

# Insight - This analysis identifies the senior-most employee based on the job hierarchy. It helps understand the senior-level structure of the organization.

#2. Which countries have the most Invoices? 
SELECT COUNT(*) AS c, billing_country FROM Invoice
GROUP BY billing_country
ORDER BY  c DESC;

#Insight - This analysis shows which countries generate the highest number of invoices. It helps identify countries with more customer transactions.

#3. What are the top 3 values of total invoice? 
SELECT total
FROM Invoice
ORDER BY total DESC
LIMIT 3;

#Insight - This analysis identifies the three highest invoice amounts in the dataset. It helps highlight the store's largest individual transactions.

#4. Which city has the best customers? 
SELECT SUM(total) AS invoice_total,billing_city 
FROM Invoice
GROUP BY billing_city
ORDER BY invoice_total DESC;

# Insight - This analysis identifies the city that generates the highest total invoice revenue. 
#It helps identify the city with the highest overall customer spending and can support location-based promotional activities.

#5. Who is the best customer? 
SELECT customer.customer_id,customer.first_name,customer.last_name,SUM(Invoice.total) AS total
FROM Customer
JOIN Invoice ON customer.customer_id = Invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC LIMIT 1;

#Insight - This analysis identifies the customer who has spent the most money on the music store. 
#It helps identify high-value customers who contribute significantly to revenue.

#6. Write a query to return the email, first name, last name, & Genre of all Rock Music listeners. 
#Return your list ordered alphabetically by email starting with A 
SELECT track_id FROM Track               # Finding the track_id of all Rock songs.
JOIN Genre ON track.genre_id = genre.genre_id  
WHERE genre.name LIKE 'Rock';

SELECT DISTINCT c.email, c.first_name, c.last_name, g.name AS genre FROM Customer c JOIN Invoice i
    ON c.customer_id = i.customer_id
JOIN InvoiceLine il ON i.invoice_id = il.invoice_id
JOIN Track t ON il.track_id = t.track_id
JOIN Genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Rock' ORDER BY c.email;


#Insight - This analysis identifies customers who purchased Rock music. 
#It helps understand the Rock music customer segment and can support targeted Rock-related recommendations or promotions.

#7. Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands  
WITH rock_artists AS (SELECT a.name AS artist_name,COUNT(t.track_id) AS track_count FROM Artist a JOIN Album al
ON a.artist_id = al.artist_id JOIN Track t ON al.album_id = t.album_id
JOIN Genre g ON t.genre_id = g.genre_id WHERE g.name = 'Rock' GROUP BY a.artist_id, a.name
),ranked_artists AS (SELECT artist_name,track_count,
ROW_NUMBER() OVER (ORDER BY track_count DESC) AS artist_rank FROM rock_artists
)
SELECT artist_name, track_count
FROM ranked_artists
WHERE artist_rank <= 10
ORDER BY artist_rank;

#Insight - This analysis identifies the artists with the highest number of Rock tracks in the dataset. 
#It helps understand which artists have a strong presence in the Rock genre.

#Q8. Tracks longer than the average song length
WITH average_length AS (
    SELECT AVG(milliseconds) AS avg_milliseconds
    FROM Track
)
SELECT
    t.name,
    t.milliseconds
FROM Track t
CROSS JOIN average_length a
WHERE t.milliseconds > a.avg_milliseconds
ORDER BY t.milliseconds DESC;

#Insight - This analysis identifies songs whose duration is greater than the average song length. 
#It helps understand the distribution of song durations and identify longer tracks.

-- Q9. Amount spent by each customer on artists
SELECT DISTINCT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.name AS artist_name,
    SUM(il.unit_price * il.quantity) OVER (
        PARTITION BY c.customer_id, a.artist_id
    ) AS total_spent
FROM Customer c
JOIN Invoice i
    ON c.customer_id = i.customer_id
JOIN InvoiceLine il
    ON i.invoice_id = il.invoice_id
JOIN Track t
    ON il.track_id = t.track_id
JOIN Album al
    ON t.album_id = al.album_id
JOIN Artist a
    ON al.artist_id = a.artist_id
ORDER BY total_spent DESC;
    
# Insight -This analysis shows how much each customer spends on different artists. 
#It helps understand individual customer preferences and spending patterns across artists.

-- Q10. Most popular genre for each country
WITH genre_purchases AS (SELECT i.billing_country AS country,g.name AS genre,SUM(il.quantity) 
AS total_purchases
FROM Invoice i JOIN InvoiceLine il ON i.invoice_id = il.invoice_id  JOIN Track t
ON il.track_id = t.track_id  JOIN Genre g
ON t.genre_id = g.genre_id  GROUP BY i.billing_country, g.genre_id, g.name),
ranked_genres AS (SELECT country,genre,total_purchases,RANK() OVER (PARTITION BY country
ORDER BY total_purchases DESC) AS genre_rank FROM genre_purchases)
SELECT
    country,
    genre,
    total_purchases
FROM ranked_genres
WHERE genre_rank = 1
ORDER BY country;

# Insight - This analysis identifies the most purchased genre in each country. 
#It helps understand differences in music preferences across countries and also identifies cases where multiple genres have equal popularity.

-- Q11. Top spending customer for each country

WITH customer_spending AS (
    SELECT
        i.billing_country AS country,
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(i.total) AS total_spent
    FROM Customer c
    JOIN Invoice i
        ON c.customer_id = i.customer_id
    GROUP BY
        i.billing_country,
        c.customer_id,
        c.first_name,
        c.last_name
),
ranked_customers AS (
    SELECT
        country,
        customer_id,
        first_name,
        last_name,
        total_spent,
        RANK() OVER (
            PARTITION BY country
            ORDER BY total_spent DESC
        ) AS customer_rank
    FROM customer_spending
)
SELECT
    country,
    first_name,
    last_name,
    total_spent
FROM ranked_customers
WHERE customer_rank = 1
ORDER BY country;

#Insight - This analysis identifies the highest-spending customer in each country. 
#It helps identify high-value customers across different countries and understand customer spending patterns by region.








