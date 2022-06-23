-Q1-
ER Digram

-Q2-
DROP TABLE route_details;
CREATE TABLE route_details(route_id INT(10) UNIQUE ,flight_num INT(10) CHECK(flight_num >1000),origin_airport VARCHAR(225),destination_airport VARCHAR(225),aircraft_id VARCHAR(225),distance_miles INT(10) CHECK(distance_miles>0) );

-Q3-
SELECT C.first_name FROM passengers_on_flights_csv P LEFT JOIN customer_csv C ON(C.customer_id=P.customer_id) WHERE `route_id` BETWEEN 1 AND 25;

-Q4-
SELECT COUNT(customer_id)AS No_of_Customers, SUM(`Price_per_ticket`)AS Total_Price FROM `ticket_details_csv` WHERE`class_id`='Bussiness';

-Q5-
SELECT CONCAT(first_name,last_name) AS Full_name FROM customer_csv

-Q6-
SELECT DISTINCT(C.customer_id) FROM ticket_details_csv T LEFT JOIN customer_csv C ON (C.customer_id = T.customer_id) WHERE T.customer_id IS NOT NULL;

-Q7-
SELECT CONCAT(C.first_name,C.last_name) AS Full_name FROM customer_csv C LEFT JOIN ticket_details_csv T ON(C.customer_id = T.customer_id) WHERE T.brand='Emirates' ORDER BY C.customer_id,T.brand;

-Q8-
SELECT COUNT(customer_id) AS Total_Customers FROM passengers_on_flights_csv GROUP BY class_id HAVING class_id="Economy Plus";

-Q9-
SELECT IF(SUM(Price_per_ticket)>10000,"Yes Revenue has Crossed 10000", "no Revenue has Crossed not 10000") AS Total_Revenue FROM `ticket_details_csv`

-Q10-
USE `air_cargo_project`;
GRANT ALL ON *.* TO 'user'@'localhost';
#FLUSH PRIVILEGES;

-Q11-
SELECT customer_id,  class_id , MAX(Price_per_ticket) OVER(PARTITION BY class_id) AS Max_Price FROM ticket_details_csv;

-Q12-
SELECT customer_id FROM `passengers_on_flights_csv` WHERE route_id=4;

-Q13-
SELECT * FROM `passengers_on_flights_csv` WHERE route_id=4;

-Q14-
SELECT customer_id,aircraft_id,SUM(Price_per_ticket)AS Total_sales FROM ticket_details_csv GROUP BY customer_id,aircraft_id WITH ROLLUP;

-Q15-
DROP VIEW Bussiness_Class;
CREATE VIEW Bussiness_Class AS
SELECT customer_id,brand FROM `ticket_details_csv` WHERE class_id='Bussiness';
SELECT * FROM Bussiness_Class;


