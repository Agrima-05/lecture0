SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




create FUNCTION [NameParser].[dbo].[AfterLast2Characters](@string VARCHAR(MAX),@Char VARCHAR(1))
RETURNS VARCHAR(MAX)
BEGIN

--	IF @string like '%'+@Char+'%'+@Char+'%' 
--	DECLARE @String_II varchar(500)
--	SET @String_II = REVERSE(SUBSTRING(REVERSE(@string), 1, CHARINDEX(@Char, REVERSE(@string)) - 1))

--	RETURN CASE WHEN @String_II LIKE '%'+@Char+'%' THEN Reverse(LEFT(Stuff(Reverse(@string), 1, Charindex(@Char, Reverse(@string)) + 1 - 1, ''), Charindex(@Char, Stuff(Reverse(@string), 1, Charindex(@Char, Reverse(@string)) + 1 - 1, '')) - 1))  + ' ' +
--Reverse(LEFT(Reverse(@string), Charindex(@Char, Reverse(@string)) - 1))  ELSE @string END

		DECLARE @String_II nvarchar(max) = replace(@string,'&','AND'),
				@x xml

		SELECT @x = CAST('<a>'+REPLACE(REVERSE(@String_II),@Char,'</a><a>')+'</a>' as xml)


		RETURN REVERSE(@x.value('/a[2]','nvarchar(max)')) + ' ' + REVERSE(@x.value('/a[1]','nvarchar(max)'))  --+ ' ' + REVERSE(@x.value('/a[1]','nvarchar(max)')) 



END



