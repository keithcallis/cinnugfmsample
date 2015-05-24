SET IDENTITY_INSERT [dbo].[UserAccounts] ON 

INSERT [dbo].[UserAccounts] ([Id], [UserId], [AccountId]) VALUES (1, 1, 1)
INSERT [dbo].[UserAccounts] ([Id], [UserId], [AccountId]) VALUES (2, 1, 4)
INSERT [dbo].[UserAccounts] ([Id], [UserId], [AccountId]) VALUES (3, 2, 2)
INSERT [dbo].[UserAccounts] ([Id], [UserId], [AccountId]) VALUES (4, 3, 3)
SET IDENTITY_INSERT [dbo].[UserAccounts] OFF

go
