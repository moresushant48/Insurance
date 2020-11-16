USE [master]
GO

/****** Object:  Database [insurance]    Script Date: 16-11-2020 11:52:38 ******/
CREATE DATABASE [insurance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'insurance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\insurance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'insurance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\insurance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [insurance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [insurance] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [insurance] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [insurance] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [insurance] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [insurance] SET ARITHABORT OFF 
GO

ALTER DATABASE [insurance] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [insurance] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [insurance] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [insurance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [insurance] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [insurance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [insurance] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [insurance] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [insurance] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [insurance] SET  DISABLE_BROKER 
GO

ALTER DATABASE [insurance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [insurance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [insurance] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [insurance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [insurance] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [insurance] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [insurance] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [insurance] SET RECOVERY FULL 
GO

ALTER DATABASE [insurance] SET  MULTI_USER 
GO

ALTER DATABASE [insurance] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [insurance] SET DB_CHAINING OFF 
GO

ALTER DATABASE [insurance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [insurance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [insurance] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [insurance] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [insurance] SET QUERY_STORE = OFF
GO

ALTER DATABASE [insurance] SET  READ_WRITE 
GO


USE [insurance]
GO

/****** Object:  Table [dbo].[agents]    Script Date: 16-11-2020 11:52:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[agents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](20) NOT NULL,
	[mname] [varchar](20) NOT NULL,
	[lname] [varchar](20) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[pincode] [varchar](6) NOT NULL,
	[password] [varchar](20) NOT NULL
) ON [PRIMARY]
GO

USE [insurance]
GO

/****** Object:  Table [dbo].[customers]    Script Date: 16-11-2020 11:52:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](20) NOT NULL,
	[mname] [varchar](20) NOT NULL,
	[lname] [varchar](20) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[dob] [varchar](20) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[pincode] [varchar](6) NOT NULL,
	[mother] [varchar](20) NOT NULL,
	[mstatus] [varchar](1) NOT NULL,
	[father] [varchar](20) NOT NULL,
	[fstatus] [varchar](1) NOT NULL,
	[married] [varchar](1) NOT NULL,
	[spouse] [varchar](20) NOT NULL
) ON [PRIMARY]
GO

USE [insurance]
GO

/****** Object:  Table [dbo].[custpolicy]    Script Date: 16-11-2020 11:53:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[custpolicy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[policy_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[agent_id] [int] NOT NULL,
	[sum] [float] NOT NULL,
	[payment_period] [int] NOT NULL,
	[insurance_period] [int] NOT NULL,
	[premium_mode] [varchar](1) NOT NULL
) ON [PRIMARY]
GO

USE [insurance]
GO

/****** Object:  Table [dbo].[policies]    Script Date: 16-11-2020 11:53:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[policies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[policy_name] [varchar](50) NOT NULL,
	[policy_desc] [varchar](500) NOT NULL
) ON [PRIMARY]
GO

