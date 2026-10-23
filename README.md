# 🎵 Music Store Data Analysis Using MySQL

## 📌 Project Overview

This project analyzes a music store database using MySQL to explore customer spending, sales performance, music preferences, and artist trends.

The project uses SQL queries to answer business-related questions and extract meaningful insights from a relational database.

## 🎯 Business Problem

The music store contains data about customers, invoices, tracks, albums, artists, and genres. Analyzing this data helps the business understand its sales performance and customer purchasing behavior.

This project focuses on identifying high-value customers, analyzing invoice activity, exploring popular music genres, and understanding purchasing patterns across different countries and cities.

## 🗄️ Dataset

The project uses a relational database containing 11 tables:

* Customer
* Employee
* Invoice
* InvoiceLine
* Track
* Album
* Artist
* Genre
* MediaType
* Playlist
* PlaylistTrack

The tables are connected through primary and foreign keys, allowing related information to be analyzed across the database.

## 🛠️ Tools and Technologies

* **Database:** MySQL
* **SQL Editor:** MySQL Workbench
* **Language:** SQL

## 💻 SQL Concepts Used

* SELECT, WHERE, ORDER BY, and LIMIT
* Aggregate functions: `COUNT()`, `SUM()`, and `AVG()`
* GROUP BY and HAVING
* INNER JOIN and LEFT JOIN
* Subqueries
* Common Table Expressions (CTEs)
* Window functions: `RANK()` and `DENSE_RANK()`
* EXISTS operator
* Self-joins and CROSS JOIN
* Views
* Stored procedures

## 📊 Key Analysis Areas

The project answers 10 business questions covering the following areas:

### 1. Employee Analysis

Identifies the senior-most employee based on employee level.

### 2. Invoice Analysis

Finds the country or countries with the highest number of invoices and identifies the three highest distinct invoice total values.

### 3. City Sales Analysis

Identifies the city generating the highest total invoice value.

### 4. Customer Spending Analysis

Identifies the highest-spending customer and calculates how much each customer spends on each artist.

### 5. Music Preference Analysis

Identifies customers who have purchased Rock music.

### 6. Artist Analysis

Finds the top 10 artists with the highest number of Rock tracks.

### 7. Track Duration Analysis

Identifies tracks whose duration is greater than the average track duration.

### 8. Genre Analysis by Country

Identifies the most purchased music genre in each country based on the quantity of tracks purchased.

## ⚙️ Database Objects

### View: `RockArtistCounts`

Created a view to calculate the number of Rock tracks associated with each artist by joining the Artist, Album, Track, and Genre tables.

The view makes it easier to retrieve and rank artists based on their Rock track counts.

### Stored Procedure: `MostPopularGenreByCountry`

Created a stored procedure to identify the most popular music genre in each country based on total track purchase quantity.

Execute the procedure using:

```sql
CALL MostPopularGenreByCountry();
```

## 🔍 Analysis Approach

1. Explored the database structure and table relationships.
2. Identified business questions relevant to music store performance.
3. Wrote SQL queries using joins, aggregations, subqueries, and ranking techniques.
4. Created a reusable view and stored procedure.
5. Examined query results to identify meaningful business insights.

## 💡 Business Value

The analysis can help the music store:

* Recognize high-value customers.
* Understand customer spending patterns.
* Compare invoice activity across countries.
* Identify cities contributing the highest invoice value.
* Explore customer preferences for music genres.
* Understand the distribution of Rock tracks across artists.
* Identify popular genres across different countries.

## 🚀 Future Scope

* **Interactive Dashboards:** Build visual dashboards to explore sales and customer trends.
* **Customer Segmentation:** Group customers according to spending and purchasing behavior.
* **Sales Forecasting:** Use historical invoice data to predict future revenue.
* **Churn Prediction:** Identify customers whose purchasing activity is declining.
* **Real-Time Analytics:** Connect the database to a dashboard for ongoing performance monitoring.

## 📝 Conclusion

This project demonstrates how MySQL can be used to analyze relational data and solve business-related questions. By applying SQL concepts such as joins, aggregate functions, subqueries, CTEs, window functions, views, and stored procedures, the project explores customer spending, sales performance, and music preferences.

It provides practical experience in SQL-based data analysis and demonstrates how database queries can support business decision-making.


* `schema_diagram.png` — Database schema diagram. *(Include if available.)*
* `music_store_presentation.pptx` — Project presentation. *(Optional.)*
