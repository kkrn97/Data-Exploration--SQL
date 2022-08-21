  SELECT *
  FROM portfolio_project.covid_deaths
  Where location ='india'
  ORDER BY 3,4;
  
  
SELECT *
FROM portfolio_project.covid_vaccine
ORDER BY 3,4;

-- Selecting the data we are going to use
  SELECT location, date, total_cases, new_cases, total_deaths, population
  FROM portfolio_project.covid_deaths
  ORDER BY 1, 2;
  
  -- Looking at total death vs total cases
  --show likelyhood of dying in your country if you contracted covid.
  
SELECT location, date, total_cases, new_cases, (total_deaths/total_cases)*100 as death_percentage
FROM portfolio_project.covid_deaths
WHERE location like '%india%'
order by 1, 2

--looking at total cases vs population.
SELECT location, date, total_cases, new_cases, (total_deaths/population)*100 as percentage_population_infected
FROM portfolio_project.covid_deaths
WHERE location like '%india%'
order by 1, 2;

-- Looking at countries with highest infection rate compared to population.
SELECT location, (total_deaths/total_cases)*100 as percentage_population_infected, Max(total_cases) as highest_infection_count, population
FROM portfolio_project.covid_deaths
WHERE location like '%india%'
order by percent_population_infected DESc;

-- howing countries with highest death count per population.

SELECT location, date, Max(total_deaths)as total_death_count 
FROM portfolio_project.covid_deaths
WHERE location like '%india%'
order by 'total_death_count';

 -- howing continents with highest death count per population,

SELECT continent, MAX(total_deaths) as total_death_count
FROM portfolio_project.covid_deaths
WHERE continent is not null
GROUP BY continent
ORDER BY total_death_count DESC;

 -- GLOBAL NUMBERS.
SELECT date, MAX(total_cases), total_deaths, (total_death/total_cases)*100 as death_percentage 
FROM portfolio_project.covid_deaths
WHERE continent is not null
GROUP BY continent
ORDER BY total_death_count DESC;

-- looking at total population vs to total vaccination.
SELECT de.continent, de.location, de.population, de.date, va.new_vaccinations
FROM portfolio_project.covid_deaths as de
JOIN portfolio_project.covid_vaccine as va
 ON de.location = va.location
and de.date = va.date



 