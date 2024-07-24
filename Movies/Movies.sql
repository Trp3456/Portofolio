create database cinema;
use cinema;
create table films(
	id int,
    title varchar(300),
    release_year int,
    country varchar(50),
    duration int,
    language varchar(50),
    certification varchar(50),
    gross int,
    budget int
);

-- CHALLENGE
-- 1. How many movies are present in the database?
-- 2. There seems to be a lot of missing data in the gross and budget columns. How many rows have missing data? What would you recommend your manager to do with these rows?
-- 3. How many different certifications or ratings are present in the database?
-- 4. What are the top five countries in terms of number of movies produced?
-- 5. What is the average duration of English versus French movies? (Don't forget you can use the AI assistant!)
-- 6. Any other insights you found during your analysis? 

-- 1. How many movies are present in the database?
select count(*) from films;
-- 4897 movies

-- 2. There seems to be a lot of missing data in the gross and budget columns. How many rows have missing data? What would you recommend your manager to do with these rows?
select count(isnull(gross)) from films
where isnull(gross)=1;
-- there are 798 missing data in gross column
select count(isnull(budget)) from films
where isnull(budget)=1;
-- there are 419 missing data in budget column

-- there are not additional data for gross and budget so we can ignore those data

-- 3. How many different certifications or ratings are present in the database?
select distinct certification from films
where certification != '';
select count(distinct certification) from films
where certification != '';
-- there are 12 certifications or ratings

-- 4. What are the top five countries in terms of number of movies produced?
select country, count(country) from films
group by country
order by count(country) desc
limit 5;
-- USA = 3707, UK = 437, France = 152, Canada = 120, Germany = 96

-- 5. What is the average duration of English versus French movies?
select language, avg(duration) as 'average duration' from films
where language in ('English', 'French')
group by language;
-- the average duration of English versus French movies are 107.62 and 104.45

-- 6. Any other insights you found during your analysis? 
select * from films;
-- top 5 most expensive movies
select title, budget from films
order by budget desc
limit 5;
-- -- top 5 gross
select title, gross from films
order by gross desc
limit 5;

-- top 5 most profitable movies according gross budget ratio
select title, (gross/budget) as profitable from films
order by  profitable desc
limit 5;

-- the 5 most movie rating to watch
select certification, avg(gross) from films
group by certification
order by avg(gross) desc
limit 5;
-- the G rating has the most people spent money to watch, the pG, PG-13, M, and Approved

-- the average duration throughout the year
select release_year, avg(duration) from films
where release_year is not null
group by release_year
order by release_year asc;
-- the average duration from 1934 to 2016 is stable, but there some unique time periode 1929-1937 where average duration down for 40 minute and decrease over time until 1937. that is period of great deppresion
-- during the WWII the avg duration of moies is not stable
-- during he 70's to 90's the avg duration hovering in 110's minutes
-- during the new century, the film industry relize the best moie duatuon is hovering in 100's

select * from films;


