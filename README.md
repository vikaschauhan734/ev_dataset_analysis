# EV Dataset Analysis

This project involves querying the **ev.csv** dataset to gain insights into the distribution, specifications, and categorization of electric vehicles (EVs) across different locations and categories.

## Dataset

The dataset contains information on various electric vehicles, including their location (state, county, city), make and model, base MSRP, electric range, and eligibility for Clean Alternative Fuel Vehicle (CAFV) incentives.

## Queries

### 1. EV Vehicles by State
   - **Description**: Retrieve all electric vehicles grouped by each state.
   - **Query Objective**: Understand the distribution of electric vehicles across states.

### 2. EV Vehicles in Seattle
   - **Description**: Find all electric vehicles registered in Seattle.
   - **Query Objective**: Focus on the EV population specifically in Seattle.

### 3. Total Electric Vehicles by County
   - **Description**: Display the total count of electric vehicles in each county.
   - **Query Objective**: Determine the concentration of electric vehicles in different counties.

### 4. Vehicles with MSRP Greater than Average
   - **Description**: Find electric vehicles that have a base MSRP above the average MSRP across all vehicles.
   - **Query Objective**: Identify higher-end electric vehicles by comparing them to the average MSRP.

### 5. Plug-in Hybrid Electric Vehicles in King County with Range > 50 Miles
   - **Description**: Retrieve Plug-in Hybrid Electric Vehicles (PHEVs) in King County that have an electric range over 50 miles.
   - **Query Objective**: Filter PHEVs in King County with a notable electric range.

### 6. Cities with More than 100 EVs
   - **Description**: Count the number of electric vehicles by city and display results for cities with over 100 vehicles.
   - **Query Objective**: Identify urban centers with significant EV adoption.

### 7. Make and Model in Counties with High Electric Range
   - **Description**: List the make and model of electric vehicles in counties where the average electric range exceeds 150 miles.
   - **Query Objective**: Focus on vehicles in areas with higher-than-average electric ranges.

### 8. Categorize Vehicles by MSRP as "Affordable" or "Expensive"
   - **Description**: Classify vehicles into "Affordable" (MSRP ≤ $40,000) and "Expensive" (MSRP > $40,000), then find the total count for each category.
   - **Query Objective**: Provide a breakdown of vehicles based on affordability.

### 9. Rank Vehicles by Electric Range within Each County
   - **Description**: Retrieve the make, model, and electric range of each vehicle, and rank vehicles by electric range within each county (highest range first).
   - **Query Objective**: Determine the relative electric range rankings within each county.

### 10. Calculate Percentage of CAFV-Eligible Vehicles by State (Using CTE)
   - **Description**: Using a Common Table Expression (CTE), calculate the total number of EVs and the total number of "Clean Alternative Fuel Vehicle (CAFV) Eligible" vehicles for each state, and compute the CAFV-eligible percentage.
   - **Query Objective**: Quantify the proportion of vehicles eligible for CAFV incentives by state.
