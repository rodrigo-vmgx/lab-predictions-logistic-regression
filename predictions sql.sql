Use sakila;
-- Create a query or queries to extract the information you think may be relevant for building the prediction model. It should include some film features and some rental features (X).
SELECT f.film_id, f.title, f.description, f.rental_duration, f.rental_rate, f.length, f.rating, f.special_features, 
        COUNT(r.rental_id) AS rental_count, AVG(p.amount) AS avg_payment
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.film_id, f.title, f.description, f.rental_duration, f.rental_rate, f.length, f.rating, f.special_features
;

-- Create a query to get the list of all unique film titles and a boolean indicating if it was rented (rental_date) in May 2005. (Create new column called - 'rented_in_may'). This will be our TARGET (y) variable.
SELECT f.title, MAX(CASE WHEN r.rental_date BETWEEN '2005-05-01' AND '2005-05-31' THEN 1 ELSE 0 END) AS rented_in_may
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title;


-- Read the data into a Pandas dataframe. At this point you should have 1000 rows. Number of columns depends on the number of features you chose.


-- Analyze extracted features (X) and transform them. You may need to encode some categorical variables, or scale numerical variables.


-- Create a logistic regression model to predict 'rented_in_may' from the cleaned data.


-- Evaluate the results.