SELECT * FROM [Hotel Reservation Dataset]

/* Q1. What is the total number of reservations in the dataset? */
SELECT COUNT(Booking_ID) AS count_reservations FROM [Hotel Reservation Dataset]
 
/* Q2. Which meal plan is the most popular among guests? */
SELECT TOP 1  type_of_meal_plan, COUNT(Booking_ID) AS count_reservations FROM [Hotel Reservation Dataset]
GROUP BY type_of_meal_plan 
ORDER BY count_reservations DESC

/* Q3. What is the average price per room for reservations involving children? */
SELECT AVG(avg_price_per_room) AS avg_price_room FROM [Hotel Reservation Dataset] WHERE no_of_children != 0

/* Q4. How many reservations were made for the year 20XX (replace XX with the desired year)? */ 
SELECT COUNT(Booking_ID) AS count_reservations_in_22XX_year FROM [Hotel Reservation Dataset] WHERE year(arrival_date) like '20%'
SELECT COUNT(Booking_ID) AS count_reservations_in_2017_year FROM [Hotel Reservation Dataset] WHERE year(arrival_date) = '2017'

/* Q5. What is the most commonly booked room type?*/
SELECT TOP 1 room_type_reserved, COUNT(Booking_ID) AS count_reservations FROM [Hotel Reservation Dataset]
GROUP BY room_type_reserved
ORDER BY count_reservations DESC

/* Q6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? */
SELECT COUNT(Booking_ID) AS count_reservations_on_weekend_nights FROM [Hotel Reservation Dataset] WHERE no_of_weekend_nights > 0 

/* Q7. What is the highest and lowest lead time for reservations? */
SELECT MAX(lead_time) AS highest_time_for_reservations, MIN(lead_time) AS lowest_time_for_reservations FROM [Hotel Reservation Dataset]

/* Q8. What is the most common market segment type for reservations? */
SELECT TOP 1  market_segment_type, COUNT(Booking_ID) AS count_reservations FROM [Hotel Reservation Dataset]
GROUP BY market_segment_type
ORDER BY count_reservations DESC

/* Q9. How many reservations have a booking status of "Confirmed"? */
SELECT COUNT(Booking_ID) AS count_Confirmed_booked FROM [Hotel Reservation Dataset] WHERE booking_status = 'Confirmed'

/* Q10. What is the total number of adults and children across all reservations? */
SELECT SUM(no_of_adults) AS total_number_of_adults, SUM(no_of_children) AS total_number_of_children FROM [Hotel Reservation Dataset]

/* Q11. What is the average number of weekend nights for reservations involving children? */
SELECT AVG(no_of_week_nights) AS avg_weekend_nights_with_children FROM [Hotel Reservation Dataset] WHERE no_of_children > 0

/* Q12. How many reservations were made in each month of the year? */
SELECT month(arrival_date) AS month_arrival_date ,COUNT(Booking_ID) AS count_reservations FROM [Hotel Reservation Dataset]
GROUP BY month(arrival_date)

/* Q13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? */
SELECT room_type_reserved, AVG(no_of_weekend_nights) + AVG(no_of_week_nights) AS average_number_nights 
FROM [Hotel Reservation Dataset] GROUP BY room_type_reserved

/* Q14. For reservations involving children, what is the most common room type, and what is the average price for that room type? */
SELECT TOP 1 room_type_reserved, COUNT(Booking_ID) AS count_reservations, AVG(avg_price_per_room) AS avg_price_room 
FROM [Hotel Reservation Dataset]  WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY count_reservations DESC

/* Q15. Find the market segment type that generates the highest average price per room. */
SELECT TOP 1 market_segment_type, AVG(avg_price_per_room) AS avg_price_per_room FROM [Hotel Reservation Dataset]
GROUP BY market_segment_type
ORDER BY avg_price_per_room DESC
