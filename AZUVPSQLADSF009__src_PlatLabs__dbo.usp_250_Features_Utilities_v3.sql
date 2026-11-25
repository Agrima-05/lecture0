SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

-- ================================================================================
-- Description:	Parse Features
-- ================================================================================

CREATE procedure [dbo].[usp_250_Features_Utilities_v3]

AS
BEGIN


	SET NOCOUNT ON;
		declare @SpNameLocal varchar(100) = '[' + OBJECT_NAME(@@PROCID) + ']', @SpNewIdLocal uniqueidentifier = NEWID() -- Licensing Daily Load process. Beginning of daily sp Staging DB Only uncomment (1 of 3 line).
	EXEC [src_MLS_Processing].[dbo].[90000_sp_meta_data] @StartEnd = 'Start', @SpName = @SpNameLocal, @SpNewId = @SpNewIdLocal -- Licensing Daily Load process. Beginning of daily sp Staging DB Only uncomment (2 of 3 line).


		DECLARE @currentDatetime AS DATETIME
		DELETE FROM features.UtilitiesJSON WHERE [uid] in (Select [uid] from listing.ListingsRaw_Batch with(NOLOCK))
		SET @currentDatetime = GETDATE()

		INSERT INTO features.UtilitiesJSON 
		SELECT [uid], mls_id, mls_listing_id, j.[key], j.[value] as Utilities, j.[type], @currentDatetime
		FROM [src_PlatLabs].[listing].[ListingsRaw_Batch] t1 with(NOLOCK) 
		CROSS APPLY OPENJSON(t1.Features) AS t 
		CROSS APPLY OPENJSON(t.value, '$.Utilities') AS j

			DROP TABLE IF EXISTS Table_aa
			DROP TABLE IF EXISTS Table_ab
			DROP TABLE IF EXISTS Table_ac


			Select MLSID,MLS_LISTING_ID,[Sewer] INTO Table_aa
					from [src_Platlabs].[features].[UtilitiesJSON] with(NOLOCK)
							CROSS APPLY OPENJSON([Utilities]) WITH([Sewer] varchar(1000)) as Sewer_array
						WHERE [Utilities] like '%"Sewer"%'
						and [uid] in(Select [uid] From listing.ListingsRaw_Batch WITH(NOLOCK))

			Create INDEX ix_MlsIDListingID on Table_aa(MLSID,MLS_LISTING_ID)
			create INDEX ix_MLSID on Table_aa(MLSID)

			select MLSID,MLS_LISTING_ID,Utility_array.Utilities INTO Table_ab
					from [src_Platlabs].[features].[UtilitiesJSON] a with(NOLOCK)
							CROSS APPLY OPENJSON([Utilities]) WITH([Utilities] varchar(1000)) as Utility_array
						WHERE a.[Utilities] like '%"Utilities"%'
						and [uid] in(Select [uid] From listing.ListingsRaw_Batch WITH(NOLOCK))

			Create INDEX ix_MlsIDListingID on Table_ab(MLSID,MLS_LISTING_ID)
			create INDEX ix_MLSID on Table_ab(MLSID)

			Select MLSID,MLS_LISTING_ID,[Water] INTO Table_ac
					from [src_Platlabs].[features].[UtilitiesJSON] with(NOLOCK)
							CROSS APPLY OPENJSON([Utilities]) WITH([Water] varchar(1000)) as Water_array
						WHERE [Utilities] like '%"Water"%'
						and [uid] in(Select [uid] From listing.ListingsRaw_Batch WITH(NOLOCK))

			Create INDEX ix_MlsIDListingID on Table_ac(MLSID,MLS_LISTING_ID)
			create INDEX ix_MLSID on Table_ac(MLSID)

			EXEC [src_MLS_Processing].[dbo].[90000_sp_meta_data] @StartEnd = 'End', @SpName = @SpNameLocal, @SpNewId = @SpNewIdLocal  -- Licensing Daily Load process. Ending of daily sp Staging DB Only uncomment (3 of 3 line).

END




