using FluentMigrator;

namespace DB_Migration.Migrations.Sprint05
{
    [Migration(201505242234)]
    public class AddColumnToUsers : Migration
    {
        public override void Up()
        {
            if (!Schema.Table("Users").Column("CellPhone").Exists())
            {
                this.Create.Column("CellPhone").OnTable("Users").InSchema("dbo")
                    .AsString(25).NotNullable().WithDefaultValue("Unknown");
            }

        }

        public override void Down()
        {
        }
    }
}