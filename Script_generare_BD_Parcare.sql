﻿USE [Parcare]
GO
/****** Object:  Table [dbo].[Masina]    Script Date: 11/7/2016 4:56:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masina](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[Numar] [varchar](8) NOT NULL,
	[Culoare] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Masina] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Model]    Script Date: 11/7/2016 4:56:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProducatorID] [int] NOT NULL,
	[Nume] [nvarchar](50) NOT NULL,
	[An] [int] NOT NULL,
	[Activ] [bit] NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nivel]    Script Date: 11/7/2016 4:56:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nivel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](4) NOT NULL,
	[CostIntretinere] [decimal](10, 2) NOT NULL,
	[Regiune] [char](1) NOT NULL,
 CONSTRAINT [PK_Nivel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producator]    Script Date: 11/7/2016 4:56:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](50) NOT NULL,
	[Activ] [bit] NOT NULL,
 CONSTRAINT [PK_Producator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vizita]    Script Date: 11/7/2016 4:56:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vizita](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MasinaID] [int] NOT NULL,
	[NivelID] [int] NOT NULL,
	[DataSosire] [datetime] NOT NULL,
	[DataPlecare] [datetime] NOT NULL,
 CONSTRAINT [PK_Vizita] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Masina]  WITH CHECK ADD  CONSTRAINT [FK_Masina_Model] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Model] ([ID])
GO
ALTER TABLE [dbo].[Masina] CHECK CONSTRAINT [FK_Masina_Model]
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_Producator] FOREIGN KEY([ProducatorID])
REFERENCES [dbo].[Producator] ([ID])
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_Model_Producator]
GO
ALTER TABLE [dbo].[Vizita]  WITH CHECK ADD  CONSTRAINT [FK_Vizita_Masina] FOREIGN KEY([MasinaID])
REFERENCES [dbo].[Masina] ([ID])
GO
ALTER TABLE [dbo].[Vizita] CHECK CONSTRAINT [FK_Vizita_Masina]
GO
ALTER TABLE [dbo].[Vizita]  WITH CHECK ADD  CONSTRAINT [FK_Vizita_Nivel] FOREIGN KEY([NivelID])
REFERENCES [dbo].[Nivel] ([ID])
GO
ALTER TABLE [dbo].[Vizita] CHECK CONSTRAINT [FK_Vizita_Nivel]
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [Constrangere_An_Model] CHECK  (([An]>(1900) AND [An]<=datepart(year,getdate())))
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [Constrangere_An_Model]
GO
ALTER TABLE [dbo].[Nivel]  WITH CHECK ADD  CONSTRAINT [ConstrangereRegiuneParcare] CHECK  (([Regiune]='R' OR [Regiune]='L'))
GO
ALTER TABLE [dbo].[Nivel] CHECK CONSTRAINT [ConstrangereRegiuneParcare]
GO
