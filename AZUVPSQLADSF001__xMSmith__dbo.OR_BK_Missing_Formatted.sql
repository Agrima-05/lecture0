SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[OR_BK_Missing_Formatted]
AS
SELECT dbo.md_upd_assessments_MISSING.*
FROM     dbo.md_upd_assessments_MISSING
WHERE FIPS = '41019'

