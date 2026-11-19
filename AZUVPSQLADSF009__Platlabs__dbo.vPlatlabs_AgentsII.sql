SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vPlatlabs_AgentsII]
AS
			Select Distinct mls_id as SrcMLSID
			,agent_id as SrcMLSAgentID
			,case when agent_FirstName is NULL THEN CASE WHEN ltrim(rtrim([agent_ListAgentFullName])) Like '% %' THEN Global.dbo.Before1stCharacter([agent_ListAgentFullName],' ') ELSE NULL END ELSE agent_FirstName END as FirstName
			,CASE WHEN agent_ListAgentFullName LIKE '% [A-Z] %' THEN Global.dbo.AfterLastCharacter(Global.dbo.BeforeLastCharacter([agent_ListAgentFullName],' '),' ') ELSE NULL END as MiddleInitial
			,case when agent_LastName is NULL THEN CASE WHEN ltrim(rtrim([agent_ListAgentFullName])) Like '% %' THEN Global.dbo.AfterLastCharacter([agent_ListAgentFullName],' ') ELSE NULL END ELSE agent_LastName END as LastName
			,agent_Email as Email
			,agent_Phone as Phone1
			,CASE WHEN agent_Phone is not null then 'Prefered' Else NULL END as PhoneType1
			,1 as IsActive
			,agent_LicenseNumber as LicenseNumber
			,GETDATE() as DateCreated
			,agent_uid as Platlabs_uid
			,mls_id as Platlabs_mls_id
			,office_id as SrcMLSOfficeID
			,GetDate() as LoadDate
			from src_Platlabs.agent.ListAgents with(NOLOCK)
			WHERE mls_id in(Select mls_id from src_PlatLabs.dbo.platlabs_update_config with(NOLOCK) where (active = '1' and code like '%39'))




