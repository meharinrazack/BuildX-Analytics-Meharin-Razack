-- Query 1: Find restaurants with excellent ratings above 4.5

SELECT restaurant_name,
area,
rating
FROM zomato
WHERE rating > 4.5;

-- Query 2: Find the average rating of each restaurant type

SELECT restaurant_type,
ROUND(AVG(rating), 2) AS avg_rating
FROM zomato
GROUP BY restaurant_type;

-- Query 3: Find the 10 most reviewed restaurants

SELECT restaurant_name,
num_ratings
FROM zomato
ORDER BY num_ratings DESC
LIMIT 10;

-- Query 4: Find areas that have more than 50 restaurants

SELECT area,
COUNT(*) AS restaurant_count
FROM zomato
GROUP BY area
HAVING COUNT(*) > 50;

-- Query 5: Find restaurants serving North Indian cuisine

SELECT restaurant_name,
cuisine_type
FROM zomato
WHERE cuisine_type LIKE '%North Indian%';

-- Query 6: Compare restaurant types based on popularity and customer satisfaction

SELECT
restaurant_type,
COUNT(*) AS total_restaurants,
ROUND(AVG(rating), 2) AS avg_rating,
SUM(num_ratings) AS total_reviews
FROM zomato
GROUP BY restaurant_type
HAVING COUNT(*) >= 20
ORDER BY avg_rating DESC,
total_reviews DESC;
