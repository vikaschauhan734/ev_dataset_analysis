CREATE TABLE Vehicles (vin VARCHAR,
					  country VARCHAR,
					  city VARCHAR,
					  state VARCHAR,
					  postal_code INT,
					  model_year INT,
					  make VARCHAR,
					  model VARCHAR,
					  electric_vehicle_type VARCHAR,
					  clean_alternative_fuel_vehicle_eligibility VARCHAR,
					  electric_range INT,
					  base_msrp INT,
					  electric_utility VARCHAR);

copy Vehicles from 'D:\projects\cuvatte\final_evaluation_2\sql\Electric_Vehicle_Population_Data.csv' delimiter ',' csv header;

-- Question 1
-- Write a query getting all EV vehicles in each state.
SELECT * FROM Vehicles;

SELECT state, model FROM Vehicles GROUP BY state, model ORDER BY state, model;

-- Question 2
-- Write a query to find all electric vehicles that are from the city of Seattle.
SELECT * FROM Vehicles WHERE city = 'Seattle';

-- Question 3
-- Write a query to display the total number of electric vehicles in each county.
SELECT * FROM Vehicles;

SELECT country, count(vin) FROM Vehicles GROUP BY country;

-- Question 4
-- Write a query to find the electric vehicles that have a base MSRP greater than the average MSRP of all vehicles.
SELECT AVG(base_msrp) AS average FROM Vehicles;

SELECT * FROM Vehicles WHERE
	base_msrp > (SELECT AVG(base_msrp) AS average FROM Vehicles);

SELECT AVG(base_msrp) AS average FROM Vehicles WHERE base_msrp <> 0;

SELECT * FROM Vehicles WHERE
	base_msrp > (SELECT AVG(base_msrp) AS average FROM Vehicles WHERE base_msrp <> 0); 

-- Question 5
-- Write a query to find all Plug-in Hybrid Electric Vehicles (PHEV) that are from 
-- King county and have an electric range greater than 50 miles.
SELECT * FROM Vehicles;

SELECT * FROM Vehicles WHERE electric_vehicle_type = 'Plug-in Hybrid Electric Vehicle (PHEV)' AND country = 'King' AND electric_range > 50;

-- Question 6
-- Write a query to find the count of electric vehicles by city for those cities that have more than 100 vehicles.
SELECT city, count(vin) FROM Vehicles GROUP BY city HAVING count(vin) > 100; 

-- Question 7
-- Write a query to list the Make and Model of electric vehicles that are located in counties
-- where the average electric range is greater than 150 miles.
SELECT * FROM Vehicles;

SELECT country FROM Vehicles GROUP BY country HAVING AVG(electric_range) > 150;

SELECT make, model FROM Vehicles
WHERE country IN (SELECT country FROM Vehicles GROUP BY Country HAVING AVG(electric_range) > 150)
GROUP BY make, model ORDER BY make, model;

-- Question 8
-- Write a query that categorizes vehicles as either "Affordable" or "Expensive" based on their Base MSRP
-- (consider vehicles with an MSRP above $40,000 as "Expensive" and those below or equal as "Affordable").
-- Then, find the total number of vehicles in each category.
SELECT CASE 
	WHEN base_msrp > 40000 THEN 'Expensive'
	ELSE 'Affordable'
	END AS price_category,
COUNT(*) AS total_vehicles
FROM Vehicles
GROUP BY price_category;

-- Question 9
-- Write a query to find the Make, Model, and Electric Range of each vehicle along with the rank of 
-- the vehicle based on its electric range within its country (highest range first).
SELECT make, model, electric_range, RANK() OVER (PARTITION BY country ORDER BY electric_range DESC) AS range_rank
FROM Vehicles;

-- Question 10
-- Write a query using a Common Table Expression (CTE) to calculate the total number of 
-- electric vehicles and the total number of "Clean Alternative Fuel Vehicle (CAFV) Eligible" vehicles 
-- for each state, then compute the percentage of CAFV-eligible vehicles for each state.
SELECT state,
	   COUNT(*) AS total_vehicles,
	   SUM(CASE WHEN clean_alternative_fuel_vehicle_eligibility = 'Clean Alternative Fuel Vehicle Eligible' THEN 1 ELSE 0 END) 
AS cafv_eligible_vehicles
FROM Vehicles
GROUP BY state;

WITH VehicleCounts AS (
    SELECT state,
           COUNT(*) AS total_vehicles,
           SUM(CASE WHEN clean_alternative_fuel_vehicle_eligibility = 'Clean Alternative Fuel Vehicle Eligible' THEN 1 ELSE 0 END) 
	AS cafv_eligible_vehicles
    FROM Vehicles
    GROUP BY state
)
SELECT state, total_vehicles, cafv_eligible_vehicles,
       ROUND((cafv_eligible_vehicles * 100.0 / total_vehicles), 2) AS cafv_percentage
FROM VehicleCounts;
