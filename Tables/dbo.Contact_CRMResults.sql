CREATE TABLE [dbo].[Contact_CRMResults]
(
[LoadType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_Contact_ID__c] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalesForceId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RowResult] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorCode] [int] NULL,
[ErrorColumn] [int] NULL,
[ErrorDescription] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ResultDateTime] [datetime] NULL CONSTRAINT [DF__Account_C__Resul__51300E55] DEFAULT (getdate()),
[RecordTypeId] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingStreet] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingCity] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingState] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingPostalCode] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingCountry] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
