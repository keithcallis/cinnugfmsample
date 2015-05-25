use FMSample
go

select * from dbo.VersionInfo

select * from dbo.Sample

select * from dbo.Users
select * from dbo.Accounts
select * from dbo.UserAccounts


exec [dbo].[sel_AllAccountsUsers]
go


select s.name,o.name,o.type_desc
from sys.all_objects o
inner join sys.schemas s on s.schema_id = o.schema_id
where o.schema_id = 1 -- dbo
and o.type in ('TF','P','FN')
order by 3,1,2
