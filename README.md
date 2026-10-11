# 🎵 Music Store Data Analysis Using SQL

## 📌 Project Overview

The **Music Store Data Analysis** project uses MySQL to analyze customer transactions, sales, and music-related data. The project focuses on extracting meaningful business insights using SQL queries.

By analyzing customer purchases, invoices, artists, tracks, and genres, this project helps understand customer spending patterns, sales performance across locations, and music preferences.

## 🎯 Business Problem

The Music Store has a large amount of customer, sales, and music-related data, but it is difficult to understand useful patterns from the available data.

The business needs to understand:

* Customer purchasing and spending patterns.
* Countries and cities generating higher sales.
* Popular music genres across different countries.
* Top-performing artists, including Rock artists.
* High-value customers based on spending.
* Track duration and overall purchasing behavior.

## 🎯 Project Objectives

* Create and manage a structured relational database using MySQL.
* Import and validate data from CSV files.
* Understand relationships between database tables.
* Analyze customer transactions and invoice data.
* Identify popular genres, artists, and high-value customers.
* Apply SQL techniques to answer business questions.
* Convert query results into meaningful business insights.

## 🛠️ Tools and Technologies

* **Database:** MySQL
* **Query Language:** SQL
* **Database Tool:** MySQL Workbench
* **Data Source:** Music Store dataset in CSV format

### SQL Concepts Used

* `SELECT` and `WHERE`
* `ORDER BY` and `LIMIT`
* `GROUP BY`
* Aggregate functions: `COUNT()`, `SUM()`, and `AVG()`
* `JOIN` operations
* `DISTINCT`
* Common Table Expressions (CTEs)
* Subqueries
* Window functions: `ROW_NUMBER()`, `RANK()`, and `SUM() OVER()`
* Primary keys and foreign keys

## 🗄️ Database Schema

The project uses **11 relational tables**:

| Table Name      | Description                                                        |
| --------------- | ------------------------------------------------------------------ |
| `Employee`      | Stores employee details, job titles, and reporting relationships.  |
| `Customer`      | Stores customer information and assigned support representatives.  |
| `Invoice`       | Stores customer transactions, billing details, and invoice totals. |
| `InvoiceLine`   | Stores individual tracks purchased in each invoice.                |
| `Track`         | Stores track names, genres, album details, duration, and price.    |
| `Artist`        | Stores music artist information.                                   |
| `Album`         | Stores album details and associated artists.                       |
| `Genre`         | Stores music genre categories.                                     |
| `MediaType`     | Stores media types associated with tracks.                         |
| `Playlist`      | Stores playlist information.                                       |
| `PlaylistTrack` | Connects playlists with their associated tracks.                   |

The tables are connected through primary keys and foreign keys to maintain relationships between customers, invoices, tracks, albums, artists, and genres.

## 🔍 Business Questions Answered

This project uses SQL queries to answer the following questions:

1. Who is the senior-most employee based on job level?
2. Which countries have the most invoices?
3. What are the three highest invoice totals?
4. Which city generates the highest total invoice revenue?
5. Who is the customer who has spent the most money?
6. Which customers have purchased Rock music?
7. Which 10 artists have the highest number of Rock tracks?
8. Which tracks are longer than the average song length?
9. How much has each customer spent on each artist?
10. What is the most purchased music genre in each country, including ties?
11. Who is the highest-spending customer in each country, including ties?

## 📊 Key Analysis Areas

### 1. Sales Analysis

Analyzes invoice counts by country, invoice values, and total revenue by city.

### 2. Customer Analysis

Identifies the highest-spending customer and explores customer spending patterns.

### 3. Music Genre Analysis

Identifies Rock music listeners and the most purchased genre in each country.

### 4. Artist Analysis

Finds the top 10 artists with the highest number of Rock tracks.

### 5. Track Analysis

Identifies tracks whose duration is longer than the average song length.

### 6. Customer Spending by Artist

Analyzes how much each customer spends on different artists.

## 🚀 How to Run the Project

1. Install MySQL and open MySQL Workbench.
2. Download the Music Store dataset in CSV format.
3. Open the project `.sql` file in MySQL Workbench.
4. Execute the database creation and table creation statements.
5. Import the CSV data into the corresponding tables.
6. Check that the CSV column names match the table structure and that the data is imported correctly.
7. Execute the SQL analysis queries.
8. Review the query outputs to understand the results and business insights.

**Note:** The analysis queries require the dataset to be imported into the database before execution.

## 💡 Recommendations

The following improvements could be considered for future development:

* **Interactive Visualizations:** Create dashboards with charts, filters, and geographic views.
* **Customer Segmentation:** Group customers according to their purchasing and spending behavior.
* **Sales Forecasting:** Predict future revenue and demand using historical sales data.
* **Churn Prediction:** Identify customers whose purchasing activity is declining and develop retention strategies.
* **Real-Time Analytics:** Connect the database to a live dashboard to monitor sales and customer KPIs.

These are proposed future improvements, not features implemented in the current SQL analysis.

## 🧠 Challenges and Learning

During this project, I gained practical experience in relational database design and SQL-based data analysis.

Key learning outcomes:

* Understanding relationships between multiple tables.
* Using joins to retrieve data from related tables.
* Applying aggregate functions to analyze sales and customer spending.
* Working with CTEs and window functions.
* Interpreting SQL query results.
* Converting data analysis results into meaningful business insights.

## 🏁 Conclusion

The Music Store Data Analysis project demonstrates how SQL and relational databases can be used to analyze customer transactions and music-related data.

The project explores customer spending, sales across locations, popular genres, artist performance, and purchasing behavior. It helped strengthen my understanding of SQL concepts and how data analysis can support better business planning and customer-focused decisions.

## 👩‍💻 Author

**Srivalli Janani**

* **Degree:** B.Tech in Data Science
* **Project:** Music Store Data Analysis Using SQL
* **Tools:** MySQL, SQL

---

⭐ *This project demonstrates the practical application of SQL for relational database management and business data analysis.*
