using System;
using FluentMigrator;

namespace DB_Migration.Migrations.Sprint05
{
    [Migration(201505242158, TransactionBehavior.Default)]
    public class AddColumnToSample : Migration
    {
        public override void Up()
        {
            if (!Schema.Table("Sample").Column("IsActive").Exists())
            {
                Create.Column("IsActive").OnTable("Sample").InSchema("dbo")
                    .AsBoolean().NotNullable().SetExistingRowsTo(1);

                Update.Table("Sample").InSchema("dbo")
                    .Set(new {IsActive = 0, Column2 = DateTime.Now.Date})
                    .Where(new {Column1 = "Simple Order Fee"});

                Insert.IntoTable("Sample").InSchema("dbo")
                    .Row(new { Column1 = "Entry Order Fee", Column2 = DateTime.Now.AddDays(-7), Column3 = 0.99m, IsActive = 1 });
                Insert.IntoTable("Sample").InSchema("dbo")
                    .Row(new { Column1 = "Repeat Order Fee", Column2 = DateTime.Now.AddDays(-7), Column3 = 0.75m, IsActive = 1 });
                Insert.IntoTable("Sample").InSchema("dbo")
                    .Row(new { Column1 = "Large Order Fee", Column2 = DateTime.Now.AddDays(-7), Column3 = 9.85m, IsActive = 1 });

            }
        }

        public override void Down()
        {
        }
    }
}