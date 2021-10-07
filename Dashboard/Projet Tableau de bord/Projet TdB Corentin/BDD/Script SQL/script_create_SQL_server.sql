/*Article*/
CREATE TABLE [dbo].[ARTICLE](
	[idArticle] [int] IDENTITY(1,1) NOT NULL,
	[titre] [varchar](1000) NOT NULL,
	[datePubli] [varchar](50) NULL,
	[siteArticle] [varchar](50) NOT NULL,
	[lien] [varchar](100) NOT NULL,
	[typeArticle] [varchar](50) NULL,
 CONSTRAINT [PK_ARTICLE] PRIMARY KEY CLUSTERED 
(
	[idArticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*Auteur*/
CREATE TABLE [dbo].[AUTEUR](
	[idAuteur] [int] IDENTITY(1,1) NOT NULL,
	[nomAuteur] [varchar](50) NOT NULL,
	[prenomAuteur] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AUTEUR] PRIMARY KEY CLUSTERED 
(
	[idAuteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*Keyword*/
CREATE TABLE [dbo].[KEYWORD](
	[idMot] [int] IDENTITY(1,1) NOT NULL,
	[Mot] [varchar](50) NOT NULL,
	[Categ] [char](10) NULL,
 CONSTRAINT [PK_KEYWORD] PRIMARY KEY CLUSTERED 
(
	[idMot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*Sport*/
CREATE TABLE [dbo].[SPORT](
	[idSport] [int] IDENTITY(1,1) NOT NULL,
	[nomSport] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SPORT] PRIMARY KEY CLUSTERED 
(
	[idSport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*Competition*/
CREATE TABLE [dbo].[COMPETITION](
	[idCompet] [int] IDENTITY(1,1) NOT NULL,
	[libCompet] [varchar](50) NOT NULL,
 CONSTRAINT [PK_COMPETITION] PRIMARY KEY CLUSTERED 
(
	[idCompet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*Ecrire*/
CREATE TABLE [dbo].[ECRIRE](
	[idArticle] [int] NOT NULL,
	[idAuteur] [int] NOT NULL,
 CONSTRAINT [PK_ECRIRE] PRIMARY KEY CLUSTERED 
(
	[idArticle] ASC,
	[idAuteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ECRIRE]  WITH CHECK ADD  CONSTRAINT [FK_ECRIRE_ARTICLE] FOREIGN KEY([idArticle])
REFERENCES [dbo].[ARTICLE] ([idArticle])
GO

ALTER TABLE [dbo].[ECRIRE] CHECK CONSTRAINT [FK_ECRIRE_ARTICLE]
GO

ALTER TABLE [dbo].[ECRIRE]  WITH CHECK ADD  CONSTRAINT [FK_ECRIRE_AUTEUR] FOREIGN KEY([idAuteur])
REFERENCES [dbo].[AUTEUR] ([idAuteur])
GO

ALTER TABLE [dbo].[ECRIRE] CHECK CONSTRAINT [FK_ECRIRE_AUTEUR]
GO

/*Contenir*/
CREATE TABLE [dbo].[CONTENIR](
	[idArticle] [int] NOT NULL,
	[idMot] [int] NOT NULL,
 CONSTRAINT [PK_CONTENIR] PRIMARY KEY CLUSTERED 
(
	[idArticle] ASC,
	[idMot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CONTENIR]  WITH CHECK ADD  CONSTRAINT [FK_CONTENIR_ARTICLE] FOREIGN KEY([idArticle])
REFERENCES [dbo].[ARTICLE] ([idArticle])
GO

ALTER TABLE [dbo].[CONTENIR] CHECK CONSTRAINT [FK_CONTENIR_ARTICLE]
GO

ALTER TABLE [dbo].[CONTENIR]  WITH CHECK ADD  CONSTRAINT [FK_CONTENIR_KEYWORD] FOREIGN KEY([idMot])
REFERENCES [dbo].[KEYWORD] ([idMot])
GO

ALTER TABLE [dbo].[CONTENIR] CHECK CONSTRAINT [FK_CONTENIR_KEYWORD]
GO


/*Concerner*/
CREATE TABLE [dbo].[CONCERNER](
	[idArticle] [int] NOT NULL,
	[idCompet] [int] NOT NULL,
 CONSTRAINT [PK_CONCERNER] PRIMARY KEY CLUSTERED 
(
	[idArticle] ASC,
	[idCompet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CONCERNER]  WITH CHECK ADD  CONSTRAINT [FK_CONCERNER_ARTICLE] FOREIGN KEY([idArticle])
REFERENCES [dbo].[ARTICLE] ([idArticle])
GO

ALTER TABLE [dbo].[CONCERNER] CHECK CONSTRAINT [FK_CONCERNER_ARTICLE]
GO

ALTER TABLE [dbo].[CONCERNER]  WITH CHECK ADD  CONSTRAINT [FK_CONCERNER_COMPETITION] FOREIGN KEY([idCompet])
REFERENCES [dbo].[COMPETITION] ([idCompet])
GO

ALTER TABLE [dbo].[CONCERNER] CHECK CONSTRAINT [FK_CONCERNER_COMPETITION]
GO

/*Toucher*/
CREATE TABLE [dbo].[TOUCHER](
	[idArticle] [int] NOT NULL,
	[idSport] [int] NOT NULL,
 CONSTRAINT [PK_TOUCHER] PRIMARY KEY CLUSTERED 
(
	[idArticle] ASC,
	[idSport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TOUCHER]  WITH CHECK ADD  CONSTRAINT [FK_TOUCHER_ARTICLE] FOREIGN KEY([idArticle])
REFERENCES [dbo].[ARTICLE] ([idArticle])
GO

ALTER TABLE [dbo].[TOUCHER] CHECK CONSTRAINT [FK_TOUCHER_ARTICLE]
GO

ALTER TABLE [dbo].[TOUCHER]  WITH CHECK ADD  CONSTRAINT [FK_TOUCHER_SPORT] FOREIGN KEY([idArticle])
REFERENCES [dbo].[SPORT] ([idSport])
GO

ALTER TABLE [dbo].[TOUCHER] CHECK CONSTRAINT [FK_TOUCHER_SPORT]
GO