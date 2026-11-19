SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE VIEW [catalog].[alwayson_replicas] 
AS
SELECT		[server_name],
			[state]
FROM		[internal].[alwayson_support_state]

GRANT SELECT ON [catalog].[alwayson_replicas] TO [public] AS [dbo]
