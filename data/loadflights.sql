delete from flights_temp where myear = 'YEAR';
update flights_temp set actualelapsedtime = '0.0' where actualelapsedtime = '';

insert into flights select * from flights_temp;
drop table flights_temp;
