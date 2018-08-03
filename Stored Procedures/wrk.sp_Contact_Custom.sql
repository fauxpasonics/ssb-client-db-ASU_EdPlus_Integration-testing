SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Created By: Payton Soicher
-- Create Date: 2018-05-17
-- Reviewed By: Harry Jordheim
-- Reviewed Date: 2018-07-10
-- Description: EMPLID and ASURITEID bad update preventions
-- =============================================

/*
Revision History:

Altering the update statement due to the fact that duplicated records can make the EMPLID and ASURITEID switch
back and forth. Case statement will only allow it to be updated if it is null.


7/9/2018
Making the update to look at prodcopy.Contact to add in another layer of matching to keep ASURITEID and EMPLID the same 
*/



CREATE PROCEDURE [wrk].[sp_Contact_Custom]
AS 

TRUNCATE TABLE dbo.Contact_Custom;

MERGE INTO dbo.Contact_Custom Target
USING dbo.[Contact] source
ON source.[SSB_CRMSYSTEM_Contact_ID] = target.[SSB_CRMSYSTEM_Contact_ID__c]
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SSB_CRMSYSTEM_Contact_ID__c]) VALUES (Source.[SSB_CRMSYSTEM_Contact_ID])
WHEN NOT MATCHED BY SOURCE THEN DELETE;

EXEC dbo.sp_CRMProcess_ConcatIDs 'Contact'

DECLARE @currentmemberyear INT = (SELECT  DATEPART(YEAR,GETDATE()))

DECLARE @previousmemberyear INT = @currentmemberyear -1 


UPDATE a
SET [SSB_CRMSYSTEM_SSID_Winner__c] = b.SSID
,[a].[SSB_CRMSYSTEM_SSID_Winner_SourceSystem__c] = b.SourceSystem
,[PersonHomePhone] = b.PhoneHome
,[PersonOtherPhone] = b.PhoneOther
,[PersonEmail] = b.EmailOne
--  ==================================================================
--  4/25/2018 3:49 PM
--  Payton Soicher
--  Subject: New MDM Updates
--  ==================================================================
, a.MDM_Primary_Phone__c = b.PhonePrimary
, a.MDM_Cell_Phone__c = b.PhoneCell
, a.MDM_Home_Phone__c = b.PhoneHome
, a.MDM_Other_Phone__c = b.PhoneOther
, a.mdm_emailprimary__c = b.EmailPrimary
, a.mdm_emailone__c = b.EmailOne
, a.mdm_emailtwo__c = b.EmailTwo
, a.MDM_Business_Phone__c = b.PhoneBusiness
--, a.EMPLID__c =     CASE WHEN a.EMPLID__c IS NOT NULL THEN a.EMPLID__c ELSE b.ExtAttribute8 END -- CASE statement to prevent overwritten ID
--, a.ASURITE_ID__c = CASE WHEN a.ASURITE_ID__c IS NOT NULL THEN a.ASURITE_ID__c ELSE b.ExtAttribute9 END -- CASE statement to prevent overwritten ID
, a.EMPLID__c = CASE WHEN a.EMPLID__c IS NOT NULL AND a.EMPLID__c = c.EMPLID__c THEN a.EMPLID__c 
					 WHEN a.EMPLID__c IS NULL THEN COALESCE(c.EMPLID__c, b.ExtAttribute8) end
, a.ASURITE_ID__c = CASE WHEN a.ASURITE_ID__c IS NOT NULL AND a.ASURITE_ID__c = c.ASURITE_ID__c THEN a.ASURITE_ID__c 
					 WHEN a.ASURITE_ID__c IS NULL THEN COALESCE(c.ASURITE_ID__c, b.ExtAttribute9) end
--SELECT COUNT(*)
FROM [dbo].[Contact_Custom] a
INNER JOIN dbo.[vwCompositeRecord_ModAcctID] b ON b.[SSB_CRMSYSTEM_CONTACT_ID] = [a].[SSB_CRMSYSTEM_Contact_ID__c]
left JOIN prodcopy.vw_contact c ON c.[SSB_CRMSYSTEM_Contact_ID__c] = a.SSB_CRMSYSTEM_Contact_ID__c


EXEC  [dbo].[sp_CRMLoad_Contact_ProcessLoad_Criteria]


GO
