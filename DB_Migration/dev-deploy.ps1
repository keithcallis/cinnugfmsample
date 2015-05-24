
Param(
	[parameter(Mandatory=$False)]
	[alias('database')]
	[string]
	$dbName = 'FMSample'
)

$StartDate=(GET-DATE)

ECHO "Started at:"
$StartDate
ECHO " "

ECHO "Creating Database..."

SQLCMD -S '(local)' -E -i 'scripts\drop-create-database.sql' -v DatabaseName="$dbName"
if ($LASTEXITCODE -ne 0) {break;}

#ECHO "Creating fulltext..."

#SQLCMD -S '(local)' -E -i 'scripts\create-fulltext-catalog.sql' -v DatabaseName="$dbName" -d $dbName
#if ($LASTEXITCODE -ne 0) {break;}

ECHO "Migrating..."

.\MIGRATE -db SqlServer2008 -connection "data source=(local);initial catalog=$dbName;integrated security=True;" -a DB_Migration.dll -t migrate:up -tag dev
if ($LASTEXITCODE -ne 0) {break;}

ECHO "Running programmability..."

SQLCMD -S '(local)' -E -i 'scripts\add-programmability-objects.sql' -v DatabaseName="$dbName"
if ($LASTEXITCODE -ne 0) {break;}

ECHO "Running testdata/create-testdata.sql..."

SQLCMD -S '(local)' -E -i 'TestData\create-testdata.sql' -v DatabaseName="$dbName"
if ($LASTEXITCODE -ne 0) {break;}

$EndDate=(GET-DATE)
$tspan = NEW-TIMESPAN –Start $StartDate –End $EndDate

ECHO "Completed at:"
GET-DATE 
"In " + $tspan.TotalSeconds + " Seconds "
