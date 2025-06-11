# My APPROACH 

With Greatestratings as 
(SELECT 
 u.name
 From Users U
JOIN MovieRating R ON U.User_id = R.User_id
GROUP BY name 
ORDER BY COUNT(*) DESC, U.name                            #If two or more users have the same number of ratings, this breaks the tie (u.name)
LIMIT 1),
HIghestRatings AS 
(SELECT 
 m.title
 FROM MOVIES M
JOIN MovieRatings R ON M.Movie_id = R.Movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-31'
GROUP BY m.title
ORDER BY AVG(R.RATING) DESC, m.title                           #If two or more users have the same number of ratings, this breaks the tie (m.title)
LIMIT 1
)
SELECT CONCAT(G.name,' ',H.title) as results
FROM HighestRatings H
CROSS JOIN Greatestratings G;

#Corrected One 

WITH Greatestratings AS (
  SELECT 
    u.name
  FROM Users u
  JOIN MovieRating r ON u.user_id = r.user_id
  GROUP BY u.name
  ORDER BY COUNT(*) DESC, u.name
  LIMIT 1
),
HighestRatings AS (
  SELECT 
    m.title
  FROM Movies m
  JOIN MovieRating r ON m.movie_id = r.movie_id
  WHERE r.created_at BETWEEN '2020-02-01' AND '2020-02-29'
  GROUP BY m.title
  ORDER BY AVG(r.rating) DESC, m.title
  LIMIT 1
)
SELECT CONCAT(g.name, ' ', h.title) AS results
FROM HighestRatings h
CROSS JOIN Greatestratings g;
