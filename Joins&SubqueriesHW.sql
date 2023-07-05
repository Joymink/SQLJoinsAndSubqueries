--Question 1  List All customers who live in texas 

select c.first_name, c.last_name, a.district
from customer as c
inner join address as a 
on c.address_id = a.address_id
where a.district = 'Texas'

--Question 2 get all payments above 6.99 with customer's full name

select c.first_name, c.last_name, p.amount
from customer as c
inner join payment as p 
on c.customer_id = p.customer_id 
where p.amount > 6.99

--Question 3 Show all customers names who have made payments over $175

select c.first_name, c.last_name
from customer as c 
where customer_id in (
	select customer_id
	from payment as p
	Group by p.customer_id 
	having sum(amount) > 175
	

)
--Question 4 List all customers that live in Nepal

select c.first_name, c.last_name, city.city
from customer as c
full join address as a 
on c.address_id = a.address_id 
full join city 
on city.city_id = a.city_id 
where city = 'Nepal'

--Question 5 Which staff member had the most transactions?


select s.first_name, s.last_name, s.staff_id, count(p.amount) as c
from staff as s
inner join payment as p 
on s.staff_id = p.staff_id 
group by s.staff_id 
order by c desc;


--Question 6 How many movies of each rating are there?

select rating, count(film.rating)
from film
group by rating

--Question 7 Show all customers who have made a single payment above 6.99


select customer_id, first_name, last_name
from customer
where customer_id in 
	(select customer_id
	from payment
	where amount > 6.99)

-- Question 8 How many free rentals did our stores give away?
	

select s.first_name, s.last_name, s.staff_id, count(p.amount)
from staff as s
inner join rental as r 
on s.staff_id = r.staff_id 
inner join payment as p 
on r.rental_id = p.rental_id 
where p.amount <= 0
group by s.staff_id 













