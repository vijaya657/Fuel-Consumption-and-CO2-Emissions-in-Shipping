create database maritime_transportation;
use maritime_transportation;
show tables;
select*from ship_fuel_efficiency;

#Average Fuel Consumption by Ship Type
select avg(fuel_consumption) as Fuel_consumption_based_on_type, ship_type from ship_fuel_efficiency group by ship_type order by avg(fuel_consumption) desc;

#Average CO2 Emissions by Ship Type
select avg(CO2_emissions) as CO2_Emmision_based_on_type, ship_type from ship_fuel_efficiency group by ship_type order by avg(CO2_emissions) desc;

#Total Fuel & CO2 by Month
select s.month, sum(fuel_consumption) as total_consumption, sum(CO2_emissions) as total_CO2_emission from ship_fuel_efficiency as s group by s.month;

#Highest and Lowest Fuel Consumers
select fuel_consumption, ship_type from ship_fuel_efficiency order by fuel_consumption desc LIMIT 5;

select fuel_consumption, ship_type from ship_fuel_efficiency order by fuel_consumption asc LIMIT 5;

#Fuel Efficiency Analysis emissions per MT

select round(sum(CO2_emissions)/sum(fuel_consumption),2) as emission_per_MT, ship_type from ship_fuel_efficiency group by ship_type order by emission_per_MT DESC;

#Month-wise Trends

select month, round(avg(CO2_emissions),2) as avg_emission, round(avg(fuel_consumption),2) as avg_consumption from ship_fuel_efficiency group by month order by field(month, 'January','February','March','April','May','June','July','August','September','October','November','December');

#Ship Type Distribution

select ship_type, count(*) as total_vessel from ship_fuel_efficiency group by ship_type;

#Fuel & CO2 Extremes by Ship Type

select max(fuel_consumption) as max_consumption, min(fuel_consumption) as min_consumption, max(CO2_emissions) as max_emissions, min(CO2_emissions) as min_emissions, ship_type from ship_fuel_efficiency group by ship_type;

#Ships with Above Average Fuel Consumption

select fuel_consumption, ship_type from ship_fuel_efficiency where fuel_consumption >(select avg(fuel_consumption) from ship_fuel_efficiency);

#Top Routes by Fuel Usage

select sum(fuel_consumption) as total_consumptions, sum(CO2_emissions) as total_CO2_emissions, route_id from ship_fuel_efficiency group by route_id order by total_consumptions DESC LIMIT 10;

#Engine Efficiency Impact

select engine_efficiency, round(avg(fuel_consumption),2) as avg_consumption, round(avg(CO2_emissions),2) as avg_emissions from ship_fuel_efficiency group by engine_efficiency order by engine_efficiency desc LIMIT 10;