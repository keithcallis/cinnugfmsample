.\MIGRATE -db SqlServer2008 -connection "data source=(local);initial catalog=FMSample;integrated security=True;" -a DB_Migration.dll -t rollback:toversion -version 201505242234
