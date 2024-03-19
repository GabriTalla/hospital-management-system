USE [master]
GO
/****** Object:  Database [progetto01]    Script Date: 19/03/2024 10:45:43 ******/
CREATE DATABASE [progetto01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'progetto01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\progetto01.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'progetto01_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\progetto01_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [progetto01] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [progetto01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [progetto01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [progetto01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [progetto01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [progetto01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [progetto01] SET ARITHABORT OFF 
GO
ALTER DATABASE [progetto01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [progetto01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [progetto01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [progetto01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [progetto01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [progetto01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [progetto01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [progetto01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [progetto01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [progetto01] SET  DISABLE_BROKER 
GO
ALTER DATABASE [progetto01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [progetto01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [progetto01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [progetto01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [progetto01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [progetto01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [progetto01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [progetto01] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [progetto01] SET  MULTI_USER 
GO
ALTER DATABASE [progetto01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [progetto01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [progetto01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [progetto01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [progetto01] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [progetto01] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [progetto01] SET QUERY_STORE = ON
GO
ALTER DATABASE [progetto01] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [progetto01]
GO
/****** Object:  Table [dbo].[Appuntamenti]    Script Date: 19/03/2024 10:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appuntamenti](
	[ID_Appuntamento] [int] NOT NULL,
	[ID_Dottore] [int] NULL,
	[ID_Paziente] [int] NULL,
	[ID_Infermiere] [int] NULL,
	[Data] [date] NULL,
	[Ora] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Appuntamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dottori]    Script Date: 19/03/2024 10:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dottori](
	[ID_Dottore] [int] NOT NULL,
	[Nome] [varchar](15) NULL,
	[Cognome] [varchar](15) NULL,
	[Sesso] [varchar](1) NULL,
	[Data_di_nascita] [date] NULL,
	[ID_Reparto] [int] NULL,
	[ID_Intervento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Dottore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infermieri]    Script Date: 19/03/2024 10:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infermieri](
	[ID_Infermiere] [int] NOT NULL,
	[Nome] [varchar](15) NULL,
	[Cognome] [varchar](15) NULL,
	[Sesso] [varchar](1) NULL,
	[Data_di_nascita] [date] NULL,
	[ID_Reparto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Infermiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interventi]    Script Date: 19/03/2024 10:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interventi](
	[ID_Intervento] [int] NOT NULL,
	[ID_Paziente] [int] NULL,
	[ID_Dottore] [int] NULL,
	[Data] [date] NULL,
	[ora] [time](2) NULL,
	[Descrizione] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Intervento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pazienti]    Script Date: 19/03/2024 10:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pazienti](
	[ID_Paziente] [int] NOT NULL,
	[Nome] [varchar](50) NULL,
	[Cognome] [varchar](50) NULL,
	[Sesso] [varchar](1) NULL,
	[Data_di_nascita] [date] NULL,
	[ID_Stanza] [int] NULL,
	[ID_Dottore] [int] NULL,
	[ID_reparto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Paziente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reparto]    Script Date: 19/03/2024 10:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparto](
	[ID_Reparto] [int] NOT NULL,
	[Nome_Reparto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Reparto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salario]    Script Date: 19/03/2024 10:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salario](
	[Salario] [decimal](10, 2) NULL,
	[ID_Dottore] [int] NULL,
	[ID_Infermiere] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stanza]    Script Date: 19/03/2024 10:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stanza](
	[ID_Stanza] [int] NOT NULL,
	[nStanza] [int] NULL,
	[Stato] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Stanza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 19/03/2024 10:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[ID_Turno] [int] NOT NULL,
	[ID_Dottore] [int] NULL,
	[ID_Infermiere] [int] NULL,
	[Data] [date] NULL,
	[OraInizio] [time](7) NULL,
	[OraFine] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appuntamenti]  WITH CHECK ADD FOREIGN KEY([ID_Dottore])
REFERENCES [dbo].[Dottori] ([ID_Dottore])
GO
ALTER TABLE [dbo].[Appuntamenti]  WITH CHECK ADD FOREIGN KEY([ID_Infermiere])
REFERENCES [dbo].[Infermieri] ([ID_Infermiere])
GO
ALTER TABLE [dbo].[Appuntamenti]  WITH CHECK ADD FOREIGN KEY([ID_Paziente])
REFERENCES [dbo].[Pazienti] ([ID_Paziente])
GO
ALTER TABLE [dbo].[Dottori]  WITH CHECK ADD FOREIGN KEY([ID_Reparto])
REFERENCES [dbo].[Reparto] ([ID_Reparto])
GO
ALTER TABLE [dbo].[Infermieri]  WITH CHECK ADD FOREIGN KEY([ID_Reparto])
REFERENCES [dbo].[Reparto] ([ID_Reparto])
GO
ALTER TABLE [dbo].[Interventi]  WITH CHECK ADD FOREIGN KEY([ID_Dottore])
REFERENCES [dbo].[Dottori] ([ID_Dottore])
GO
ALTER TABLE [dbo].[Interventi]  WITH CHECK ADD FOREIGN KEY([ID_Paziente])
REFERENCES [dbo].[Pazienti] ([ID_Paziente])
GO
ALTER TABLE [dbo].[Pazienti]  WITH CHECK ADD FOREIGN KEY([ID_Stanza])
REFERENCES [dbo].[Stanza] ([ID_Stanza])
GO
ALTER TABLE [dbo].[Pazienti]  WITH CHECK ADD  CONSTRAINT [ID_Dottore] FOREIGN KEY([ID_Dottore])
REFERENCES [dbo].[Dottori] ([ID_Dottore])
GO
ALTER TABLE [dbo].[Pazienti] CHECK CONSTRAINT [ID_Dottore]
GO
ALTER TABLE [dbo].[Pazienti]  WITH CHECK ADD  CONSTRAINT [ID_Reparto] FOREIGN KEY([ID_reparto])
REFERENCES [dbo].[Reparto] ([ID_Reparto])
GO
ALTER TABLE [dbo].[Pazienti] CHECK CONSTRAINT [ID_Reparto]
GO
ALTER TABLE [dbo].[Salario]  WITH CHECK ADD FOREIGN KEY([ID_Dottore])
REFERENCES [dbo].[Dottori] ([ID_Dottore])
GO
ALTER TABLE [dbo].[Salario]  WITH CHECK ADD FOREIGN KEY([ID_Infermiere])
REFERENCES [dbo].[Infermieri] ([ID_Infermiere])
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD FOREIGN KEY([ID_Dottore])
REFERENCES [dbo].[Dottori] ([ID_Dottore])
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD FOREIGN KEY([ID_Infermiere])
REFERENCES [dbo].[Infermieri] ([ID_Infermiere])
GO
USE [master]
GO
ALTER DATABASE [progetto01] SET  READ_WRITE 
GO
