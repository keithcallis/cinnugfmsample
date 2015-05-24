PRINT "now in add-programmability-objects.sql"

-- This is where we add objects to the DBO Schema
USE [$(DatabaseName)]
GO

:ON ERROR EXIT

-- These options are required for indexed views
SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;

--------------------------------------------------------
-- This is where we add User Defined Data Types for DBO
--------------------------------------------------------
PRINT 'Adding User Defined Data Types for DBO...';
GO


---------------------------------------
-- This is where we add Views for DBO
---------------------------------------
PRINT 'Adding Views for DBO...';
GO

--PRINT 'Adding View dbo.vw_aspnet_Applications.view.sql...';
-- : R ".\Schemas\dbo\Views\dbo.vw_aspnet_Applications.view.sql"
GO


------------------------------------------
-- This is where we add Functions for DBO
------------------------------------------
PRINT 'Adding Functions for DBO...';
PRINT 'Adding Function dbo.ufnSplitCSV.function.sql...';
:R ".\Schemas\dbo\Programmability\Functions\dbo.ufnSplitCSV.function.sql"

GO

--------------------------------------------------
-- This is where we add Stored Procedures for DBO
--------------------------------------------------
PRINT 'Adding Stored Procedures for DBO...';

PRINT 'Adding Stored Procedure dbo.sel_AllAccountsUsers.proc.sql...';
:R ".\Schemas\dbo\Programmability\Stored Procedures\dbo.sel_AllAccountsUsers.proc.sql"
GO


-- This is where we add objects to the IMS Schema

---------------------------------------------------------------
-- This is where we add Full-Text Indexes for dbo
-- Note: full-text indexes cannot be created under FM
-- because FM wraps all the changes within a user transaction
---------------------------------------------------------------
--PRINT 'Adding Full-Text Indexes for dbo...';

--PRINT 'Adding Full-Text Index dbo.SearchData.fulltextindex.sql...';
-- : R ".\Schemas\dbo\Indexes\dbo.SearchData.fulltextindex.sql"
GO


--
-- object permissions
GO
