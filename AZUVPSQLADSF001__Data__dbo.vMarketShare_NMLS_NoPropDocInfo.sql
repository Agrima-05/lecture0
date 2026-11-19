SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON





CREATE VIEW [dbo].[vMarketShare_NMLS_NoPropDocInfo]
AS
Select Distinct Substring(cast([Date] as varchar),1,7) as [YearMonth]
      ,[FIPSCode] as Fips
      ,[Zip Code]
      ,[County]
      ,[State]
      ,[Title Company]
      ,[Title Company Clean]
      ,[Transaction Type Clean]
      ,[Property Type]
      ,[Date]
      ,[Sales Price]
      ,[Loan Amount]
      ,[Lender]
      ,[Lender Clean] as [Lender Cleaned]
      ,[Buyer] as [Buyer Name]
      ,[Seller Name]
      ,[Builder]
      ,[Loan Type] as [LoanType]
      ,[Residential]
      ,[Corporate]
      ,[Attorney]
      ,[City]
      ,[RunDate]
      ,[Parent Title Co] as [ParentTitleCo]
	  ,[MarketShare]
	  ,[UpdateDate]
FROM [MarketShare].[dbo].[bulkMKSHR_ALL] m with(NOLOCK)



GRANT SELECT ON [dbo].[vMarketShare_NMLS_NoPropDocInfo] TO [CORP\cbrady] AS [dbo]
