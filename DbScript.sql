Create Database Invoice_DB
USE [Invoice_DBB]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 04-12-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](255) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[InvoiceItems]    Script Date: 04-12-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InvoiceItems](
	[InvoiceItemId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [decimal](10, 2) NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 04-12-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoices]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](50) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[CustomerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Items]    Script Date: 04-12-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Items]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](255) NOT NULL,
	[Rate] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [Mobile]) VALUES (1, N'Prashant', N'7030867415')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceItems] ON 
GO
INSERT [dbo].[InvoiceItems] ([InvoiceItemId], [InvoiceId], [ItemId], [Quantity], [Discount], [Total]) VALUES (3, 2, 3, 10, CAST(0.00 AS Decimal(10, 2)), CAST(223.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[InvoiceItems] ([InvoiceItemId], [InvoiceId], [ItemId], [Quantity], [Discount], [Total]) VALUES (4, 2, 7, 14, CAST(0.00 AS Decimal(10, 2)), CAST(350.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[InvoiceItems] ([InvoiceItemId], [InvoiceId], [ItemId], [Quantity], [Discount], [Total]) VALUES (5, 3, 3, 100, CAST(0.00 AS Decimal(10, 2)), CAST(2230.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[InvoiceItems] ([InvoiceItemId], [InvoiceId], [ItemId], [Quantity], [Discount], [Total]) VALUES (6, 4, 2, 10, CAST(0.00 AS Decimal(10, 2)), CAST(157.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[InvoiceItems] ([InvoiceItemId], [InvoiceId], [ItemId], [Quantity], [Discount], [Total]) VALUES (7, 4, 6, 15, CAST(0.00 AS Decimal(10, 2)), CAST(291.75 AS Decimal(10, 2)))
GO
INSERT [dbo].[InvoiceItems] ([InvoiceItemId], [InvoiceId], [ItemId], [Quantity], [Discount], [Total]) VALUES (8, 5, 4, 10, CAST(0.00 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[InvoiceItems] ([InvoiceItemId], [InvoiceId], [ItemId], [Quantity], [Discount], [Total]) VALUES (9, 6, 3, 10, CAST(1.00 AS Decimal(10, 2)), CAST(222.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[InvoiceItems] ([InvoiceItemId], [InvoiceId], [ItemId], [Quantity], [Discount], [Total]) VALUES (10, 7, 2, 10, CAST(0.00 AS Decimal(10, 2)), CAST(157.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[InvoiceItems] ([InvoiceItemId], [InvoiceId], [ItemId], [Quantity], [Discount], [Total]) VALUES (11, 8, 9, 45, CAST(0.00 AS Decimal(10, 2)), CAST(621.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[InvoiceItems] ([InvoiceItemId], [InvoiceId], [ItemId], [Quantity], [Discount], [Total]) VALUES (12, 9, 10, 78, CAST(0.00 AS Decimal(10, 2)), CAST(1419.60 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[InvoiceItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoices] ON 
GO
INSERT [dbo].[Invoices] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId]) VALUES (2, N'INV001', CAST(N'2024-12-03T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Invoices] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId]) VALUES (3, N'INV002', CAST(N'2024-12-03T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Invoices] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId]) VALUES (4, N'INV003', CAST(N'2024-12-03T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Invoices] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId]) VALUES (5, N'INV004', CAST(N'2024-12-03T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Invoices] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId]) VALUES (6, N'INV005', CAST(N'2024-12-04T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Invoices] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId]) VALUES (7, N'INV006', CAST(N'2024-12-04T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Invoices] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId]) VALUES (8, N'INV007', CAST(N'2024-12-04T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Invoices] ([InvoiceId], [InvoiceNo], [InvoiceDate], [CustomerId]) VALUES (9, N'INV008', CAST(N'2024-12-04T00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Invoices] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [Rate]) VALUES (1, N'Item1', CAST(10.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [Rate]) VALUES (2, N'Item2', CAST(15.75 AS Decimal(10, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [Rate]) VALUES (3, N'Item3', CAST(22.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [Rate]) VALUES (4, N'Item4', CAST(9.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [Rate]) VALUES (5, N'Item5', CAST(14.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [Rate]) VALUES (6, N'Item6', CAST(19.45 AS Decimal(10, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [Rate]) VALUES (7, N'Item7', CAST(25.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [Rate]) VALUES (8, N'Item8', CAST(5.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [Rate]) VALUES (9, N'Item9', CAST(13.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[Items] ([ItemId], [ItemName], [Rate]) VALUES (10, N'Item10', CAST(18.20 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoiceIt__Invoi__2A4B4B5E]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItems]'))
ALTER TABLE [dbo].[InvoiceItems]  WITH CHECK ADD FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoices] ([InvoiceId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoiceIt__Invoi__2B3F6F97]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItems]'))
ALTER TABLE [dbo].[InvoiceItems]  WITH CHECK ADD FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoices] ([InvoiceId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoiceIt__ItemI__2C3393D0]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItems]'))
ALTER TABLE [dbo].[InvoiceItems]  WITH CHECK ADD FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__InvoiceIt__ItemI__2D27B809]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItems]'))
ALTER TABLE [dbo].[InvoiceItems]  WITH CHECK ADD FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Invoices__Custom__2E1BDC42]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Invoices__Custom__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoices]'))
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
/****** Object:  StoredProcedure [dbo].[InvoiceDetials]    Script Date: 04-12-2024 14:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceDetials]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InvoiceDetials] AS' 
END
GO
ALTER   PROCEDURE [dbo].[InvoiceDetials]
AS
BEGIN
	select I.InvoiceNo,I.InvoiceDate,Cu.CustomerName,Cu.Mobile,SUM(II.Total) AS TotalAmount from Invoices I 
	inner join Customers Cu on Cu.CustomerId = I.CustomerId
	inner join InvoiceItems II on II.InvoiceId = I.InvoiceId
	inner join Items It On It.ItemId = II.ItemId
	GROUP BY 
            I.InvoiceNo, 
            I.InvoiceDate, 
            Cu.CustomerName, 
            Cu.Mobile
END
GO
