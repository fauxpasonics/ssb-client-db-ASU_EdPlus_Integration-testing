SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [dbo].[vwCRMLoad_Contact_Std_Update] AS


SELECT a.ssb_crmsystem_Contact_ID__c
, a.FirstName													-- ,c.FirstName
, a.LastName													-- ,c.LastName
, a.Suffix														-- ,c.Suffix
, a.OtherStreet												-- ,c.OtherStreet
, a.OtherCity													-- ,c.OtherCity
, a.OtherState												-- ,c.OtherState
, a.OtherPostalCode											-- ,c.OtherPostalCode
, a.OtherCountry												-- ,c.OtherCountry
--, a.Phone														-- ,c.Phone
--, a.Email														-- ,c.Email
, a.Id
, [LoadType]

--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.FirstName AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.FirstName AS VARCHAR(MAX)))),'')) 					   then 1 else 0 end as FirstName
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.LastName AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.LastName AS VARCHAR(MAX)))),'')) 						   then 1 else 0 end as LastName
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.Suffix AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Suffix AS VARCHAR(MAX)))),'')) 							   then 1 else 0 end as Suffix
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.OtherStreet AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherStreet AS VARCHAR(MAX)))),'')) 			   then 1 else 0 end as OtherStreet
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.OtherCity AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherCity AS VARCHAR(MAX)))),'')) 				   then 1 else 0 end as OtherCity
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.OtherState AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherState AS VARCHAR(MAX)))),'')) 				   then 1 else 0 end as OtherState
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.OtherPostalCode AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherPostalCode AS VARCHAR(MAX)))),'')) 	   then 1 else 0 end as OtherPostalCode
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.OtherCountry AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherCountry AS VARCHAR(MAX)))),'')) 			   then 1 else 0 end as OtherCountry
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.Phone AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Phone AS VARCHAR(MAX)))),'')) 							   then 1 else 0 end as Phone
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.Email AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Email AS VARCHAR(MAX)))),'')) 							   then 1 else 0 end as Email


--SELECT COUNT(*)
FROM [dbo].[vwCRMLoad_Contact_Std_Prep] a
LEFT JOIN prodcopy.Contact c WITH (NOLOCK) ON a.Id = c.ID
LEFT JOIN dbo.vw_KeyAccounts k ON k.ssbid = a.ssb_crmsystem_Contact_ID__c
WHERE LoadType = 'Update'
AND k.ssbid IS NULL
AND  (1=2
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.FirstName AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.FirstName AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.LastName AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.LastName AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.Suffix AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Suffix AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.OtherStreet AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherStreet AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.OtherCity AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherCity AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.OtherState AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherState AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.OtherPostalCode AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherPostalCode AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.OtherCountry AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherCountry AS VARCHAR(MAX)))),'')) 
	--OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.Phone AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Phone AS VARCHAR(MAX)))),'')) 
	--OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.Email AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Email AS VARCHAR(MAX)))),'')) 

	)



GO
