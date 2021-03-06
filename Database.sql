USE [master]
GO
/****** Object:  Database [MovieWeb]    Script Date: 16/06/2022 10:22:23 CH ******/
CREATE DATABASE [MovieWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MovieWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MovieWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MovieWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieWeb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MovieWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MovieWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieWeb] SET  MULTI_USER 
GO
ALTER DATABASE [MovieWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MovieWeb] SET QUERY_STORE = OFF
GO
USE [MovieWeb]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 16/06/2022 10:22:23 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [nvarchar](150) NOT NULL,
	[avatar] [varchar](max) NOT NULL,
	[displayname] [nvarchar](150) NOT NULL,
	[dob] [datetime] NOT NULL,
	[email] [varchar](150) NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [avatar], [displayname], [dob], [email], [roleID]) VALUES (N'admin', N'123456', N'1', N'Bảo Linh', CAST(N'2001-10-05T00:00:00.000' AS DateTime), N'linhnvbhe153459@fpt.edu.vn', 0)
GO
USE [master]
GO
ALTER DATABASE [MovieWeb] SET  READ_WRITE 
GO
