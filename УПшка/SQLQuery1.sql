USE [UP01]
GO
/****** Object:  Table [dbo].[Deliverers]    Script Date: 18.03.2026 19:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deliverers](
	[Deliverer] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Deliverers] PRIMARY KEY CLUSTERED 
(
	[Deliverer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryPoints]    Script Date: 18.03.2026 19:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryPoints](
	[DeliveryPointId] [int] NOT NULL,
	[Address] [varchar](max) NOT NULL,
 CONSTRAINT [PK_DeliveryPoints] PRIMARY KEY CLUSTERED 
(
	[DeliveryPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 18.03.2026 19:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[Manufacturer] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[Manufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderComposition]    Script Date: 18.03.2026 19:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderComposition](
	[OrderId] [int] NOT NULL,
	[Article] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 18.03.2026 19:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[DeliveryPointId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[RecieverCode] [varchar](3) NOT NULL,
	[OrderStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 18.03.2026 19:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[OrderStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatuses] PRIMARY KEY CLUSTERED 
(
	[OrderStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.03.2026 19:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Article] [varchar](50) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[EdIzm] [varchar](3) NOT NULL,
	[Cost] [float] NOT NULL,
	[Deliverer] [varchar](50) NOT NULL,
	[Manufacturer] [varchar](50) NOT NULL,
	[ProductCategory] [varchar](50) NOT NULL,
	[CurrentDiscount] [float] NULL,
	[AmountStored] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Image] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 18.03.2026 19:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProductCategory] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 18.03.2026 19:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRole] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18.03.2026 19:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[UserRole] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Deliverers] ([Deliverer]) VALUES (N'CHILITOY')
GO
INSERT [dbo].[Deliverers] ([Deliverer]) VALUES (N'Knauf')
GO
INSERT [dbo].[Deliverers] ([Deliverer]) VALUES (N'Pikeshop')
GO
INSERT [dbo].[Deliverers] ([Deliverer]) VALUES (N'Playbig')
GO
INSERT [dbo].[Deliverers] ([Deliverer]) VALUES (N'Vinylon')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (1, N'420151, г. Лесной, ул. Вишневая, 32')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (2, N'125061, г. Лесной, ул. Подгорная, 8')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (3, N'630370, г. Лесной, ул. Шоссейная, 24')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (4, N'400562, г. Лесной, ул. Зеленая, 32')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (5, N'614510, г. Лесной, ул. Маяковского, 47')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (6, N'410542, г. Лесной, ул. Светлая, 46')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (7, N'620839, г. Лесной, ул. Цветочная, 8')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (8, N'443890, г. Лесной, ул. Коммунистическая, 1')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (9, N'603379, г. Лесной, ул. Спортивная, 46')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (10, N'603721, г. Лесной, ул. Гоголя, 41')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (11, N'410172, г. Лесной, ул. Северная, 13')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (12, N'614611, г. Лесной, ул. Молодежная, 50')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (13, N'454311, г.Лесной, ул. Новая, 19')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (14, N'660007, г.Лесной, ул. Октябрьская, 19')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (15, N'603036, г. Лесной, ул. Садовая, 4')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (16, N'394060, г.Лесной, ул. Фрунзе, 43')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (17, N'410661, г. Лесной, ул. Школьная, 50')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (18, N'625590, г. Лесной, ул. Коммунистическая, 20')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (19, N'625683, г. Лесной, ул. 8 Марта')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (20, N'450983, г.Лесной, ул. Комсомольская, 26')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (21, N'394782, г. Лесной, ул. Чехова, 3')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (22, N'603002, г. Лесной, ул. Дзержинского, 28')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (23, N'450558, г. Лесной, ул. Набережная, 30')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (24, N'344288, г. Лесной, ул. Чехова, 1')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (25, N'614164, г.Лесной,  ул. Степная, 30')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (26, N'394242, г. Лесной, ул. Коммунистическая, 43')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (27, N'660540, г. Лесной, ул. Солнечная, 25')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (28, N'125837, г. Лесной, ул. Шоссейная, 40')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (29, N'125703, г. Лесной, ул. Партизанская, 49')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (30, N'625283, г. Лесной, ул. Победы, 46')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (31, N'614753, г. Лесной, ул. Полевая, 35')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (32, N'426030, г. Лесной, ул. Маяковского, 44')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (33, N'450375, г. Лесной ул. Клубная, 44')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (34, N'625560, г. Лесной, ул. Некрасова, 12')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (35, N'630201, г. Лесной, ул. Комсомольская, 17')
GO
INSERT [dbo].[DeliveryPoints] ([DeliveryPointId], [Address]) VALUES (36, N'190949, г. Лесной, ул. Мичурина, 26')
GO
INSERT [dbo].[Manufacturers] ([Manufacturer]) VALUES (N'ABSпластик')
GO
INSERT [dbo].[Manufacturers] ([Manufacturer]) VALUES (N'BambiniFelici')
GO
INSERT [dbo].[Manufacturers] ([Manufacturer]) VALUES (N'Junion')
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (1, N'PMEZMH', 2)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (2, N'JVL42J', 1)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (3, N'3XBOTN', 10)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (4, N'S72AM3', 5)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (5, N'MIO8YV', 2)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (6, N'PMEZMH', 2)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (7, N'JVL42J', 1)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (8, N'3XBOTN', 10)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (9, N'S72AM3', 5)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (10, N'MIO8YV', 2)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (1, N'BPV4MM', 2)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (2, N'F895RB', 1)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (3, N'3L7RCZ', 10)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (4, N'2G3280', 4)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (5, N'UER2QD', 2)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (6, N'BPV4MM', 2)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (7, N'F895RB', 1)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (8, N'3L7RCZ', 10)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (9, N'2G3280', 4)
GO
INSERT [dbo].[OrderComposition] ([OrderId], [Article], [Quantity]) VALUES (10, N'UER2QD', 2)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [DeliveryDate], [DeliveryPointId], [UserId], [RecieverCode], [OrderStatus]) VALUES (1, CAST(N'2025-02-27T00:00:00.000' AS DateTime), CAST(N'2025-04-20T00:00:00.000' AS DateTime), 1, 7, N'901', N'Завершен')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [DeliveryDate], [DeliveryPointId], [UserId], [RecieverCode], [OrderStatus]) VALUES (2, CAST(N'2024-09-28T00:00:00.000' AS DateTime), CAST(N'2025-04-21T00:00:00.000' AS DateTime), 11, 1, N'902', N'Завершен')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [DeliveryDate], [DeliveryPointId], [UserId], [RecieverCode], [OrderStatus]) VALUES (3, CAST(N'2025-03-21T00:00:00.000' AS DateTime), CAST(N'2025-04-22T00:00:00.000' AS DateTime), 2, 2, N'903', N'Завершен')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [DeliveryDate], [DeliveryPointId], [UserId], [RecieverCode], [OrderStatus]) VALUES (4, CAST(N'2025-02-20T00:00:00.000' AS DateTime), CAST(N'2025-04-23T00:00:00.000' AS DateTime), 11, 10, N'904', N'Завершен')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [DeliveryDate], [DeliveryPointId], [UserId], [RecieverCode], [OrderStatus]) VALUES (5, CAST(N'2025-03-17T00:00:00.000' AS DateTime), CAST(N'2025-04-24T00:00:00.000' AS DateTime), 2, 7, N'905', N'Завершен')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [DeliveryDate], [DeliveryPointId], [UserId], [RecieverCode], [OrderStatus]) VALUES (6, CAST(N'2025-03-01T00:00:00.000' AS DateTime), CAST(N'2025-04-25T00:00:00.000' AS DateTime), 15, 1, N'906', N'Завершен')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [DeliveryDate], [DeliveryPointId], [UserId], [RecieverCode], [OrderStatus]) VALUES (7, CAST(N'2025-02-28T00:00:00.000' AS DateTime), CAST(N'2025-04-26T00:00:00.000' AS DateTime), 3, 2, N'907', N'Завершен')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [DeliveryDate], [DeliveryPointId], [UserId], [RecieverCode], [OrderStatus]) VALUES (8, CAST(N'2025-03-21T00:00:00.000' AS DateTime), CAST(N'2025-04-27T00:00:00.000' AS DateTime), 19, 10, N'908', N'Новый ')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [DeliveryDate], [DeliveryPointId], [UserId], [RecieverCode], [OrderStatus]) VALUES (9, CAST(N'2025-04-02T00:00:00.000' AS DateTime), CAST(N'2025-04-28T00:00:00.000' AS DateTime), 5, 2, N'909', N'Новый ')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [DeliveryDate], [DeliveryPointId], [UserId], [RecieverCode], [OrderStatus]) VALUES (10, CAST(N'2025-04-03T00:00:00.000' AS DateTime), CAST(N'2025-04-29T00:00:00.000' AS DateTime), 19, 10, N'910', N'Новый ')
GO
INSERT [dbo].[OrderStatuses] ([OrderStatus]) VALUES (N'Завершен')
GO
INSERT [dbo].[OrderStatuses] ([OrderStatus]) VALUES (N'Новый ')
GO
INSERT [dbo].[Product] ([Article], [ProductName], [EdIzm], [Cost], [Deliverer], [Manufacturer], [ProductCategory], [CurrentDiscount], [AmountStored], [Description], [Image]) VALUES (N'2G3280', N'Деревянный игровой набор JUNION Стройплощадка "Кра', N'шт.', 1624, N'Vinylon', N'Junion', N'Игровой набор', 9, 20, N'Игровой набор «Стройплощадка Кран-Паркс Junion» — это большая игрушечная парковка с деревянными машинками и настоящим подъёмным краном, придуманная в Яндексе настоящими родителями.', N'/Images/8.jpg')
GO
INSERT [dbo].[Product] ([Article], [ProductName], [EdIzm], [Cost], [Deliverer], [Manufacturer], [ProductCategory], [CurrentDiscount], [AmountStored], [Description], [Image]) VALUES (N'3L7RCZ', N'Игровой набор с деревянными машинками Стройплощадк', N'шт.', 7400, N'Knauf', N'Junion', N'Игровой набор', 15, 0, N'Игровой набор «Стройплощадка Кран-Паркс Junion» — это большая игрушечная парковка с деревянными машинками и настоящим подъёмным краном, придуманная в Яндексе настоящими родителями.', N'/Images/6.jpg')
GO
INSERT [dbo].[Product] ([Article], [ProductName], [EdIzm], [Cost], [Deliverer], [Manufacturer], [ProductCategory], [CurrentDiscount], [AmountStored], [Description], [Image]) VALUES (N'3XBOTN', N'Игровой набор Hot Wheels Action Loop Cyclone Chall', N'шт.', 3426, N'Knauf', N'BambiniFelici', N'Игровой набор', 10, 21, N'Игровой набор Hot Wheels Action Loop Cyclone Challenge Track - это уникальная игра, которая позволит вам испытать себя и своих друзей в скорости и ловкости. Этот набор состоит из металлической дорожки с циклоном, которая создает потрясающий эффект и добавляет дополнительную сложность в игру.', N'/Images/5.jpg')
GO
INSERT [dbo].[Product] ([Article], [ProductName], [EdIzm], [Cost], [Deliverer], [Manufacturer], [ProductCategory], [CurrentDiscount], [AmountStored], [Description], [Image]) VALUES (N'BPV4MM', N'Конструктор Гарри Поттер Сова Букля 630 деталей со', N'шт.', 771, N'Playbig', N'ABSпластик', N'Конструктор', 15, 26, N'Коллекционная модель Букля состоит из множества потрясающих элементов, а также специального механизма внутри. С его помощью можно плавно поднимать-опускать крылья птицы.', N'/Images/2.jpg')
GO
INSERT [dbo].[Product] ([Article], [ProductName], [EdIzm], [Cost], [Deliverer], [Manufacturer], [ProductCategory], [CurrentDiscount], [AmountStored], [Description], [Image]) VALUES (N'F895RB', N'Машинка игрушка диско шар светящаяся музыкальная', N'шт.', 368, N'Knauf', N'ABSпластик', N'Машинка', 6, 7, N'Светящаяся музыкальная машина с диско шаром переливается разными цветами, играет ритмичные мелодии, объезжает препятствия и крутится, поэтому с ней точно не будет скучно.', N'/Images/4.jpg')
GO
INSERT [dbo].[Product] ([Article], [ProductName], [EdIzm], [Cost], [Deliverer], [Manufacturer], [ProductCategory], [CurrentDiscount], [AmountStored], [Description], [Image]) VALUES (N'JVL42J', N'Музыкальные инструменты для детей, ксилофон, бараб', N'шт.', 2750, N'Playbig', N'BambiniFelici', N'Детский музыкальный инструмент', 15, 0, N'Откройте мир музыки для вашего ребенка с этой уникальной игрушкой! Это многофункциональное музыкальное чудо объединяет в себе всё, что нужно для творческого развития.', N'/Images/3.jpg')
GO
INSERT [dbo].[Product] ([Article], [ProductName], [EdIzm], [Cost], [Deliverer], [Manufacturer], [ProductCategory], [CurrentDiscount], [AmountStored], [Description], [Image]) VALUES (N'MIO8YV', N'Музыкальная игрушка интерактивная Пульт, детский п', N'шт.', 305, N'Vinylon', N'BambiniFelici', N'Детский музыкальный инструмент', 9, 31, N'Музыкальная игрушка интерактивная Пульт, детский прорезыватель для малышей', N'/Images/9.jpg')
GO
INSERT [dbo].[Product] ([Article], [ProductName], [EdIzm], [Cost], [Deliverer], [Manufacturer], [ProductCategory], [CurrentDiscount], [AmountStored], [Description], [Image]) VALUES (N'PMEZMH', N'Детский игровой набор машинок Щенячий патруль / Do', N'шт.', 1414, N'Pikeshop', N'ABSпластик', N'Игровой набор', 22, 50, N'Детский набор машинок с героями мультсериала «Щенячий патруль» подойдет как для мальчиков, так и для девочек. В детский набор входит 9 фигурок щенков спасателей. ', N'/Images/1.jpg')
GO
INSERT [dbo].[Product] ([Article], [ProductName], [EdIzm], [Cost], [Deliverer], [Manufacturer], [ProductCategory], [CurrentDiscount], [AmountStored], [Description], [Image]) VALUES (N'S72AM3', N'Синтезатор детский с микрофоном 61 клавиша', N'шт.', 1749, N'CHILITOY', N'Junion', N'Детский музыкальный инструмент', 10, 35, N'Откройте для ребенка дверь в мир музыки с детским синтезатором! Этот компактный инструмент с микрофоном станет верным другом для юных музыкантов, помогая им развивать творческий потенциал и получать удовольствие от игры.', N'/Images/7.jpg')
GO
INSERT [dbo].[Product] ([Article], [ProductName], [EdIzm], [Cost], [Deliverer], [Manufacturer], [ProductCategory], [CurrentDiscount], [AmountStored], [Description], [Image]) VALUES (N'UER2QD', N'Большой набор опытов и экспериментов для детей 14 ', N'шт.', 2506, N'Vinylon', N'BambiniFelici', N'Игровой набор', 8, 27, N'Большой набор опытов и экспериментов для детей 14 в 1', N'/Images/10.jpg')
GO
INSERT [dbo].[ProductCategories] ([ProductCategory]) VALUES (N'Детский музыкальный инструмент')
GO
INSERT [dbo].[ProductCategories] ([ProductCategory]) VALUES (N'Игровой набор')
GO
INSERT [dbo].[ProductCategories] ([ProductCategory]) VALUES (N'Конструктор')
GO
INSERT [dbo].[ProductCategories] ([ProductCategory]) VALUES (N'Машинка')
GO
INSERT [dbo].[UserRoles] ([UserRole]) VALUES (N'Авторизированный клиент')
GO
INSERT [dbo].[UserRoles] ([UserRole]) VALUES (N'Администратор')
GO
INSERT [dbo].[UserRoles] ([UserRole]) VALUES (N'Менеджер')
GO
INSERT [dbo].[Users] ([UserId], [UserRole], [FullName], [Login], [Password]) VALUES (1, N'Администратор', N'Ворсин Петр Евгеньевич', N'94d5ous@gmail.com', N'uzWC67')
GO
INSERT [dbo].[Users] ([UserId], [UserRole], [FullName], [Login], [Password]) VALUES (2, N'Администратор', N'Старикова Елена Павловна', N'uth4iz@mail.com', N'2L6KZG')
GO
INSERT [dbo].[Users] ([UserId], [UserRole], [FullName], [Login], [Password]) VALUES (3, N'Администратор', N'Одинцов Серафим Артёмович', N'yzls62@outlook.com', N'JlFRCZ')
GO
INSERT [dbo].[Users] ([UserId], [UserRole], [FullName], [Login], [Password]) VALUES (4, N'Менеджер', N'Михайлюк Анна Вячеславовна', N'1diph5e@tutanota.com', N'8ntwUp')
GO
INSERT [dbo].[Users] ([UserId], [UserRole], [FullName], [Login], [Password]) VALUES (5, N'Менеджер', N'Ситдикова Елена Анатольевна', N'tjde7c@yahoo.com', N'YOyhfR')
GO
INSERT [dbo].[Users] ([UserId], [UserRole], [FullName], [Login], [Password]) VALUES (6, N'Менеджер', N'Никифорова Весения Николаевна', N'wpmrc3do@tutanota.com', N'RSbvHv')
GO
INSERT [dbo].[Users] ([UserId], [UserRole], [FullName], [Login], [Password]) VALUES (7, N'Авторизированный клиент', N'Степанов Михаил Артёмович', N'5d4zbu@tutanota.com', N'rwVDh9')
GO
INSERT [dbo].[Users] ([UserId], [UserRole], [FullName], [Login], [Password]) VALUES (8, N'Авторизированный клиент', N'Ворсин Петр Евгеньевич', N'ptec8ym@yahoo.com', N'LdNyos')
GO
INSERT [dbo].[Users] ([UserId], [UserRole], [FullName], [Login], [Password]) VALUES (9, N'Авторизированный клиент', N'Старикова Елена Павловна', N'1qz4kw@mail.com', N'gynQMT')
GO
INSERT [dbo].[Users] ([UserId], [UserRole], [FullName], [Login], [Password]) VALUES (10, N'Авторизированный клиент', N'Сазонов Руслан Германович', N'4np6se@mail.com', N'AtnDjr')
GO
ALTER TABLE [dbo].[OrderComposition]  WITH CHECK ADD  CONSTRAINT [FK_OrderComposition_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderComposition] CHECK CONSTRAINT [FK_OrderComposition_Orders]
GO
ALTER TABLE [dbo].[OrderComposition]  WITH CHECK ADD  CONSTRAINT [FK_OrderComposition_Product] FOREIGN KEY([Article])
REFERENCES [dbo].[Product] ([Article])
GO
ALTER TABLE [dbo].[OrderComposition] CHECK CONSTRAINT [FK_OrderComposition_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_DeliveryPoints] FOREIGN KEY([DeliveryPointId])
REFERENCES [dbo].[DeliveryPoints] ([DeliveryPointId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_DeliveryPoints]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatuses] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[OrderStatuses] ([OrderStatus])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatuses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Deliverers] FOREIGN KEY([Deliverer])
REFERENCES [dbo].[Deliverers] ([Deliverer])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Deliverers]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturers] FOREIGN KEY([Manufacturer])
REFERENCES [dbo].[Manufacturers] ([Manufacturer])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturers]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategories] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[ProductCategories] ([ProductCategory])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRoles] FOREIGN KEY([UserRole])
REFERENCES [dbo].[UserRoles] ([UserRole])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRoles]
GO
