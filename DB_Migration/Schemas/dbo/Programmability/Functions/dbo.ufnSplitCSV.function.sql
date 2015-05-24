IF OBJECT_ID(N'[dbo].[ufnSplitCSV]') IS NULL
	BEGIN
		EXECUTE dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[ufnSplitCSV]() RETURNS @temptable TABLE (items VARCHAR(8000)) AS BEGIN RETURN END'
	END
GO

ALTER FUNCTION dbo.ufnSplitCSV (@CSVString VARCHAR(8000), @Delimiter CHAR(1))
RETURNS @temptable TABLE (items VARCHAR(8000))
AS
BEGIN
    DECLARE @pos INT;
    DECLARE @slice VARCHAR(8000);
 
    SELECT @pos = 1;
    IF LEN(@CSVString) < 1 OR @CSVString IS NULL RETURN;
 
    WHILE @pos!= 0
    BEGIN
        SET @pos = CHARINDEX(@Delimiter,@CSVString);
        IF @pos != 0
            SET @slice = LEFT(@CSVString, @pos - 1);
        ELSE
            SET @slice = @CSVString;
         
        IF( LEN(@slice) > 0)
            INSERT INTO @temptable(Items) VALUES (@slice);
         
        SET @CSVString = RIGHT(@CSVString, LEN(@CSVString) - @pos);
        IF LEN(@CSVString) = 0 BREAK;
    END
RETURN
END
GO

