using FluentMigrator;

namespace DB_Migration.Migratioins.Sprint01
{
    [Migration(201505232305)]
    public class AddSampleTable : Migration
    {
        public override void Up()
        {
            Create.Table("Sample").InSchema("dbo")
                .WithColumn("ID").AsInt32().PrimaryKey().Identity()
                .WithColumn("Column1").AsString(100).NotNullable()
                .WithColumn("Column2").AsDateTime().NotNullable().WithDefaultValue(SystemMethods.CurrentDateTime)
                .WithColumn("Column3").AsDecimal().NotNullable().WithDefaultValue(0.00m)
            ;
        }

        public override void Down()
        {
            Delete.Table("Sample").InSchema("dbo");
        }
    }
}