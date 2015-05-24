SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [Surname]) VALUES (1, N'Keith', N'Callis')
INSERT [dbo].[Users] ([Id], [FirstName], [Surname]) VALUES (2, N'Mike', N'Levy')
INSERT [dbo].[Users] ([Id], [FirstName], [Surname]) VALUES (3, N'Ken', N'Baum')
SET IDENTITY_INSERT [dbo].[Users] OFF

go
