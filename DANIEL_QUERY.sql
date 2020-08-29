/*SELECT schools.schoolname, SUM(salary.salary) AS total_salary, people.namefirst, people.namelast
FROM people
JOIN salaries AS salary
	ON people.playerid = salary.playerid
JOIN collegeplaying
	ON people.playerid = collegeplaying.playerid
JOIN schools
	ON collegeplaying.schoolid = schools.schoolid
WHERE schools.schoolname ILIKE '%Vanderbilt%'
GROUP BY schools.schoolname, people.namefirst, people.namelast
ORDER BY total_salary DESC*/

/*WITH battery AS (
	SELECT sum(po) AS battery_putouts
	FROM fielding
	WHERE (pos ILIKE '%P%' OR pos ILIKE '%C%') 
		AND yearid = 2016),

infield AS (
	SELECT SUM(po) AS infield_putouts
	FROM fielding
	WHERE yearid = 2016 AND(pos ILIKE '%1B%' OR pos ILIKE '%2B%' OR pos ILIKE '%3B%' OR pos ILIKE '%SS%'))

SELECT (SELECT sum(po) FROM fielding WHERE yearid=2016) - infield_putouts - battery_putouts AS outfield_putouts, infield_putouts, battery_putouts
FROM fielding, infield, battery*/

/*
select date_trunc('decade', to_date(to_char(yearid, '9999'), 'YYYY')) AS new_decade, sum(so) AS strikeouts, sum(hr) AS homeruns, ROUND((sum(so)/sum(hr)),2) AS ratio
from pitching
GROUP BY new_decade
ORDER BY ratio */

/*SELECT sb, cs, namefirst, namelast, 100*sb/(sb + cs) AS attempt
FROM batting
JOIN people
ON batting.playerid = people.playerid
WHERE yearid = 2016 AND sb >=20
ORDER BY attempt DESC*/

/*SELECT subquery.yearid, w, franchid, wswin, wins
FROM 
	(SELECT max(w) AS wins, yearid FROM teams WHERE yearid >= 1970 GROUP BY yearid) AS subquery
JOIN teams
ON subquery.yearid = teams.yearid
WHERE teams.w = subquery.wins*/

/*select attendance/games AS avg_attendance, park, team
FROM homegames
WHERE year = 2016 AND games >= 10
ORDER BY avg_attendance 
LIMIT 5*/

WITH national_league AS (select playerid, yearid
FROM awardsmanagers
WHERE awardid ILIKE '%TSN%' AND lgid = 'NL'),

american_league AS (select playerid, yearid
FROM awardsmanagers
WHERE awardid ILIKE '%TSN%' AND lgid = 'AL')

/*select national_league.playerid
FROM national_league
JOIN american_league
ON national_league.playerid = american_league.playerid*/




