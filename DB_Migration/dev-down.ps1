﻿.\MIGRATE -db SqlServer2008 -connection "data source=(local);initial catalog=FMSample;integrated security=True;" -a DB_Migration.dll -t migrate:down -version 201505232313 -tag Test