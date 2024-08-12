SELECT *
FROM [CovidDeath]
WHERE continent is not null
ORDER BY 1 ASC

SELECT *
FROM [CovidVaccination]
ORDER BY 1 ASC

SELECT [location], [date], [total_cases], [total_deaths], [population]
FROM [CovidDeath]
WHERE continent is not null
ORDER BY 1 ASC

/* Finding Percentage likelihood of dying of Covid per country */
SELECT [location], [date], [total_cases], [total_deaths], 
[population], (CAST([total_deaths] As bigint)/CAST([total_cases] As bigint))*100 As DeathPercentage
FROM [CovidDeath]
WHERE continent is not null

SELECT [location], [date], [population], 
CAST([total_deaths] As bigint) AS TotalDeaths, 
CAST([total_cases] As bigint) As TotalCases, 
(SELECT CAST([total_deaths] As float) / CAST([total_cases] As float))*100 As PercentageLikelihoodOfDying
FROM [CovidDeath]
WHERE continent is not null
ORDER BY 1 ASC

/* Using wildcards to find the percentage likelihood of dying of covid work in Nigeria */
SELECT [location], [date], [population], 
CAST([total_deaths] As bigint) AS TotalDeaths, 
CAST([total_cases] As bigint) As TotalCases, 
(SELECT CAST([total_deaths] As float) / CAST([total_cases] As float))*100 As PercentageLikelihoodOfDying
FROM [CovidDeath]
WHERE [location] like '%igeri%'
ORDER BY 1 ASC

/* How many percent of the population got Covid */
SELECT [location], [date], 
CAST([population] As bigint) As TotalPopulation, 
CAST([total_cases] As bigint) As TotalCases,
(SELECT CAST([total_cases] As float)/CAST([population] As float))*100 As PercentageCasesByPopulation
FROM [CovidDeath]
WHERE continent is not null
ORDER BY 1 ASC

SELECT [location], [date], CAST([population] As bigint) As TotalPopulation, 
CAST([total_cases] As bigint) As TotalCases,
(SELECT CAST([total_cases] As float)/CAST([population] As float))*100 As PercentageCasesByPopulation
FROM [CovidDeath]
WHERE [location] like '%igeri%'
ORDER BY 1,2 ASC

/* Country with the highest infection rate */
SELECT location, population, MAX(CAST(total_cases As float)) As HighestInfectionCount, 
MAX(CAST([total_cases] As float)/CAST([population] As float))*100 As PercentageCasesByPopulation
FROM [CovidDeath]
WHERE continent is not null
GROUP BY location, population
ORDER  BY 4 DESC

/* Countries with the highest death rate per population */
SELECT location, population, MAX(CAST(total_deaths As float)) As HighestDeathCount, 
MAX(CAST([total_deaths] As float)/CAST([population] As float))*100 As PercentageDeathByPopulation
FROM [CovidDeath]
WHERE continent is not null
GROUP BY location, population
ORDER  BY 4 DESC

/* Countries with the highest death rate */
SELECT location, population, SUM(CAST(total_deaths As float)) As HighestDeathCount, 
MAX(CAST([total_deaths] As float)/CAST([population] As float))*100 As PercentageDeathByPopulation
FROM [CovidDeath]
WHERE continent is not null
GROUP BY location, population
ORDER  BY 3 DESC

/* Countries with their specific highest death rate */
SELECT location, population, MAX(CAST(total_deaths As float)) As HighestDeathCount
FROM [CovidDeath]
WHERE continent is not null
GROUP BY location, population
ORDER  BY 3 DESC

/* showing continents with the highest death counts */
SELECT continent, SUM(CAST(total_deaths As float)) As TotalDeaths
FROM CovidDeath
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeaths DESC

/* Showing continent and their respective highest death count */
SELECT continent, MAX(CAST(total_deaths As float)) As TotalDeaths
FROM CovidDeath
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeaths DESC

/* Vaccination table */
SELECT *
FROM [CovidVaccination]
ORDER BY 1 ASC

SELECT *
FROM CovidDeath As COD
JOIN CovidVaccination As COV
ON  COD.location = COV.location
and COD.date = COV.date