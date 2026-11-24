SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION [TaxSourceAPIUAT].[dbo].[ChooseBestDate](@RedemptionDate varchar(30), @Year varchar(4), @Month varchar(20))

RETURNS varchar(30)
AS
BEGIN
	if @RedemptionDate is NULL and @Year is null return null
	declare @retVal varchar(30) = @RedemptionDate 

	if(len(@Year) = 2)
	BEGIN
		SET @Year = '20'+ @Year
	END
	if(len(@Month) <> 3)
	BEGIN
		SET @Month = (convert(char(3), convert(date, '2020/'+@Month+'/01' ), 0))
	END


	if(@RedemptionDate is  null)
	BEGIN
		SET @retVal = dbo.LastDayOfMonth( CONVERT(varchar(30), CONVERT(datetime, (@Month+' 01 '+@Year), 107), 126))
		--set @retVal = CONVERT(varchar(30), CONVERT(datetime, 'JAN'+' 01 '+'2021', 107), 126) 

	END
	return @retVal
END

