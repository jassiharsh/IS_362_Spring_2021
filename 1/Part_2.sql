select avg(dep_delay) as "departure delay", origin, flights.month from flights 
group by flights.month, flights.origin;