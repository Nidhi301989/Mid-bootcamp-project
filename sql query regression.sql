-- 1.Create a database called house_price_regression.
create database house_price_regression;

-- 2.Create a table house_price_data with the same columns as given in the csv file. Please make sure you use the correct data types for the columns. 
-- 3.Import the data from the csv file into the table. Before you import the data into the empty table, make sure that you have deleted the headers from the csv file. To not modify the original data, if you want you can create a copy of the csv file as well. Note you might have to use the following queries to give permission to SQL to import data from csv files in bulk:
-- 4. Select all the data from table house_price_data to check if the data was imported correctly.
SELECT * FROM house_price_data;

-- 5.Use the alter table command to drop the column date from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.
ALTER TABLE house_price_data
DROP COLUMN date;
SELECT * FROM house_price_data
LIMIT 10;

-- 6.Use sql query to find how many rows of data you have.
SELECT COUNT(*) AS total_rows FROM house_price_data;

-- 7.Now we will try to find the unique values in some of the categorical columns:
-- What are the unique values in the column bedrooms?
SELECT DISTINCT bedrooms FROM house_price_data;

-- What are the unique values in the column bathrooms?
SELECT DISTINCT bathrooms FROM house_price_data;

-- What are the unique values in the column floors?
SELECT DISTINCT floors FROM house_price_data;

-- What are the unique values in the column condition?
SELECT DISTINCT `condition` FROM house_price_data;

-- What are the unique values in the column grade?
SELECT DISTINCT grade FROM house_price_data;

-- 8.Arrange the data in a decreasing order by the price of the house. Return only the IDs of the top 10 most expensive houses in your data.
SELECT id
FROM house_price_data
ORDER BY price DESC
LIMIT 10;

-- 9.What is the average price of all the properties in your data?
SELECT AVG(price) AS average_price
FROM house_price_data;

-- 10.In this exercise we will use simple group by to check the properties of some of the categorical variables in our data
-- What is the average price of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the prices. Use an alias to change the name of the second column.
SELECT bedrooms, AVG(price) AS average_price
FROM house_price_data
GROUP BY bedrooms;

-- What is the average sqft_living of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the sqft_living. Use an alias to change the name of the second column.
SELECT bedrooms, AVG(sqft_living) AS average_sqft_living
FROM house_price_data
GROUP BY bedrooms;

-- What is the average price of the houses with a waterfront and without a waterfront? The returned result should have only two columns, waterfront and Average of the prices. Use an alias to change the name of the second column.
SELECT waterfront, AVG(price) AS average_price
FROM house_price_data
GROUP BY waterfront;

-- Is there any correlation between the columns condition and grade? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
-- ANSWER:
-- Positive Correlation: If the average grade increases as the condition increases, or if the average condition increases as the grade increases, there is a positive correlation.
-- Negative Correlation: If the average grade decreases as the condition increases, or if the average condition decreases as the grade increases, there is a negative correlation.
-- No Correlation: If there’s no clear trend or pattern between the average values, there is likely no significant correlation.

SELECT `condition`, AVG(grade) AS average_grade
FROM house_price_data
GROUP BY `condition`;

SELECT grade, AVG(`condition`) AS average_condition
FROM house_price_data
GROUP BY grade;


-- 11.One of the customers is only interested in the following houses:
-- Number of bedrooms either 3 or 4
SELECT *
FROM house_price_data
WHERE bedrooms IN (3, 4);

-- Bathrooms more than 3
SELECT *
FROM house_price_data
WHERE bathrooms > 3;

-- One Floor
SELECT *
FROM house_price_data
WHERE floors = 1;

-- No waterfront

SELECT *
FROM house_price_data
WHERE waterfront = 0;


-- Condition should be 3 at least
SELECT *
FROM house_price_data
WHERE `condition` >= 3;

-- Grade should be 5 at least
SELECT *
FROM house_price_data
WHERE `grade` >= 5;

-- Price less than 300000
SELECT *
FROM house_price_data
WHERE price < 300000;

-- 12.Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. Write a query to show them the list of such properties. You might need to use a sub query for this problem.
-- ANSWER: 1.Calculate the average price of all properties.
-- 2.Use this average price to find properties where the price is at least twice this average value.
SELECT *
FROM house_price_data
WHERE price > 2 * (SELECT AVG(price) FROM house_price_data);

-- 13. Since this is something that the senior management is regularly interested in, create a view of the same query.


CREATE VIEW high_price_properties AS
SELECT *
FROM house_price_data
WHERE price > 2 * (SELECT AVG(price) FROM house_price_data);

SELECT * FROM high_price_properties;

-- 14.Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms?

SELECT
    (SELECT AVG(price) FROM house_price_data WHERE bedrooms = 4) -
    (SELECT AVG(price) FROM house_price_data WHERE bedrooms = 3) AS price_difference;
    
-- 15.What are the different locations where properties are available in your database? (distinct zip codes)
SELECT DISTINCT zipcode
FROM house_price_data;

-- 16.Show the list of all the properties that were renovated.

SELECT *
FROM house_price_data
WHERE yr_renovated IS NOT NULL AND yr_renovated != 0;

-- 17.Provide the details of the property that is the 11th most expensive property in your database.

SELECT *
FROM house_price_data
ORDER BY price DESC
LIMIT 10, 1;

-- ORDER BY price DESC: Sorts the properties by price in descending order (most expensive first).
-- LIMIT 10, 1: Skips the first 10 rows (the top 10 most expensive properties) and then returns the 11th row, which corresponds to the 11th most expensive property.
