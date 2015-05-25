using FluentMigrator;

namespace DB_Migration.Migrations.Sprint07
{
    [Migration(201505242334)]
    public class LongRunningTransaction : Migration
    {
        public override void Up()
        {
            Execute.Sql(@"WAITFOR DELAY '00:00:40'");
            Rename.Column("Column3").OnTable("Sample").InSchema("dbo").To("FeeAmount");
        }

        public override void Down()
        {
        }
    }
}