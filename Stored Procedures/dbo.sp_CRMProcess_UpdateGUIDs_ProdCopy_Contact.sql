SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[sp_CRMProcess_UpdateGUIDs_ProdCopy_Contact]
as
UPDATE b
SET [b].SSB_CRMSYSTEM_Contact_ID__c = a.SSB_CRMSYSTEM_Contact_ID__c
--SELECT a.* 
FROM [dbo].[vwCRMProcess_UpdateGUIDs_ProdCopyContact] a 
INNER JOIN ProdCopy.Contact b ON a.Id = b.Id
WHERE ISNULL(b.SSB_CRMSYSTEM_Contact_ID__c,'a') <> ISNULL(a.SSB_CRMSYSTEM_Contact_ID__c,'a')



GO
