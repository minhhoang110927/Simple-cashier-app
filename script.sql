CREATE DATABASE RestaurantDBAngular
USE [RestaurantDBAngular]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 13/06/2021 7:32:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 13/06/2021 7:32:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](50) NULL,
	[CustomerName] [varchar](50) NULL,
	[PMethod] [varchar](50) NULL,
	[GTotal] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 13/06/2021 7:32:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NULL,
	[ItemID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (41, N'Bun Bo hue', CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (42, N'Bun thit nuong', CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (43, N'Banh mi', CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Item] ([ItemID], [Name], [Price]) VALUES (44, N'Xoi thit', CAST(500.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderNo], [CustomerName], [PMethod], [GTotal]) VALUES (8, N'756984', N'Hoang', N'Cash', CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([OrderID], [OrderNo], [CustomerName], [PMethod], [GTotal]) VALUES (9, N'193712', N'Hoang1', N'Cash', CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Order] ([OrderID], [OrderNo], [CustomerName], [PMethod], [GTotal]) VALUES (10, N'318612', N'Hoang2', N'Cash', CAST(60.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (11, 8, 41, 2)
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (12, 8, 43, 1)
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (13, 9, 44, 2)
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (14, 10, 41, 1)
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ItemID], [Quantity]) VALUES (15, 10, 42, 2)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Item]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Order]
GO
