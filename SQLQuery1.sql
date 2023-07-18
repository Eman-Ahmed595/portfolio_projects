select *
from [portoflio project]..[deaths ]
where continent is not null
order by 3,4

--select * 
--from [portoflio project]..[Sheet2$]
--order by 3,4
--select data that we are going to be using 

select location,date,total_cases,new_cases,total_deaths,population
from [portoflio project]..[deaths ]
where continent is not null
order by 1,2

--looking at total_cases vs total deaths in united states

select location, date, total_deaths, total_cases,(total_deaths/total_cases)*100 as death_percentage
from [portoflio project]..[deaths ]
where location like '%states%'
and  continent is not null
order by 1,2

--looking at total_cases vs population
--shows what percentage of population got covid

select location, date, population, total_cases,(total_cases/population)*100 as percent_population_infected
from [portoflio project]..[deaths ]
--where location like '%states%'
where continent is not null
order by 1,2

--looking at countries with highest infection rate compared to population
select location,population,max(total_cases)as highestinfection,max(total_cases/population)*100 as percent_population_infected
from [portoflio project]..[deaths ]
--where location like '%states%'
where continent is not null
group by location,population 
order by percent_population_infected desc

--showing countries with highest death count per population

select location,max(cast (total_deaths as int))as totaldeathcount
from [portoflio project]..[deaths ]
--where location like '%states%'
where continent is not null
group by location 
order by totaldeathcount desc

--let’s break things down by continent
--showing continent with highest death count per population 
select continent,max(cast (total_deaths as int))as totaldeathcount
from [portoflio project]..[deaths ]
--where location like '%states%'
where continent is not null
group by continent 
order by totaldeathcount desc


--global numbers

select date,sum(cast(new_cases as int)),sum(cast(new_deaths as int))

from [portoflio project]..[deaths ]
--where location like '%states%'
where continent is not null
group by date
order by 1,2

 --looking at total population vs vaccination

 select dea.continent,dea.location ,dea.date,dea.population,vac.new_vaccinations
 from [portoflio project]..[deaths ] dea
 join [portoflio project]..[Sheet2$] vac
 on dea.location = vac.location
 and dea.date = vac.date
 where dea.continent is not null
 order by 2,3


 
