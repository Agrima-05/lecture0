SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE VIEW [dbo].[vBuildingPermit_LinkerFile]
AS


SELECT [FIPS]
      ,[FAPROPERTYID]
      ,[PERMIT_NUMBER]
  FROM [Data].[dbo].[vBuildingPermit] with(NOLOCK)

  Group by  [FIPS],[FAPROPERTYID],[PERMIT_NUMBER]
  



