USE [Учебная]
GO
/****** Object:  Table [dbo].[Conferences1]    Script Date: 11.10.2023 20:56:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conferences1](
	[ID_конференции] [int] NOT NULL,
	[Название] [varchar](150) NULL,
	[Место_проведения] [varchar](150) NULL,
	[Дата] [date] NULL,
 CONSTRAINT [PK_Conferences1] PRIMARY KEY CLUSTERED 
(
	[ID_конференции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 11.10.2023 20:56:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[ID_организации] [int] NOT NULL,
	[Название] [varchar](150) NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[ID_организации] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scientists4]    Script Date: 11.10.2023 20:56:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scientists4](
	[ID_ученого] [int] NOT NULL,
	[Фамилия_ученого] [varchar](150) NULL,
	[ID_организации] [int] NULL,
	[Страна] [varchar](150) NULL,
	[Ученая_степень] [varchar](150) NULL,
	[ID_конференции] [int] NULL,
	[Тема_доклада] [varchar](150) NULL,
 CONSTRAINT [PK_Scientists4] PRIMARY KEY CLUSTERED 
(
	[ID_ученого] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Conferences1] ([ID_конференции], [Название], [Место_проведения], [Дата]) VALUES (1, N'Развитие современной науки в России', N'МГУ', CAST(N'2023-01-21' AS Date))
INSERT [dbo].[Conferences1] ([ID_конференции], [Название], [Место_проведения], [Дата]) VALUES (2, N'Развитие науки России в мире', N'МГИМО', CAST(N'2023-02-22' AS Date))
GO
INSERT [dbo].[Organization] ([ID_организации], [Название]) VALUES (1, N'ПЭК')
INSERT [dbo].[Organization] ([ID_организации], [Название]) VALUES (2, N'ГГТУ')
GO
INSERT [dbo].[Scientists4] ([ID_ученого], [Фамилия_ученого], [ID_организации], [Страна], [Ученая_степень], [ID_конференции], [Тема_доклада]) VALUES (1, N'Суханов', 1, N'Россия', N'доктор наук', 1, N'Развитие математики')
INSERT [dbo].[Scientists4] ([ID_ученого], [Фамилия_ученого], [ID_организации], [Страна], [Ученая_степень], [ID_конференции], [Тема_доклада]) VALUES (2, N'Шапедько', 2, N'Россия', N'кандидат наук', 2, N'Развитие физики')
INSERT [dbo].[Scientists4] ([ID_ученого], [Фамилия_ученого], [ID_организации], [Страна], [Ученая_степень], [ID_конференции], [Тема_доклада]) VALUES (3, N'Карпов', 2, N'Россия', N'доктор наук', 2, N'Развитие биологии')
INSERT [dbo].[Scientists4] ([ID_ученого], [Фамилия_ученого], [ID_организации], [Страна], [Ученая_степень], [ID_конференции], [Тема_доклада]) VALUES (4, N'Родермель', 1, N'Россия', N'кандидат наук', 1, N'Развитие информатики')
GO
ALTER TABLE [dbo].[Scientists4]  WITH CHECK ADD  CONSTRAINT [FK_Scientists4_Conferences1] FOREIGN KEY([ID_конференции])
REFERENCES [dbo].[Conferences1] ([ID_конференции])
GO
ALTER TABLE [dbo].[Scientists4] CHECK CONSTRAINT [FK_Scientists4_Conferences1]
GO
ALTER TABLE [dbo].[Scientists4]  WITH CHECK ADD  CONSTRAINT [FK_Scientists4_Organization] FOREIGN KEY([ID_организации])
REFERENCES [dbo].[Organization] ([ID_организации])
GO
ALTER TABLE [dbo].[Scientists4] CHECK CONSTRAINT [FK_Scientists4_Organization]
GO
