SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/****** Script for SelectTopNRows command from SSMS  ******/

CREATE view [dbo].[vlkLandUse]
as 
SELECT
		[BKFSCode] as Code
      ,[CodeDesc] as Description
    
  FROM [Global].[dbo].[lkup_STD_LUSE]

