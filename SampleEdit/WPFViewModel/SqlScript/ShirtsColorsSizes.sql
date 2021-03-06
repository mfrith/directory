/****** Object:  Table [dbo].[ShirtColors]    Script Date: 03/22/2012 17:28:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShirtColors](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ShirtColors] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ShirtColors] ON
INSERT [dbo].[ShirtColors] ([ColorId], [ColorName]) VALUES (1, N'Blue')
INSERT [dbo].[ShirtColors] ([ColorId], [ColorName]) VALUES (2, N'Red')
INSERT [dbo].[ShirtColors] ([ColorId], [ColorName]) VALUES (3, N'Green')
INSERT [dbo].[ShirtColors] ([ColorId], [ColorName]) VALUES (4, N'White')
SET IDENTITY_INSERT [dbo].[ShirtColors] OFF
/****** Object:  Table [dbo].[ShirtSizes]    Script Date: 03/22/2012 17:28:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShirtSizes](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ShirtSizes] ON
INSERT [dbo].[ShirtSizes] ([SizeId], [SizeName]) VALUES (1, N'Small')
INSERT [dbo].[ShirtSizes] ([SizeId], [SizeName]) VALUES (2, N'Medium')
INSERT [dbo].[ShirtSizes] ([SizeId], [SizeName]) VALUES (3, N'Large')
INSERT [dbo].[ShirtSizes] ([SizeId], [SizeName]) VALUES (4, N'x-Large')
INSERT [dbo].[ShirtSizes] ([SizeId], [SizeName]) VALUES (5, N'2x-Large')
SET IDENTITY_INSERT [dbo].[ShirtSizes] OFF
/****** Object:  Table [dbo].[Shirts]    Script Date: 03/22/2012 17:28:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shirts](
	[ShirtId] [int] IDENTITY(1,1) NOT NULL,
	[ShirtName] [nvarchar](50) NOT NULL,
	[SizeId] [int] NOT NULL,
	[ColorId] [int] NULL,
 CONSTRAINT [PK_Shirts] PRIMARY KEY CLUSTERED 
(
	[ShirtId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Shirts] ON
INSERT [dbo].[Shirts] ([ShirtId], [ShirtName], [SizeId], [ColorId]) VALUES (1, N'Blue Small Polo', 1, 1)
INSERT [dbo].[Shirts] ([ShirtId], [ShirtName], [SizeId], [ColorId]) VALUES (2, N'White Medim Polo', 2, 4)
INSERT [dbo].[Shirts] ([ShirtId], [ShirtName], [SizeId], [ColorId]) VALUES (3, N'Green Medium T-Shirt', 2, 3)
INSERT [dbo].[Shirts] ([ShirtId], [ShirtName], [SizeId], [ColorId]) VALUES (4, N'White X-Large T-Shirt', 3, 4)
INSERT [dbo].[Shirts] ([ShirtId], [ShirtName], [SizeId], [ColorId]) VALUES (5, N'Red Medium Polo', 2, 2)
INSERT [dbo].[Shirts] ([ShirtId], [ShirtName], [SizeId], [ColorId]) VALUES (6, N'Green X-Large Button Down', 4, 3)
INSERT [dbo].[Shirts] ([ShirtId], [ShirtName], [SizeId], [ColorId]) VALUES (7, N'Blue 2X-Large Button Down', 5, 1)
SET IDENTITY_INSERT [dbo].[Shirts] OFF
/****** Object:  View [dbo].[vwShirts]    Script Date: 03/22/2012 17:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwShirts]
AS
SELECT  dbo.Shirts.ShirtName, dbo.ShirtSizes.SizeName, dbo.ShirtColors.ColorName, dbo.Shirts.ShirtId
FROM    dbo.ShirtColors INNER JOIN
            dbo.Shirts ON dbo.ShirtColors.ColorId = dbo.Shirts.ColorId INNER JOIN
            dbo.ShirtSizes ON dbo.Shirts.SizeId = dbo.ShirtSizes.SizeId
GO
/****** Object:  ForeignKey [FK_Shirts_ShirtColors]    Script Date: 03/22/2012 17:28:37 ******/
ALTER TABLE [dbo].[Shirts]  WITH CHECK ADD  CONSTRAINT [FK_Shirts_ShirtColors] FOREIGN KEY([ColorId])
REFERENCES [dbo].[ShirtColors] ([ColorId])
GO
ALTER TABLE [dbo].[Shirts] CHECK CONSTRAINT [FK_Shirts_ShirtColors]
GO
/****** Object:  ForeignKey [FK_Shirts_ShirtSizes]    Script Date: 03/22/2012 17:28:37 ******/
ALTER TABLE [dbo].[Shirts]  WITH CHECK ADD  CONSTRAINT [FK_Shirts_ShirtSizes] FOREIGN KEY([SizeId])
REFERENCES [dbo].[ShirtSizes] ([SizeId])
GO
ALTER TABLE [dbo].[Shirts] CHECK CONSTRAINT [FK_Shirts_ShirtSizes]
GO
