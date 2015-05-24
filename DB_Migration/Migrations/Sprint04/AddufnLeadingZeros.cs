using FluentMigrator;

namespace DB_Migration.Migrations.Sprint04
{
    [Migration(201505240133)]
    public class AddufnLeadingZeros : Migration
    {
        public override void Up()
        {

            Execute.Sql(@"
IF OBJECT_ID(N'[dbo].[ufnLeadingZeros]') IS NULL
	BEGIN
		EXECUTE dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[ufnLeadingZeros]() RETURNS VARCHAR(1) AS BEGIN RETURN (''1'') END'
	END
GO
");

            Execute.Sql(@"
ALTER FUNCTION [dbo].[ufnLeadingZeros](
@Value int
)
RETURNS varchar(8)
WITH SCHEMABINDING
AS
BEGIN
DECLARE @ReturnValue varchar(8);
SET @ReturnValue = CONVERT(varchar(8), @Value);
SET @ReturnValue = REPLICATE('0', 8 - DATALENGTH(@ReturnValue)) + @ReturnValue;
RETURN (@ReturnValue);
END;
GO
");
        }

        public override void Down()
        {
        }
    }
}