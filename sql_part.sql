Select AVG(column1), AVG(column2), AVG(column3) from table_name;
Select PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY column1), 
     PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY column2),
     PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY column3) from table_name;
Select MEDIAN(column1), MEDIAN(column2), MEDIAN(column3) from table_name;
Select column1 from table_name GROUP BY column1 ORDER BY COUNT(column1) DESC LIMIT 1;
Select VAR(column1), VAR(column2) from table_name;
Select STDEV(column1) as std_dev1, STDEV(column2) as std_dev2 FROM table_name;
Select (3 * (sub.mean_value - sub.median_value) / sub.std_value) from
    (Select AVG(column1) as mean_value, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY column1)      as median_value, STDEV(column1) as std_value from table_name ) as sub;
Select
    (  AVG(POW(column1 - sub.mean_value, 4)) / POW(sub.std_value, 4))  from table_name,
    (Select AVG(column1) as mean_value, STDEV(column1) as std_value from table_name
    ) as sub;
