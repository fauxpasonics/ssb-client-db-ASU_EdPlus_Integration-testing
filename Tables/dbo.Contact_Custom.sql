CREATE TABLE [dbo].[Contact_Custom]
(
[SSB_CRMSYSTEM_Contact_ID__c] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SSB_CRMSYSTEM_SSID_Winner__c] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_SSID_Winner_SourceSystem__c] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_SSID_TIX__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_DimCustomerID__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountId] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRMProcess_UpdatedDate] [datetime] NULL,
[PersonOtherPhone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonEmail] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonHomePhone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mdm_emailprimary__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mdm_emailone__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mdm_emailtwo__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMPLID__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASURITE_ID__c] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MDM_Primary_Phone__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MDM_Cell_Phone__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MDM_Home_Phone__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MDM_Other_Phone__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MDM_Business_Phone__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [dbo].[Contact_Custom] ADD CONSTRAINT [PK_Contact_Custom] PRIMARY KEY CLUSTERED  ([SSB_CRMSYSTEM_Contact_ID__c])
GO
