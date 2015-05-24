using FluentMigrator;

namespace DB_Migration.Migrations.Sprint03
{
    [Migration(201505240119)]
    public class AddufnSprintCSV : Migration
    {
        public override void Up()
        {
            Execute.Script(@".\Schemas\dbo\Programmability\Functions\dbo.ufnSplitCSV.function.sql");
        }

        public override void Down()
        {
        }
    }
}