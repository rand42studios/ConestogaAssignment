USE [master]
GO
/****** Object:  Database [Pizza]    Script Date: 2017-10-05 11:20:19 AM ******/
CREATE DATABASE [Pizza]
 
GO
ALTER DATABASE [Pizza] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pizza].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pizza] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pizza] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pizza] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pizza] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pizza] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pizza] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Pizza] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pizza] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pizza] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pizza] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pizza] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pizza] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pizza] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pizza] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pizza] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pizza] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pizza] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pizza] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pizza] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pizza] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pizza] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pizza] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pizza] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pizza] SET  MULTI_USER 
GO
ALTER DATABASE [Pizza] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pizza] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pizza] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pizza] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Pizza] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Pizza]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 2017-10-05 11:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customerId] [int] IDENTITY(0,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[phone] [varchar](16) NULL,
	[streetAddress] [varchar](50) NULL,
	[apartment] [varchar](10) NULL,
	[city] [varchar](50) NULL,
	[comments] [varchar](max) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[driver]    Script Date: 2017-10-05 11:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driver](
	[driverCode] [char](10) NOT NULL,
	[fullName] [varchar](50) NOT NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
 CONSTRAINT [PK_driver] PRIMARY KEY CLUSTERED 
(
	[driverCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[item]    Script Date: 2017-10-05 11:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[itemId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[baseCost] [float] NOT NULL,
	[costFactorForToppings] [float] NOT NULL,
	[isPizzaTopping] [bit] NOT NULL,
 CONSTRAINT [PK_item_1] PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order]    Script Date: 2017-10-05 11:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[dateTimeOrdered] [datetime] NOT NULL,
	[pickup] [bit] NOT NULL,
	[driverCode] [char](10) NULL,
	[comments] [varchar](max) NULL,
	[orderComplete] [bit] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderItem]    Script Date: 2017-10-05 11:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderItem](
	[orderItemId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[itemId] [int] NOT NULL,
	[quantity] [float] NOT NULL,
	[price] [float] NOT NULL,
	[comment] [varchar](max) NULL,
 CONSTRAINT [PK_orderItem] PRIMARY KEY CLUSTERED 
(
	[orderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([customerId], [name], [phone], [streetAddress], [apartment], [city], [comments]) VALUES (0, N'walk-in', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([customerId], [name], [phone], [streetAddress], [apartment], [city], [comments]) VALUES (1, N'dave', N'519-748-5220', N'7 elm', N'10', N'kitchener', NULL)
INSERT [dbo].[customer] ([customerId], [name], [phone], [streetAddress], [apartment], [city], [comments]) VALUES (2, N'mary', N'519-748-5220', N'285 King', NULL, N'kitchener', NULL)
INSERT [dbo].[customer] ([customerId], [name], [phone], [streetAddress], [apartment], [city], [comments]) VALUES (3, N'gord', N'519-748-5220', N'78 weber', NULL, N'waterloo', NULL)
SET IDENTITY_INSERT [dbo].[customer] OFF
INSERT [dbo].[driver] ([driverCode], [fullName], [firstName], [lastName]) VALUES (N'fred      ', N'Penner, Fred', N'Fred', N'Penner')
INSERT [dbo].[driver] ([driverCode], [fullName], [firstName], [lastName]) VALUES (N'george    ', N'Hooper, George', N'George', N'Hooper')
INSERT [dbo].[driver] ([driverCode], [fullName], [firstName], [lastName]) VALUES (N'vito      ', N'valente, Vito', N'Vito', N'Valente')
SET IDENTITY_INSERT [dbo].[item] ON 

INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (1, N'coke: 1L', N'bottle', 3, 0, 0)
INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (2, N'coke: 300ml', N'can', 1.25, 0, 0)
INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (3, N'pizza: large', N'16" pizza, 12 slices', 4, 4, 0)
INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (4, N'pizza: medium', N'12" pizza, 8 clices', 2, 2, 0)
INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (5, N'pizza: personal', N'6" pizza, 4 slices', 1, 0.75, 0)
INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (6, N'pizza: small', N'8" pizza, 4 slices', 1.25, 1, 0)
INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (8, N'pepperoni', N'15 (25g) slices for small', 0.5, 0, 1)
INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (9, N'feta cheese', N'crumbled feta, 25g for small', 0.5, 0, 1)
INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (10, N'extra cheese', N'extra mozzarella, 60g for small', 0.75, 0, 1)
INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (11, N'mushrooms', N'sliced, 25g for small', 0.5, 0, 1)
INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (12, N'onions', N'sliced, 30g for small', 0.5, 0, 1)
INSERT [dbo].[item] ([itemId], [name], [description], [baseCost], [costFactorForToppings], [isPizzaTopping]) VALUES (13, N'ground beef', N'crumbled, 30g for smal ', 0.5, 0, 1)
SET IDENTITY_INSERT [dbo].[item] OFF
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([orderId], [customerId], [dateTimeOrdered], [pickup], [driverCode], [comments], [orderComplete]) VALUES (1, 1, CAST(N'2013-03-12T14:00:00.000' AS DateTime), 0, N'vito      ', NULL, 1)
INSERT [dbo].[order] ([orderId], [customerId], [dateTimeOrdered], [pickup], [driverCode], [comments], [orderComplete]) VALUES (2, 0, CAST(N'2013-03-12T16:00:00.000' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[order] ([orderId], [customerId], [dateTimeOrdered], [pickup], [driverCode], [comments], [orderComplete]) VALUES (3, 2, CAST(N'2013-03-12T17:00:00.000' AS DateTime), 0, N'fred      ', NULL, 0)
INSERT [dbo].[order] ([orderId], [customerId], [dateTimeOrdered], [pickup], [driverCode], [comments], [orderComplete]) VALUES (4, 3, CAST(N'2013-03-12T17:05:00.000' AS DateTime), 0, N'george    ', NULL, 0)
INSERT [dbo].[order] ([orderId], [customerId], [dateTimeOrdered], [pickup], [driverCode], [comments], [orderComplete]) VALUES (5, 1, CAST(N'2013-03-12T17:10:00.000' AS DateTime), 1, NULL, NULL, 0)
INSERT [dbo].[order] ([orderId], [customerId], [dateTimeOrdered], [pickup], [driverCode], [comments], [orderComplete]) VALUES (6, 0, CAST(N'2013-03-12T17:15:00.000' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[order] ([orderId], [customerId], [dateTimeOrdered], [pickup], [driverCode], [comments], [orderComplete]) VALUES (7, 0, CAST(N'2013-03-12T17:16:00.000' AS DateTime), 0, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[order] OFF
SET IDENTITY_INSERT [dbo].[orderItem] ON 

INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (1, 1, 2, 4, 5, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (2, 1, 3, 1, 4, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (3, 1, 8, 4, 2, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (5, 1, 10, 4, 3, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (6, 2, 5, 1, 1, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (7, 3, 2, 1, 1.25, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (8, 3, 6, 1, 1.25, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (9, 3, 11, 1, 0.5, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (10, 3, 12, 1, 0.5, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (11, 4, 4, 2, 4, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (12, 4, 13, 2, 1, N'on 1st pizza')
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (13, 4, 10, 2, 1.5, N'on 2nd pizza')
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (15, 5, 3, 1, 4, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (16, 5, 8, 4, 2, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (17, 5, 10, 4, 3, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (18, 5, 13, 4, 2, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (19, 6, 3, 2, 8, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (20, 6, 10, 8, 6, N'on both pizzas')
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (21, 6, 8, 4, 2, N'on 1st pizza')
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (22, 6, 1, 6, 18, NULL)
INSERT [dbo].[orderItem] ([orderItemId], [orderId], [itemId], [quantity], [price], [comment]) VALUES (23, 6, 11, 4, 2, N'on 2nd pizza')
SET IDENTITY_INSERT [dbo].[orderItem] OFF
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_customerId]  DEFAULT ((0)) FOR [customerId]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[customer] ([customerId])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_customer]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_driver] FOREIGN KEY([driverCode])
REFERENCES [dbo].[driver] ([driverCode])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_driver]
GO
ALTER TABLE [dbo].[orderItem]  WITH CHECK ADD  CONSTRAINT [FK_orderItem_item] FOREIGN KEY([itemId])
REFERENCES [dbo].[item] ([itemId])
GO
ALTER TABLE [dbo].[orderItem] CHECK CONSTRAINT [FK_orderItem_item]
GO
ALTER TABLE [dbo].[orderItem]  WITH CHECK ADD  CONSTRAINT [FK_orderItem_order] FOREIGN KEY([orderId])
REFERENCES [dbo].[order] ([orderId])
GO
ALTER TABLE [dbo].[orderItem] CHECK CONSTRAINT [FK_orderItem_order]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'sequential number for this item in stock' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'item', @level2type=N'COLUMN',@level2name=N'itemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'common text name of the item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'item', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'description of object ... size, number of slices, number of people, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'item', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'base cost of the pizza, can of pop, etc.  may or may not have toppings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'item', @level2type=N'COLUMN',@level2name=N'baseCost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'multiplier for cost of toppings on this item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'item', @level2type=N'COLUMN',@level2name=N'costFactorForToppings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'true if can be added as a pizza topping ... can of pop would be false' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'item', @level2type=N'COLUMN',@level2name=N'isPizzaTopping'
GO
USE [master]
GO
ALTER DATABASE [Pizza] SET  READ_WRITE 
GO
