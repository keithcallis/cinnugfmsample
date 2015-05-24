using System;
using FluentMigrator;

namespace DB_Migration.Migratioins.Sprint01
{
    [Tags("Test")]
    [Migration(201505232314)]
    public class AddSampleTableDataTest : Migration
    {
        public override void Up()
        {
            Insert.IntoTable("Sample").InSchema("dbo")
                .Row(new {Column1 = "Simple Order Fee", Column2 = DateTime.Now.AddDays(-7), Column3 = 1.99m});
        }

        public override void Down()
        {
            Delete.FromTable("Sample").InSchema("dbo").Row(new { Column1 = "Simple Order Fee" });
        }
    }
}