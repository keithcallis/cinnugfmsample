using FluentMigrator;

namespace DB_Migration.Migrations.Sprint06
{
    [Migration(201505242309)]
    public class AutoReverseNewColumn : AutoReversingMigration
    {
        public override void Up()
        {
            Rename.Column("Column1").OnTable("Sample").InSchema("dbo").To("FeeType");
        }

    }
}