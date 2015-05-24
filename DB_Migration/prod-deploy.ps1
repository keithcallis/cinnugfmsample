Param(
$dbName = 'FMSample'
)

ECHO "Creating Database..."

.\MIGRATE -db SqlServer2008 -connection "data source=(local);initial catalog=$dbName;integrated security=True;" -a DB_Migration.dll -t migrate:up -tag prod
if ($LASTEXITCODE -ne 0) {break;}

SQLCMD -S '(local)' -E -i 'scripts\add-programmability-objects.sql' -v DatabaseName="$dbName"
if ($LASTEXITCODE -ne 0) {break;}

