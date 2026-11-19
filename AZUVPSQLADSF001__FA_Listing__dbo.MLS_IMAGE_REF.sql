SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW dbo.MLS_IMAGE_REF
AS
	SELECT
		ROWID,
		Property_ID,
		Image_Name,
		FILE_Date,
		Import_Date,
		Volume,
		Server_ID,
		Image_Path,
		Validation,
		Image_Listing_date,
		Image_Sequence,
		Image_Size
	FROM FAMLS_NORM.dbo.MLS_IMAGE_REF

