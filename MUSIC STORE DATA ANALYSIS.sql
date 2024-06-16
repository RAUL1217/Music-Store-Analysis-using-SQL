-- SET 1

--Q1. Who is the senior most employee based on job title ?

select concat( first_name, ' ',last_name ) as full_name, title
from employee
order by levels desc
limit 1;

----------------------------------------------------------------------------------------------------------------------------------------------------


--Q2. Which countries have the most Invoices?

select billing_country as country, count(invoice_id) as total_invoice
from invoice
group by country
order by total_invoice desc;

----------------------------------------------------------------------------------------------------------------------------------------------------


--Q3. What are top 3 values of total invoice 

select total 
from invoice 
order by total desc
limit 3;

----------------------------------------------------------------------------------------------------------------------------------------------------


--Q4. Which city has the best customer? We would like to throw a promotional Music Festival in the city we made the most money.
-- Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals.

select billing_city, count(*) as total
from invoice 
group by billing_city
order by total desc 
limit 1;

----------------------------------------------------------------------------------------------------------------------------------------------------


--Q5. Who is the best customer? The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money.

select c.customer_id, c.first_name, c.last_name, sum(i.total) as total
from customer c join invoice i 
on c.customer_id = i.customer_id
group by c.customer_id
order by total desc
limit 1;

----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------



-- SET 2

--Q1. Write query to return the email, first name, last name & Genre of all Rock Music listeners.
-- Return your list ordered alphabetically by email starting with A

select distinct c.first_name, c.last_name, c.email
from customer c join invoice i on c.customer_id = i.customer_id
join invoice_line i1 on i.invoice_id = i1.invoice_id
where track_id in ( select track_id from track t join genre g on t.genre_id = g.genre_id where g.name = 'Rock' )
order by c.email;

----------------------------------------------------------------------------------------------------------------------------------------------------


--Q2. Let's invite the artist who have written the most rock music in our dataset.
-- Write a query that returns the Artist name and total track count of the top 10 rock bands

select a.artist_id, a.name, count(t.track_id) as total_track
from artist a join album a1 on a.artist_id = a1.artist_id
join track t on a1.album_id = t.album_id
where genre_id in ( select genre_id from genre g where g.name = 'Rock')
group by 1 order by 3 desc
limit 10;

----------------------------------------------------------------------------------------------------------------------------------------------------


--Q3. Returns all the track names that have a song length longer than the average song length.
-- Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

select name, milliseconds as length
from track where milliseconds > ( select avg(milliseconds) from track )
order by length desc;

----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------





