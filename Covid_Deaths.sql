
--Selecting all columns of the tables for illustration purposes

Select *
From PortfolioProject..CovidDeaths
Where continent is not null 
order by 3,4


--This line of code retrieves data from the CovidDeaths table, selecting the country's name, report date, total cases, new cases, 
--total deaths, and population, filtering out records where the continent is not specified, and sorting the results by country name and report date.

SELECT 
    Location AS Country,
    date AS ReportedDate,
    total_cases AS CumulativeCases,
    new_cases AS NewCasesToday,
    total_deaths AS CumulativeDeaths,
    population AS TotalPopulation
FROM 
    PortfolioProject..CovidDeaths
WHERE 
    continent IS NOT NULL
ORDER BY 
    Country, ReportedDate;


--Calculating the percentage of Death due to Covid-19 in Canada

SELECT 
    Location,
    date AS ReportedDate,
    total_cases,
    total_deaths,
    (total_deaths * 100.0 / total_cases) AS DeathPercentage
FROM 
    PortfolioProject..CovidDeaths
WHERE 
    Location = 'Canada'
    AND continent IS NOT NULL 
ORDER BY 
    Location, ReportedDate;

-- Calculating the percentage of infected people by Covid-19 in Canada

SELECT 
    Location,
    date AS ReportedDate,
    Population,
    total_cases,
    (total_cases * 100.0 / Population) AS PercentPopulationInfected
FROM 
    PortfolioProject..CovidDeaths
WHERE 
    Location = 'Canada'
ORDER BY 
    Location, ReportedDate;


--Showing the highest number of deaths considering the population among all countries in the world
SELECT 
    Location,
    MAX(CAST(Total_deaths AS INT)) AS TotalDeathCount
FROM 
    PortfolioProject..CovidDeaths
WHERE 
    continent IS NOT NULL 
GROUP BY 
    Location
ORDER BY 
    TotalDeathCount DESC;


--Showing the highest number of deaths among all continents

SELECT 
    continent,
    MAX(CAST(Total_deaths AS INT)) AS TotalDeathCount
FROM 
    PortfolioProject..CovidDeaths
WHERE 
    continent IS NOT NULL 
GROUP BY 
    continent
ORDER BY 
    TotalDeathCount DESC;


--Showing the total Number of Cases, Deaths and Percentage of Deaths

SELECT 
    SUM(new_cases) AS total_cases,
    SUM(CAST(new_deaths AS INT)) AS total_deaths,
    SUM(CAST(new_deaths AS INT)) * 100.0 / SUM(new_cases) AS DeathPercentage
FROM 
    PortfolioProject..CovidDeaths
WHERE 
    continent IS NOT NULL 
--GROUP BY 
--    date
ORDER BY 
    total_cases, total_deaths;


