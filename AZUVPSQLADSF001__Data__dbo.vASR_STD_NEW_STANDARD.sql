SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON






CREATE VIEW [dbo].[vASR_STD_NEW_STANDARD]
AS
SELECT      


A.[FIPS] as [Fips]
,A.[FAPropertyId] as [PropertyID]
,A.[APN] as [APN]
,NULL as [APNSeqNbr]
,NULL as [OldAPN]
,A.[TaxAccountNbr] as [TaxAccountNumber]
,B.[SitusSTDFullStreetAddress] as [SitusFullStreetAddress]
,A.[SitusStdHouseNbr] as [SitusHouseNbr]
,A.[SitusStdHouseNbrSuffix] as [SitusHouseNbrSuffix]
,A.[SitusStdDirectionLeft] as [SitusDirectionLeft]
,A.[SitusStdStreet] as [SitusStreet]
,A.[SitusStdMode] as [SitusMode]
,A.[SitusStdDirectionRight] as [SitusDirectionRight]
,A.[SitusStdUnitType] as [SitusUnitType]
,A.[SitusStdUnitNbr] as [SitusUnitNbr]
,A.[SitusStdCity] as [SitusCity]
,A.[SitusStdState] as [SitusState]
,A.[SitusStdZIP5] as [SitusZIP5]
,A.[SitusStdZIP4] as [SitusZIP4]
,A.[SitusStdCarrierCode] as [SitusCarrierCode]
,A.[TransactionId] as [FATransactionID]
,A.[DocNbrSrce] as [DocumentNbr]
,A.[BookSrce] as [RecordingBook]
,A.[PageSrce] as [RecordingPage]
,A.[RecordingDt] as [RecordingDate]
,A.[EffectiveDt] as [ContractDate]
,A.[DocumentType] as [DocumentType]
,left((Replace(Replace(Replace(Replace(case when charindex('a sin',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a sin',[BorrowerFullName])-1)) when charindex('a marri',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a marri',[BorrowerFullName])-1)) when charindex('as Hu',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as hu',[BorrowerFullName])-1)) when charindex('Husband and wife',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('husband and wife',[BorrowerFullName])-1)) when charindex('wife and husband',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('wife and husband',[BorrowerFullName])-1)) when charindex('an unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('an unmar',[BorrowerFullName])-1)) when charindex('as unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as unmar',[BorrowerFullName])-1)) when charindex('unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('unmar',[BorrowerFullName])-1)) when charindex('marr',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('marr',[BorrowerFullName])-1)) else [BorrowerFullName] end,',', ' '),';',' '),'.',' '),' ', ' ')),60) as BorrowerFullName
,left((Replace(Replace((case when charindex(':',assignee) >0 then Substring([Assignee],1,(Charindex(':',[Assignee])-1)) when charindex(';',assignee) >0 then Substring([Assignee],1,(Charindex(';',[Assignee])-1)) when charindex(',',assignee) >0 then Substring([Assignee],1,(Charindex(',',[Assignee])-1)) else assignee end),',',' '),'.','')),60) as NewLenderName
,left((Replace(Replace((case when charindex(':',[AssignorName]) >0 then Substring([AssignorName],1,(Charindex(':',[AssignorName])-1)) when charindex(';',[AssignorName]) >0 then Substring([AssignorName],1,(Charindex(';',[AssignorName])-1)) when charindex(',',[AssignorName]) >0 then Substring([AssignorName],1,(Charindex(',',[AssignorName])-1)) else [AssignorName] end),',',' '),'.','')),60) as OriginalLenderName

,A.[OrigDeedRecordingDt] as [OriginalMortgageDate]
,A.[OrigDeedDocNbr] as [OriginalDocumentNbr]
,A.[OrigDeedBook] as [OriginalBook]
,A.[OrigDeedPage] as [OriginalPage]
,A.[OrigLoanAmt] as [OriginalLoanAmt]
,case when FADeedid is null then FASamID else FADeedID end as [OriginalFATransactionID]
,A.[FATimestamp] as [FATimeStamp]
,A.[FAUCIDFlag] as [FARecordType]

-------20190411 - Added per JE--
,B.StdLandUseCode as StdLandUseCode

------20200228 - Added for Ygrene
,A.[CMTID]
,A.[CMTIDInstNbr]  
,A.[OrigLoanCMTID]
,A.[OrigLoanCMTIDInstNbr]
----20201117---
,B.PropertyClassID

----20241216---Added for Costar-
,B.CS_FORMATTED_APN
,B.DTDB_FORMATTED_APN
,B.CS_UNFORMATTED_APN
,B.DTDB_UNFORMATTED_APN
--For Xome 20260910
,case when A.FIPS = '24003' then Coalesce(B.FormattedAPN,case when right(left(A.APN,2) ,1) like '-' then '0' + A.APN else A.APN end) else A.APN end as PropAPN
 



FROM            ASSIGNMENT  as A with(NOLOCK)
--left outer join data.dbo.Property as B with(NOLOCK) on A.FIPS = B.FIPS and A.FAPropertyID = B.PropertyID
left outer join data.dbo.Property as B with(NOLOCK) on A.FAPropertyID = B.PropertyID --Giang 20210917 - To avoid query plan from using Property.idx_Fips_inc_XXX index that cases 12103 to take 12 hours to run
--Removed 20200130 we have no future dates on the RecordingDt field
Where RecordingDt is not null --and RecordingDt <= convert(varchar(8),GetDate(),112)

UNION ALL
/*-------------------------------------------------------------------------------------*/ 

SELECT 

A.[FIPS] as [Fips]
,A.[FAPropertyId] as [PropertyID]
,A.[APN] as [APN]
,NULL as [APNSeqNbr]
,NULL as [OldAPN]
,A.[TaxAccountNbr] as [TaxAccountNumber]
,B.[SitusSTDFullStreetAddress] as [SitusFullStreetAddress]
,A.[SitusHouseNbr] as [SitusHouseNbr]
,A.[SitusHouseNbrSuffix] as [SitusHouseNbrSuffix]
,A.[SitusDirectionLeft] as [SitusDirectionLeft]
,A.[SitusStreet] as [SitusStreet]
,A.[SitusMode] as [SitusMode]
,A.[SitusDirectionRight] as [SitusDirectionRight]
,A.[SitusUnitType] as [SitusUnitType]
,A.[SitusUnitNbr] as [SitusUnitNbr]
,A.[SitusCity] as [SitusCity]
,A.[SitusState] as [SitusState]
,A.[SitusZIP5] as [SitusZIP5]
,A.[SitusZIP4] as [SitusZIP4]
,A.[SitusCarrierCode] as [SitusCarrierCode]
,A.[TransactionId] as [FATransactionID]
,A.[DocNbrSrce] as [DocumentNbr]
,A.[BookSrce] as [RecordingBook]
,A.[PageSrce] as [RecordingPage]
,A.[RecordingDt] as [RecordingDate]
,A.[EffectiveDt] as [ContractDate]
,A.[DocumentType] as [DocumentType]
,left((Replace(Replace(Replace(Replace(case when charindex('a sin',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a sin',[BorrowerFullName])-1)) when charindex('a marri',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a marri',[BorrowerFullName])-1)) when charindex('as Hu',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as hu',[BorrowerFullName])-1)) when charindex('Husband and wife',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('husband and wife',[BorrowerFullName])-1)) when charindex('wife and husband',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('wife and husband',[BorrowerFullName])-1)) when charindex('an unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('an unmar',[BorrowerFullName])-1)) when charindex('as unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as unmar',[BorrowerFullName])-1)) when charindex('unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('unmar',[BorrowerFullName])-1)) when charindex('marr',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('marr',[BorrowerFullName])-1)) else [BorrowerFullName] end,',', ' '),';',' '),'.',' '),' ', ' ')),60) as BorrowerFullName
,NULL as NewLenderName
,Replace(Replace([OrigLenderBen],',',''),'.','') as OriginalLenderName

,A.[OrigDeedRecordingDt] as [OriginalMortgageDate]
,A.[OrigDeedDocNbr] as [OriginalDocumentNbr]
,A.[OrigDeedBook] as [OriginalBook]
,A.[OrigDeedPage] as [OriginalPage]
,A.[OrigLoanAmt] as [OriginalLoanAmt]
,case when FADeedid is null then FASamID else FADeedID end as [OriginalFATransactionID]
,A.[FATimestamp] as [FATimeStamp]
,A.[FAUCIDFlag] as [FARecordType]

-------20190411 - Added per JE--
,B.StdLandUseCode as StdLandUseCode

------20200228 - Added for Ygrene
,A.[CMTID]
,A.[CMTIDInstNbr]  
,A.[OrigLoanCMTID]
,A.[OrigLoanCMTIDInstNbr]
----20201117---
,B.PropertyClassID

----20241216---Added for Costar-
,B.CS_FORMATTED_APN
,B.DTDB_FORMATTED_APN
,B.CS_UNFORMATTED_APN
,B.DTDB_UNFORMATTED_APN
--For Xome 20260910
,case when A.FIPS = '24003' then Coalesce(B.FormattedAPN,case when right(left(A.APN,2) ,1) like '-' then '0' + A.APN else A.APN end) else A.APN end as PropAPN


FROM            RELEASE  as A with(NOLOCK)
--left outer join data.dbo.Property as B with(NOLOCK) on A.FIPS = B.FIPS and A.FAPropertyID = B.PropertyID
left outer join data.dbo.Property as B with(NOLOCK) on A.FAPropertyID = B.PropertyID --Giang 20210917 - To avoid query plan from using Property.idx_Fips_inc_XXX index that cases 12103 to take 12 hours to run
--Removed 20200130 we have no future dates on the RecordingDt field
Where RecordingDt is not null --and RecordingDt <= convert(varchar(8),GetDate(),112)

------------------------TEMP REMOVE AFTER 2020-10-23------------------------
--UNION ALL
--/*-------------------------------------------------------------------------------------*/ 

--SELECT 

--A.[FIPS] as [Fips]
--,A.[FAPropertyId] as [PropertyID]
--,A.[APN] as [APN]
--,NULL as [APNSeqNbr]
--,NULL as [OldAPN]
--,A.[TaxAccountNbr] as [TaxAccountNumber]
--,B.[SitusSTDFullStreetAddress] as [SitusFullStreetAddress]
--,A.[SitusHouseNbr] as [SitusHouseNbr]
--,A.[SitusHouseNbrSuffix] as [SitusHouseNbrSuffix]
--,A.[SitusDirectionLeft] as [SitusDirectionLeft]
--,A.[SitusStreet] as [SitusStreet]
--,A.[SitusMode] as [SitusMode]
--,A.[SitusDirectionRight] as [SitusDirectionRight]
--,A.[SitusUnitType] as [SitusUnitType]
--,A.[SitusUnitNbr] as [SitusUnitNbr]
--,A.[SitusCity] as [SitusCity]
--,A.[SitusState] as [SitusState]
--,A.[SitusZIP5] as [SitusZIP5]
--,A.[SitusZIP4] as [SitusZIP4]
--,A.[SitusCarrierCode] as [SitusCarrierCode]
--,A.[TransactionId] as [FATransactionID]
--,A.[DocNbrSrce] as [DocumentNbr]
--,A.[BookSrce] as [RecordingBook]
--,A.[PageSrce] as [RecordingPage]
--,A.[RecordingDt] as [RecordingDate]
--,A.[EffectiveDt] as [ContractDate]
--,A.[DocumentType] as [DocumentType]
--,left((Replace(Replace(Replace(Replace(case when charindex('a sin',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a sin',[BorrowerFullName])-1)) when charindex('a marri',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('a marri',[BorrowerFullName])-1)) when charindex('as Hu',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as hu',[BorrowerFullName])-1)) when charindex('Husband and wife',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('husband and wife',[BorrowerFullName])-1)) when charindex('wife and husband',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('wife and husband',[BorrowerFullName])-1)) when charindex('an unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('an unmar',[BorrowerFullName])-1)) when charindex('as unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('as unmar',[BorrowerFullName])-1)) when charindex('unmar',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('unmar',[BorrowerFullName])-1)) when charindex('marr',[BorrowerFullName]) >0 then Substring([BorrowerFullName],1,(Charindex('marr',[BorrowerFullName])-1)) else [BorrowerFullName] end,',', ' '),';',' '),'.',' '),' ', ' ')),60) as BorrowerFullName
--,NULL as NewLenderName
--,Replace(Replace([OrigLenderBen],',',''),'.','') as OriginalLenderName

--,A.[OrigDeedRecordingDt] as [OriginalMortgageDate]
--,A.[OrigDeedDocNbr] as [OriginalDocumentNbr]
--,A.[OrigDeedBook] as [OriginalBook]
--,A.[OrigDeedPage] as [OriginalPage]
--,A.[OrigLoanAmt] as [OriginalLoanAmt]
--,case when FADeedid is null then FASamID else FADeedID end as [OriginalFATransactionID]
--,A.[FATimestamp] as [FATimeStamp]
--,A.[FAUCIDFlag] as [FARecordType]

---------20190411 - Added per JE--
--,B.StdLandUseCode as StdLandUseCode

--------20200228 - Added for Ygrene
--,A.[CMTID]
--,A.[CMTIDInstNbr]  
--,A.[OrigLoanCMTID]
--,A.[OrigLoanCMTIDInstNbr]
------20201117---
--,B.PropertyClassID

--FROM  dbo.Release_BadTransID  as A with(NOLOCK)
--left outer join data.dbo.Property as B with(NOLOCK) on A.FIPS = B.FIPS and A.FAPropertyID = B.PropertyID
----Removed 20200130 we have no future dates on the RecordingDt field
--Where RecordingDt is not null --and RecordingDt <= convert(varchar(8),GetDate(),112)















GRANT SELECT ON [dbo].[vASR_STD_NEW_STANDARD] TO [CORP\cbrady] AS [dbo]
