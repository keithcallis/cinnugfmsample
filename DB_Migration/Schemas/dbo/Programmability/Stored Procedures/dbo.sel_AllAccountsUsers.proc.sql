IF OBJECT_ID(N'[dbo].[sel_AllAccountsUsers]') IS NULL
	BEGIN
		EXECUTE dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sel_AllAccountsUsers] AS BEGIN SELECT 1 END'
	END
GO

ALTER PROC [dbo].[sel_AllAccountsUsers]
AS
BEGIN

SET NOCOUNT ON

select a.Name,u.FirstName,u.Surname
from dbo.UserAccounts au
inner join dbo.Users u on u.Id = au.UserId
inner join dbo.Accounts a on a.Id = au.AccountId
order by 1,3

END
