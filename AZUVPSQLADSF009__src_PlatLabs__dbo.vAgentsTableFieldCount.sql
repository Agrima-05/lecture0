SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE view [dbo].[vAgentsTableFieldCount] 
 as
SELECT a.[mls_id]
,[mls_name]
,[code]
,SUM(CASE WHEN [uid] IS NULL THEN 0 ELSE 1 END) as [TotalAgentRecords]
,SUM(CASE WHEN [dp_member_id] IS NULL THEN 0 ELSE 1 END) as [dp_member_id]
,SUM(CASE WHEN [dp_office_id] IS NULL THEN 0 ELSE 1 END) as [dp_office_id]
,SUM(CASE WHEN [originating_system_name] IS NULL THEN 0 ELSE 1 END) as [originating_system_name]
,SUM(CASE WHEN [address] IS NULL THEN 0 ELSE 1 END) as [address]
,SUM(CASE WHEN [city] IS NULL THEN 0 ELSE 1 END) as [city]
,SUM(CASE WHEN [state] IS NULL THEN 0 ELSE 1 END) as [state]
,SUM(CASE WHEN [zip] IS NULL THEN 0 ELSE 1 END) as [zip]
,SUM(CASE WHEN [standardized_preferred_phone_number] IS NULL THEN 0 ELSE 1 END) as [standardized_preferred_phone_number]
,SUM(CASE WHEN [standardized_cellphone_number] IS NULL THEN 0 ELSE 1 END) as [standardized_cellphone_number]
,SUM(CASE WHEN [email] IS NULL THEN 0 ELSE 1 END) as [email]
,SUM(CASE WHEN [full_name] IS NULL THEN 0 ELSE 1 END) as [full_name]
,SUM(CASE WHEN [preferred_language] IS NULL THEN 0 ELSE 1 END) as [preferred_language]
,SUM(CASE WHEN [license_number] IS NULL THEN 0 ELSE 1 END) as [license_number]
,SUM(CASE WHEN [license_state] IS NULL THEN 0 ELSE 1 END) as [license_state]
,SUM(CASE WHEN [status] IS NULL THEN 0 ELSE 1 END) as [status]
,SUM(CASE WHEN [type] IS NULL THEN 0 ELSE 1 END) as [type]
,SUM(CASE WHEN [website] IS NULL THEN 0 ELSE 1 END) as [website]
  FROM [agent].[Platlabs_agents] a join dbo.platlabs_update_config b on a.mls_id = b.mls_id
  WHERE b.active = '1' and code like '%_39'
GROUP BY a.[mls_id],[mls_name],[code]




