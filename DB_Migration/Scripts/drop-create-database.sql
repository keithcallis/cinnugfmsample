
:setvar DefaultDataPath "F:\src\FM\"
:setvar DefaultLogPath "F:\src\FM\"

:on error exit
GO

USE [master]
GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) BEGIN

	EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = $(DatabaseName)

	ALTER DATABASE [$(DatabaseName)] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE

	DROP DATABASE [$(DatabaseName)]

END
GO

PRINT N'Creating $(DatabaseName)...'
GO

DECLARE @rc int,
		@dataDir varchar(max),
		@pathSetting varchar(max),
		@fullDatabase varchar(max),
		@fullLog varchar(max),
		@cmd varchar(max);

PRINT 'Creating database in ' + @fullDatabase;
SET @cmd = 'CREATE DATABASE [$(DatabaseName)] COLLATE SQL_Latin1_General_CP1_CI_AS';
EXECUTE (@cmd);
GO

EXECUTE sp_dbcmptlevel [$(DatabaseName)], 100;
GO

USE [$(DatabaseName)]
GO
IF (fulltextserviceproperty(N'IsFulltextInstalled') = 1) BEGIN
    EXECUTE sp_fulltext_database 'enable';
END
GO

ALTER DATABASE [$(DatabaseName)] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET ARITHABORT OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [$(DatabaseName)] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [$(DatabaseName)] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [$(DatabaseName)] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET  ENABLE_BROKER 
GO

ALTER DATABASE [$(DatabaseName)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [$(DatabaseName)] SET READ_COMMITTED_SNAPSHOT ON 
GO

ALTER DATABASE [$(DatabaseName)] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET RECOVERY FULL 
GO

ALTER DATABASE [$(DatabaseName)] SET  MULTI_USER 
GO

ALTER DATABASE [$(DatabaseName)] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [$(DatabaseName)] SET DB_CHAINING OFF 
GO

ALTER DATABASE [$(DatabaseName)] SET  READ_WRITE 
GO

