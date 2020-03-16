--    https://sqlzoo.net/wiki/More_JOIN_operations


-- 1. List the films where the yr is 1962 [Show id, title]


SELECT id, title
 FROM movie
 WHERE yr=1962
 
 
 -- 2. Give year of 'Citizen Kane'.

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';


-- 3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;


-- 4. What id number does the actor 'Glenn Close' have?

SELECT id
FROM actor
WHERE name = 'Glenn Close'


-- 5. What is the id of the film 'Casablanca'

SELECT id
FROM movie
WHERE title = 'Casablanca'


-- 6. Obtain the cast list for 'Casablanca'.

SELECT name
FROM actor JOIN casting
ON id=actorid
WHERE movieid = 11768

-- 7. Obtain the cast list for the film 'Alien'

SELECT name
FROM actor JOIN casting
ON actor.id=casting.actorid
WHERE movieid = (SELECT id
                 FROM movie
                 WHERE title='Alien');
                 
                 

-- 8. List the films in which 'Harrison Ford' has appeared


SELECT title
FROM movie JOIN casting
ON movie.id = casting.movieid
WHERE actorid = (SELECT id
                 FROM actor
                 WHERE name = 'Harrison Ford');



-- 9. List the films where 'Harrison Ford' has appeared - but not in the starring role.

SELECT title
FROM movie JOIN casting
ON movie.id = casting.movieid
WHERE actorid = (SELECT id
                 FROM actor
                 WHERE name = 'Harrison Ford') AND
                 ord <> 1;
                 
                 
 
-- 10. List the films together with the leading star for all 1962 films.


SELECT title, name
FROM movie JOIN casting JOIN actor
ON movie.id = casting.movieid AND actor.id=casting.actorid 
WHERE yr = 1962 AND ord =1;



-- 11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.

SELECT yr, COUNT(title)
FROM movie JOIN casting JOIN actor
ON movie.id = casting.movieid AND actor.id=casting.actorid
WHERE actor.name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title)>2; 



-- 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.

SELECT title, name
FROM movie JOIN casting JOIN actor
ON movie.id = casting.movieid AND actor.id=casting.actorid
WHERE movie.id IN (SELECT movieid
                   FROM movie x JOIN casting y
                   ON x.id=y.movieid
                   WHERE y.actorid = (SELECT z.id
                                      FROM actor z
                            WHERE name = 'Julie Andrews'))
      AND ord = 1;
      
      
      
-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.










