--CREATE DATABASE Db_Shop
USE Db_Shop

CREATE TABLE UsersDetail(
	[UserID] [int] NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Address] [nvarchar](200) NULL

 CONSTRAINT [PK_UsersDetail] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO	


ALTER TABLE [dbo].[UsersDetail] ADD  CONSTRAINT [DF_Product_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO

CREATE TABLE Product(
	[Code] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Unit] [nvarchar](200) NOT NULL,
	[Price] [money] NOT NULL,
	[Count] [int] NOT NULL,
	[Description] [nvarchar](200) NULL

 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO	

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Unit]  DEFAULT (N'Chiếc') FOR [Unit]
GO

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO

CREATE TABLE TheOrder(
	[Code] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
    [Status] [int] NOT NULL
 CONSTRAINT [PK_TheOrder] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO	


ALTER TABLE [dbo].[TheOrder] ADD  CONSTRAINT [DF_TheOrder_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO


ALTER TABLE [dbo].[TheOrder]  WITH CHECK ADD  CONSTRAINT [fk_cd_userid] FOREIGN KEY([UserID])
REFERENCES [dbo].[UsersDetail] ([UserID])
GO

ALTER TABLE [dbo].[TheOrder] CHECK CONSTRAINT [fk_cd_userid]
GO

CREATE TABLE OrdersDetail(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductCode] [int] NOT NULL,
	[lastprice] [int] NOT NULL,
	[Count] [int] NOT NULL

CONSTRAINT [PK_OrdersDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO	

ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [fk_cd_productcode] FOREIGN KEY([ProductCode])
REFERENCES [dbo].[Product] ([Code])
GO

ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [fk_cd_productcode]
GO