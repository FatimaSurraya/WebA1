USE [master]
GO
/****** Object:  Database [NFT2]    Script Date: 12/04/2023 3:44:11 pm ******/
CREATE DATABASE [NFT2]
GO
CREATE TABLE [dbo].[Category](
	[Category Id] [int] NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/04/2023 3:44:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer Id] [int] NOT NULL,
	[User Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/04/2023 3:44:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[OrderBY] [nvarchar](50) NULL,
	[OrderDate] [date] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/04/2023 3:44:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Created by] [nvarchar](50) NULL,
	[Category Id] [nvarchar](50) NULL,
	[Cost] [nchar](10) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([Category Id], [Name]) VALUES (1, N'NFT1      ')
INSERT [dbo].[Category] ([Category Id], [Name]) VALUES (2, N'NFT2      ')
GO
INSERT [dbo].[Customer] ([Customer Id], [User Name], [Email], [Password]) VALUES (1, N'Customer1', N'Customer1@example.com', N'mypassword1')
INSERT [dbo].[Customer] ([Customer Id], [User Name], [Email], [Password]) VALUES (2, N'Customer2', N'Customer2@example.com', N'mypassword2')
INSERT [dbo].[Customer] ([Customer Id], [User Name], [Email], [Password]) VALUES (3, N'Customer3', N'Customer3@yopmail.com', N'Test@0000')
GO
INSERT [dbo].[Order] ([OrderID], [ProductID], [OrderBY], [OrderDate]) VALUES (1, 1, N'1', CAST(N'2023-04-10' AS Date))
INSERT [dbo].[Order] ([OrderID], [ProductID], [OrderBY], [OrderDate]) VALUES (2, 2, N'1', CAST(N'2023-04-10' AS Date))
INSERT [dbo].[Order] ([OrderID], [ProductID], [OrderBY], [OrderDate]) VALUES (5, 3, N'1', CAST(N'2023-04-20' AS Date))
GO
INSERT [dbo].[Product] ([Product ID], [Name], [Description], [Created by], [Category Id], [Cost]) VALUES (1, N'Product1', N'New ', N'John', N'1', N'20        ')
INSERT [dbo].[Product] ([Product ID], [Name], [Description], [Created by], [Category Id], [Cost]) VALUES (2, N'Product2', N'Big', N'Nim', N'2', N'30        ')
INSERT [dbo].[Product] ([Product ID], [Name], [Description], [Created by], [Category Id], [Cost]) VALUES (3, N'Product3', N'Small ', N'kilin', N'3', N'40        ')
INSERT [dbo].[Product] ([Product ID], [Name], [Description], [Created by], [Category Id], [Cost]) VALUES (4, N'Product4', N'Latest', N'Selen', N'4', N'50        ')
INSERT [dbo].[Product] ([Product ID], [Name], [Description], [Created by], [Category Id], [Cost]) VALUES (5, N'Product5', N'Large', N'Efe', N'5', N'60        ')
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([Category Id])
REFERENCES [dbo].[Category] ([Category Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
USE [master]
GO
ALTER DATABASE [NFT2] SET  READ_WRITE 
GO
