SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




CREATE VIEW [dbo].[vListingAggregateValues]
AS
	SELECT
		lc.Listing_ID
		,MAX(CASE WHEN RowNumByValueAsc = 1 THEN Value END) AS Min_MLS_LIST_PRICE_STD
		,MAX(CASE WHEN RowNumByValueAsc = 1 THEN ValueDate END) AS Min_MLS_LIST_PRICE_STD_Date

		,MAX(CASE WHEN RowNumByValueDesc = 1 THEN Value END) AS Max_MLS_LIST_PRICE_STD
		,MAX(CASE WHEN RowNumByValueDesc = 1 THEN ValueDate END) AS Max_MLS_LIST_PRICE_STD_Date
	FROM (
		SELECT
			*
			,ROW_NUMBER() OVER (PARTITION BY Listing_ID ORDER BY CASE WHEN ISNUMERIC(Value) = 1 THEN CONVERT(NUMERIC(20, 2), Value) END, Value, ValueDate) AS RowNumByValueAsc
			,ROW_NUMBER() OVER (PARTITION BY Listing_ID ORDER BY CASE WHEN ISNUMERIC(Value) = 1 THEN CONVERT(NUMERIC(20, 2), Value) END DESC, Value DESC, ValueDate) AS RowNumByValueDesc
		FROM (
			SELECT
				lc.Listing_ID
				,FieldId
				,Value
				,Original_UPDATE_FLAG_DATE_STD as ValueDate
			FROM fulfillment_Listing.dbo.ListingChange lc WITH (NOLOCK) inner join fulfillment_Listing.dbo.ListingHistory lh on lh.Listing_ID=lc.Listing_ID and lh.UpdateSeq=lc.UpdateSeq
			WHERE FieldId = 2
			UNION ALL
			SELECT
				l.Listing_ID
				,2
				,MLS_LIST_PRICE_STD
				,ISNULL(MaxChangeDate, lh.Original_UPDATE_FLAG_DATE_STD)
			FROM fulfillment_Listing.dbo.Listing l WITH (NOLOCK) inner join fulfillment_Listing.dbo.ListingHistory lh on lh.Listing_ID=l.Listing_ID and lh.UpdateSeq=1
			OUTER APPLY (
				SELECT MAX(Original_UPDATE_FLAG_DATE_STD) AS MaxChangeDate
				FROM fulfillment_Listing.dbo.ListingChange lc WITH (NOLOCK) inner join fulfillment_Listing.dbo.ListingHistory lh on lh.Listing_ID=lc.Listing_ID and lh.UpdateSeq=lc.UpdateSeq
				WHERE lc.Listing_ID = l.Listing_ID AND lc.FieldId = 2
			) lc
		) lc
	) lc
	WHERE lc.RowNumByValueAsc = 1 OR lc.RowNumByValueDesc = 1
	GROUP BY lc.Listing_ID




