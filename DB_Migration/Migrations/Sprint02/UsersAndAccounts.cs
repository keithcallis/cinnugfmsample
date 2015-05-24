using FluentMigrator;

namespace DB_Migration.Migrations.Sprint02
{
    [Migration(201505240051)]
    public class UsersAndAccounts : Migration
    {
        public override void Up()
        {
            Create.Table("Users")
                .WithColumn("Id").AsInt32().Identity().PrimaryKey()
                .WithColumn("FirstName").AsString().NotNullable()
                .WithColumn("Surname").AsString().NotNullable();

            Create.Table("Accounts")
                  .WithColumn("Id").AsInt32().Identity().PrimaryKey()
                  .WithColumn("Name").AsString(100).NotNullable();

            Create.Table("UserAccounts")
                  .WithColumn("Id").AsInt32().Identity().PrimaryKey()
                  .WithColumn("UserId").AsInt32().ForeignKey("Users", "Id")
                  .WithColumn("AccountId").AsInt32().ForeignKey("Accounts", "Id");

            Create.Index().OnTable("Users").
                WithOptions().NonClustered().OnColumn("FirstName").Ascending();
        }

        public override void Down()
        {
            Delete.Table("UserAccounts");
            Delete.Table("Accounts");
            Delete.Table("Users");
        }
    }
}