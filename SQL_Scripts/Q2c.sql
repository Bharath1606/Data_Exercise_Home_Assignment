WITH region1 AS (
SELECT *
FROM Data_Exercise.dataset1
WHERE (
	  ALT_GEO_CODE LIKE '%59' OR ALT_GEO_CODE LIKE '59%'
	  OR ALT_GEO_CODE LIKE '%48' OR ALT_GEO_CODE LIKE '48%'	
      OR ALT_GEO_CODE LIKE '%47' OR ALT_GEO_CODE LIKE '47%'	
      OR ALT_GEO_CODE LIKE '%46' OR ALT_GEO_CODE LIKE '46%'
      ) 
	  AND
	  ( 
		RIGHT(ALT_GEO_CODE, 2) != 35 OR RIGHT(ALT_GEO_CODE, 2) != 24 OR
		RIGHT(ALT_GEO_CODE, 2) != 13 OR RIGHT(ALT_GEO_CODE, 2) != 11 OR
        RIGHT(ALT_GEO_CODE, 2) != 12 OR RIGHT(ALT_GEO_CODE, 2) != 10 OR
        RIGHT(ALT_GEO_CODE, 2) != 60 OR RIGHT(ALT_GEO_CODE, 2) != 61 OR RIGHT(ALT_GEO_CODE, 2) != 62 
	  )
 ),
 
--  Region2 (Central Canada): Ontario (35), Quebec (24) 
region2 AS  (
	SELECT *
	FROM Data_Exercise.dataset1
	WHERE (
		  ALT_GEO_CODE LIKE '%35' OR ALT_GEO_CODE LIKE '35%'
		  OR ALT_GEO_CODE LIKE '%24' OR ALT_GEO_CODE LIKE '24%'	
		  ) 
		  AND
		  (
			RIGHT(ALT_GEO_CODE, 2) != 46 OR RIGHT(ALT_GEO_CODE, 2) != 47 OR
			RIGHT(ALT_GEO_CODE, 2) != 48  OR RIGHT(ALT_GEO_CODE, 2) != 59 OR 
			RIGHT(ALT_GEO_CODE, 2) != 12 OR RIGHT(ALT_GEO_CODE, 2) != 11 OR
			RIGHT(ALT_GEO_CODE, 2) != 10  OR RIGHT(ALT_GEO_CODE, 2) != 13 OR
			RIGHT(ALT_GEO_CODE, 2) != 60 OR RIGHT(ALT_GEO_CODE, 2) != 61 OR RIGHT(ALT_GEO_CODE, 2) != 62 
		   )
           
),
--  Region 3(Atlantic Canada) New Brunswick (13), Prince Edwards Island(11), NovoScotia (12) Newfoundland and Labrador(10)
 region3 AS (
	SELECT *
	FROM Data_Exercise.dataset1
	WHERE (
		  ALT_GEO_CODE LIKE '%10' OR ALT_GEO_CODE LIKE '10%'
		  OR ALT_GEO_CODE LIKE '%11' OR ALT_GEO_CODE LIKE '11%'	
		  OR ALT_GEO_CODE LIKE '%12' OR ALT_GEO_CODE LIKE '12%'	
		  OR ALT_GEO_CODE LIKE '%13' OR ALT_GEO_CODE LIKE '13%'
		  ) 
		  AND
		  ( 
			RIGHT(ALT_GEO_CODE, 2) != 35 OR RIGHT(ALT_GEO_CODE, 2) != 24 OR
			RIGHT(ALT_GEO_CODE, 2) != 46 OR RIGHT(ALT_GEO_CODE, 2) != 47 OR
			RIGHT(ALT_GEO_CODE, 2) != 59 OR RIGHT(ALT_GEO_CODE, 2) != 49 OR
			RIGHT(ALT_GEO_CODE, 2) != 60 OR RIGHT(ALT_GEO_CODE, 2) != 61 OR RIGHT(ALT_GEO_CODE, 2) != 62 
		  )

 ),
-- Region 4 (Northern Canada) Yukon(60), NorthWestTerritories(61), Nunavut (62)
region4 AS (
	SELECT *
	FROM Data_Exercise.dataset1
	WHERE (
		  ALT_GEO_CODE LIKE '%60' OR ALT_GEO_CODE LIKE '60%'
		  OR ALT_GEO_CODE LIKE '%61' OR ALT_GEO_CODE LIKE '61%'	
		  OR ALT_GEO_CODE LIKE '%62' OR ALT_GEO_CODE LIKE '62%'	
		  ) 
		  AND
		  ( 
			RIGHT(ALT_GEO_CODE, 2) != 35 OR RIGHT(ALT_GEO_CODE, 2) != 24 OR
			RIGHT(ALT_GEO_CODE, 2) != 13 OR RIGHT(ALT_GEO_CODE, 2) != 11 OR
			RIGHT(ALT_GEO_CODE, 2) != 12 OR RIGHT(ALT_GEO_CODE, 2) != 10 OR RIGHT(ALT_GEO_CODE, 2) != 48 OR
			RIGHT(ALT_GEO_CODE, 2) !=59 OR RIGHT(ALT_GEO_CODE, 2) != 46 OR RIGHT(ALT_GEO_CODE, 2) != 47 
		  )
)

-- ############# Proportion of male vs. female population by “Aboriginal Identity” and “Non-Aboriginal Identity ############

select Sex,count(*), sum(Aboriginal_identity) as region1_AO,sum(Non_Aboriginal_identity) as region1_Non_AO
From region1
where sex in ("Male" ,"Female")
Group by Sex; 

select Sex,count(*), sum(Aboriginal_identity) as region2_AO,sum(Non_Aboriginal_identity) as region2_Non_AO
From region2
where sex in ("Male" ,"Female")
Group by Sex;
 
select Sex,count(*), sum(Aboriginal_identity) as region3_AO,sum(Non_Aboriginal_identity) as region3_Non_AO
From region3
where sex in ("Male" ,"Female")
Group by Sex;

select Sex,count(*), sum(Aboriginal_identity) as region4_AO,sum(Non_Aboriginal_identity) as region4_Non_AO
From region4
where sex in ("Male" ,"Female")
Group by Sex;