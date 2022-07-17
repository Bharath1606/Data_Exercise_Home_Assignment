-- Select GEO_NAME, sum(Aboriginal_identity),substring(ALT_GEO_CODE,1,2)
-- From Data_Exercise.dataset1
-- Group by 1

Select substring(CAST(ALT_GEO_CODE as NCHAR),1,2), sum(Aboriginal_identity),sum(Non_Aboriginal_identity)
From Data_Exercise.dataset1
Group by 1