#Task 1: Write a query to display for each store its store ID, city, and country.
SELECT store_id, city, country FROM country
	INNER JOIN city
		USING (country_id)
	INNER JOIN address
		USING (city_id)
	INNER JOIN store
		USING (address_id);
        
#Task 2: Write a query to display how much business, in dollars, each store brought in.
SELECT store_id, sum(amount) FROM store
	INNER JOIN staff
		USING (store_id)
	INNER JOIN payment
		USING (staff_id)
GROUP BY store_id;
       
#Task 3: What is the average running time(length) of films by category?
SELECT name, avg(length) FROM category
	INNER JOIN film_category
		USING (category_id)
	INNER JOIN film
		USING (film_id)
GROUP BY name;


#Task 4: Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
SELECT name, avg(length) FROM category
	INNER JOIN film_category
		USING (category_id)
	INNER JOIN film
		USING (film_id)
GROUP BY name
ORDER BY avg(length) DESC
LIMIT 5;

#Task 5: Display the top 5 most frequently(number of times) rented movies in descending order.
#QUESTION!!
SELECT title, count(return_date)-1 as Nr_of_rents FROM film
	INNER JOIN inventory
		USING (film_id)
	INNER JOIN rental
		USING (inventory_id)
GROUP BY title
ORDER BY Nr_of_rents DESC
LIMIT 5;

#Task 6: List the top five genres in gross revenue in descending order
SELECT name, sum(amount) As gross_revenue FROM category 
	INNER JOIN film_category
		USING (category_id)
	INNER JOIN film
		USING (film_id)
	INNER JOIN inventory
		USING (film_id)
	INNER JOIN rental
		USING (inventory_id)
	INNER JOIN payment
		USING (rental_id)
GROUP BY name
ORDER BY gross_revenue DESC
LIMIT 5;

#Task 7: Is "Academy Dinosaur" available for rent from Store 1?
SELECT title, count(film_id) FROM film
	INNER JOIN inventory
		USING (film_id)
WHERE title = "Academy Dinosaur" AND store_id = 1;



    
    






