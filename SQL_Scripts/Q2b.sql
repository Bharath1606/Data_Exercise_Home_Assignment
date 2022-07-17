-- East region: BC (59), Alberta (48), Saskatchewan (47), Manitoba (46)

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

-- ############# TOTAL INCOME STATISTICS ############


 SELECT dim_Income_statistics, sum(mid_Income_statistics) as r1_avg_income 
 	FROM region1 
 	WHERE dim_Income_statistics like "Average total income ($)"
 	GROUP BY dim_Income_statistics;

 SELECT dim_Income_statistics, sum(mid_Income_statistics) as r2_avg_income 
 	FROM region2
 	WHERE dim_Income_statistics like "Average total income ($)"
 	GROUP BY dim_Income_statistics;

 SELECT dim_Income_statistics, sum(mid_Income_statistics) as r3_avg_income 
 	FROM region3
 	WHERE dim_Income_statistics like "Average total income ($)"
 	GROUP BY dim_Income_statistics;

SELECT dim_Income_statistics, sum(mid_Income_statistics) as r4_avg_income 
	FROM region4
	WHERE dim_Income_statistics like "Average total income ($)"
	GROUP BY dim_Income_statistics