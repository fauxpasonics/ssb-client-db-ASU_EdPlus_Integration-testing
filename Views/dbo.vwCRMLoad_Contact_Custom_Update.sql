SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vwCRMLoad_Contact_Custom_Update]
AS
SELECT  
--b.ssb_crmsystem_Contact_ID,
	 z.[crm_id] Id
	, b.[SSB_CRMSYSTEM_Contact_ID__c] 												 --,aa.[SSB_CRMSYSTEM_Contact_ID__c]
	, b.[SSB_CRMSYSTEM_SSID_Winner__c] 												 --,aa.[SSB_CRMSYSTEM_SSID_Winner__c]
	, b.[SSB_CRMSYSTEM_SSID_Winner_SourceSystem__c] 								 --,aa.[SSB_CRMSYSTEM_SSID_Winner_SourceSystem__c]
	--, b.[SSB_CRMSYSTEM_DimCustomerID__c] 											 --,aa.[SSB_CRMSYSTEM_DimCustomerID__c]
	, b.[CRMProcess_UpdatedDate]													 --,aa.[CRMProcess_UpdatedDate]
	, b.mdm_primary_phone__c														 --,aa.mdm_primary_phone__c
	, b.mdm_cell_phone__c															 --,aa.mdm_phone_cell__c
	, b.mdm_home_phone__c															 --,aa.mdm_home_phone__c
	, b.mdm_other_phone__c															 --,aa.mdm_other_phone__c
	, b.mdm_emailprimary__c															 --,aa.mdm_emailprimary__c
	, b.mdm_emailone__c																 --,aa.mdm_emailone__c
	, b.mdm_emailtwo__c																 --,aa.mdm_emailtwo__c
	, b.Emplid__c																	 --,aa.Emplid__c
	, b.Asurite_ID__c																	 --,aa.Asurite_ID__c
	, b.MDM_Business_Phone__c														   --, aa.MDM_Business_Phone__c

FROM dbo.[vwCRMLoad_Contact_Std_Prep] a
INNER JOIN dbo.Contact_Custom b ON [a].[ssb_crmsystem_Contact_ID__c] = b.ssb_crmsystem_Contact_ID__c
INNER JOIN dbo.Contact z ON a.[ssb_crmsystem_Contact_ID__c] = z.ssb_crmsystem_Contact_ID
LEFT JOIN prodcopy.contact AA ON z.crm_ID = aa.ID
LEFT JOIN prodcopy.RecordType rt ON aa.RecordTypeId = rt.Id
LEFT JOIN dbo.vw_KeyAccounts k ON k.ssbid = a.ssb_crmsystem_Contact_ID__c
WHERE z.[SSB_CRMSYSTEM_Contact_ID] <> z.[crm_id]
AND k.ssbid IS NULL
AND (1=2
	OR ISNULL(b.SSB_CRMSYSTEM_SSID_Winner__c,'') != ISNULL(aa.ssb_crmsystem_ssid_winner__c,'')
	OR ISNULL(b.[SSB_CRMSYSTEM_SSID_Winner_SourceSystem__c],'') != ISNULL(aa.[SSB_CRMSYSTEM_SSID_Winner_SourceSystem__c],'')
	--OR ISNULL(b.[SSB_CRMSYSTEM_DimCustomerID__c],'') != ISNULL(aa.[SSB_CRMSYSTEM_DimCustomerID__c],'')
	OR ISNULL(b.mdm_primary_phone__c,'') != ISNULL(aa.mdm_primary_phone__c,'')
	OR ISNULL(b.mdm_cell_phone__c,'') != ISNULL(aa.mdm_cell_phone__c,'')
	OR ISNULL(b.mdm_home_phone__c,'') != ISNULL(aa.mdm_home_phone__c,'')
	OR ISNULL(b.mdm_other_phone__c,'') != ISNULL(aa.mdm_other_phone__c,'')
	OR ISNULL(b.mdm_emailprimary__c,'') != ISNULL(aa.mdm_emailprimary__c,'')
	OR ISNULL(b.mdm_emailone__c,'') != ISNULL(aa.mdm_emailone__c,'')
	OR ISNULL(b.mdm_emailtwo__c,'') != ISNULL(aa.mdm_emailtwo__c,'')
	OR ISNULL(b.Emplid__c,'') != ISNULL(aa.Emplid__c,'')
	OR ISNULL(b.Asurite_ID__c,'') != ISNULL(aa.Asurite_ID__c,'')
	OR ISNULL(b.MDM_Business_Phone__c,'') != ISNULL(aa.MDM_Business_Phone__c,'')

	

)

GO
