SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[vParcel_Regrid]
AS
SELECT d.FIPS
,p.PropertyID
,CASE WHEN FormattedAPN is NULL THEN PARCELAPN ELSE FormattedAPN END as FormattedAPN
,SitusStdFullStreetAddress
,SitusStdHouseNbr
,SitusStdHouseNbrSuffix
,SitusStdDirectionLeft
,SitusStdStreet
,SitusStdMode
,SitusStdDirectionRight
,SitusStdUnitType
,SitusStdUnitNbr
,SitusStdCity
,SitusStdState
,SitusStdZIP5
,SitusStdZIP4
,SitusStdCarrierCode
,CASE WHEN FALatitude is NULL THEN d.Latitude ELSE FALatitude END as FALatitude
,CASE WHEN FALongitude is NULL THEN d.Longitude ELSE FALongitude END as FALongitude
,d.FAGeoStatusCode
,d.GeomWKT as Geom
,d.FATimestamp
,P.StdLandUseCode
,d.ParcelGeometry4269 as GeomSpatial

------Added 20200529 per BR for Convex Labs
,D.[UCIDFlag] as FAUCIDFlag
,D.[FAMasterId]  as FAPropertyBoundaryID

-----Added 20210127 per JE
,P.FARooftopLatitude
,P.FARooftopLongitude
,P.OldAPN
,P.OldApnIndicator
,P.TaxAccountNumber
,P.APNSeqNbr

----Added 20210503
,P.DTDB_REF_ID
,P.DTDB_FORMATTED_APN
,P.DTDB_UNFORMATTED_APN 

----Added 20210604
,P.LotsizeAcres

-----Added 20220721 for Costar
,P.CS_FORMATTED_APN
,P.CS_UNFORMATTED_APN

---Added 20230428
,P.PropertyClassID

FROM [Boundaries].dbo.[vParcelBoundaryAll_Regrid]  d LEFT OUTER JOIN [Data].[dbo].[Property] p with(nolock)
  ON p.Fips = d.Fips and p.PropertyId = d.PropertyId 
--  WHERE d.FIPS not in('37051','37063','37077','37101','37135','37161','37193','37171','37143','37031')

--UNION ALL

--SELECT d.FIPS
--,p.PropertyID
--,CASE WHEN FormattedAPN is NULL THEN PARCELAPN ELSE FormattedAPN END as FormattedAPN
--,SitusStdFullStreetAddress
--,SitusStdHouseNbr
--,SitusStdHouseNbrSuffix
--,SitusStdDirectionLeft
--,SitusStdStreet
--,SitusStdMode
--,SitusStdDirectionRight
--,SitusStdUnitType
--,SitusStdUnitNbr
--,SitusStdCity
--,SitusStdState
--,SitusStdZIP5
--,SitusStdZIP4
--,SitusStdCarrierCode
--,CASE WHEN FALatitude is NULL THEN d.Latitude ELSE FALatitude END as FALatitude
--,CASE WHEN FALongitude is NULL THEN d.Longitude ELSE FALongitude END as FALongitude
--,d.FAGeoStatusCode
--,d.GeomWKT as Geom
--,d.FATimestamp
--,P.StdLandUseCode
--,d.ParcelGeometry4269 as GeomSpatial

--------Added 20200529 per BR for Convex Labs
--,D.[UCIDFlag] as FAUCIDFlag
--,D.[FADigitalMapMasterId]  as FAPropertyBoundaryID

-------Added 20210127 per JE
--,P.FARooftopLatitude
--,P.FARooftopLongitude
--,P.OldAPN
--,P.OldApnIndicator
--,P.TaxAccountNumber
--,P.APNSeqNbr
------Added 20210503
--,P.DTDB_REF_ID
--,P.DTDB_FORMATTED_APN
--,P.DTDB_UNFORMATTED_APN 

------Added 20210604
--,P.LotsizeAcres

-------Added 20220721 for Costar
--,P.CS_FORMATTED_APN
--,P.CS_UNFORMATTED_APN

-----Added 20230428
--,P.PropertyClassID

--FROM [Boundaries].[dbo].[FASpot]  d LEFT OUTER JOIN [Data].[dbo].[Property] p with(nolock)
--  ON p.Fips = d.Fips and p.PropertyId = d.PropertyId 
--  WHERE d.FIPS in('37051','37063','37077','37101','37135','37161','37193','37171','37143','37031')





GRANT SELECT ON [dbo].[vParcel_Regrid] TO [CORP\cbrady] AS [dbo]
