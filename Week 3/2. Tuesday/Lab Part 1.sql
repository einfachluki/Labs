use sakila;

#Task 1: Which actor has appeared in the most films?
SELECT first_name, last_name, count(film_id) AS Amount FROM film_actor
INNER JOIN actor
USING (actor_id)
GROUP BY actor_id
ORDER BY Amount DESC
Limit 1;

#Task 2: Most active customer (the customer that has rented the most number of films)
SELECT first_name, last_name, count(rental_id) as amount FROM customer 
INNER JOIN rental
USING (customer_id)
GROUP BY customer_id
ORDER BY amount DESC
Limit 1;

#Task 3: List number of films per category.
SELECT name, count(name) FROM category 
INNER JOIN film_category
USING (category_id)
GROUP BY category_id;

#Task 4: Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address, address2 FROM staff
INNER JOIN address
USING (address_id);

#Task 5: get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
SELECT title, name FROM film
	INNER JOIN language
	USING (language_id)
WHERE (language_id = "English" AND language_id = "Italian") OR title LIKE "M%";

#Task 6: Display the total amount rung up by each staff member in August of 2005.
SELECT first_name, sum(amount) FROM payment
	INNER JOIN staff
    USING (staff_id)
WHERE payment_date LIKE "2005-08%"
GROUP BY staff_id;

#Task 7: List each film and the number of actors who are listed for that film.
SELECT title, count(actor_id) As nr_actors FROM film
	INNER JOIN film_actor
    USING (film_id)
GROUP BY title;

#Task 8: Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
#Question: Why not poss to implement first_name also?
SELECT last_name, sum(amount) AS total_paid FROM payment
	INNER JOIN customer
    USING (customer_id)
GROUP BY last_name
ORDER BY last_name;

#Task 9: Write sql statement to check if you can find any actor who never particiapted in any film.
SELECT actor_id, count(film_id) FROM film
	INNER JOIN film_actor
    USING (film_id)
GROUP BY actor_id
HAVING count(film_id) = 0;

#Task 10: get the addresses that have NO customers, and ends with the letter "e"
SELECT address FROM address
LEFT JOIN customer
USING (address_id)
WHERE address LIKE "%e"  AND customer_id IS NULL;

#Option: what is the most rented film?
SELECT title, count(rental_id) as total_rent FROM rental
	INNER JOIN inventory
		USING (inventory_id)
	INNER JOIN film
		USING (film_id)
GROUP BY title
ORDER BY total_rent DESC
LIMIT 1;

##OPTIONAL FILE 

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



    
    






