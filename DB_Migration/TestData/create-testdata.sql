/*
 Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed after the build script.	
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :R ".\testdata\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


USE [$(DatabaseName)]
GO

--	Turn off row counts
SET NOCOUNT ON;
SET QUOTED_IDENTIFIER ON;

:ON ERROR EXIT

/*
	Add initial data for database
*/
--PRINT 'dbo.Accounts.Table.sql'
--:R ".\TestData\dbo.Accounts.Table.sql"
go
--PRINT 'dbo.Users.Table.sql'
--:R ".\TestData\dbo.Users.Table.sql"
go
--PRINT 'dbo.UserAccounts.Table.sql'
--:R ".\TestData\dbo.UserAccounts.Table.sql"
go


