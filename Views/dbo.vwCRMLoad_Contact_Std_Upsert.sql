SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vwCRMLoad_Contact_Std_Upsert] AS
SELECT --top 1

ssb_crmsystem_Contact_ID__c, a.FirstName, a.LastName ,a.Suffix, 
 OtherStreet, OtherCity, OtherState, OtherPostalCode, OtherCountry--, a.Phone, a.Email
 , [LoadType]
FROM [dbo].[vwCRMLoad_Contact_Std_Prep] a
JOIN dbo.Contact b ON a.ssb_crmsystem_Contact_ID__c = b.ssb_crmsystem_Contact_ID
WHERE LoadType = 'Upsert'

GO
