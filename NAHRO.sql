USE [NAHRO]
GO
/****** Object:  StoredProcedure [dbo].[spGetNewManagers]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spGetNewManagers]
GO
/****** Object:  StoredProcedure [dbo].[spGetNewAssociates]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spGetNewAssociates]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllManagers]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spGetAllManagers]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllEmployees]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spGetAllEmployees]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllAssociates]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spGetAllAssociates]
GO
/****** Object:  StoredProcedure [dbo].[spGetAgencyDetailsById]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spGetAgencyDetailsById]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteManagers]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spDeleteManagers]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteEmployee]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spDeleteEmployee]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteAssociate]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spDeleteAssociate]
GO
/****** Object:  StoredProcedure [dbo].[spCheckEmail]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spCheckEmail]
GO
/****** Object:  StoredProcedure [dbo].[spAddManager]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spAddManager]
GO
/****** Object:  StoredProcedure [dbo].[spAddAssociate]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[spAddAssociate]
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP PROCEDURE [dbo].[AddEmployee]
GO
/****** Object:  Table [dbo].[GroupManagers]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP TABLE [dbo].[GroupManagers]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP TABLE [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Associates]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP TABLE [dbo].[Associates]
GO
/****** Object:  Table [dbo].[Agencies]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP TABLE [dbo].[Agencies]
GO
USE [master]
GO
/****** Object:  Database [NAHRO]    Script Date: 8/19/2018 1:46:29 AM ******/
DROP DATABASE [NAHRO]
GO
/****** Object:  Database [NAHRO]    Script Date: 8/19/2018 1:46:29 AM ******/
CREATE DATABASE [NAHRO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NAHRO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\NAHRO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NAHRO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\NAHRO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NAHRO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NAHRO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NAHRO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NAHRO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NAHRO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NAHRO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NAHRO] SET ARITHABORT OFF 
GO
ALTER DATABASE [NAHRO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NAHRO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NAHRO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NAHRO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NAHRO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NAHRO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NAHRO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NAHRO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NAHRO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NAHRO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NAHRO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NAHRO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NAHRO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NAHRO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NAHRO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NAHRO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NAHRO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NAHRO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NAHRO] SET  MULTI_USER 
GO
ALTER DATABASE [NAHRO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NAHRO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NAHRO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NAHRO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NAHRO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NAHRO] SET QUERY_STORE = OFF
GO
USE [NAHRO]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [NAHRO]
GO
/****** Object:  Table [dbo].[Agencies]    Script Date: 8/19/2018 1:46:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AgencyName] [varchar](150) NULL,
	[Address] [varchar](250) NULL,
 CONSTRAINT [PK_Agencies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Associates]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Associates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [varchar](50) NULL,
	[Name] [varchar](250) NULL,
	[JobTitle] [varchar](250) NULL,
	[Email] [varchar](250) NULL,
	[MembershipType] [varchar](50) NULL,
	[IsMember] [bit] NULL,
	[MembershipStartDate] [datetime] NULL,
	[MembershipEndDate] [datetime] NULL,
	[CurrentOrder] [varchar](250) NULL,
	[ProformaOrder] [varchar](250) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Associates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [varchar](50) NULL,
	[Prefix] [varchar](50) NULL,
	[FirstName] [varchar](150) NULL,
	[MiddleName] [varchar](150) NULL,
	[LastName] [varchar](150) NULL,
	[Suffix] [varchar](50) NULL,
	[NickName] [varchar](150) NULL,
	[AgencyId] [int] NULL,
	[JobTitle] [varchar](250) NULL,
	[Email] [varchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[MembershipType] [varchar](50) NULL,
	[IsMember] [bit] NULL,
	[MembershipStartDate] [datetime] NULL,
	[MembershipEndDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupManagers]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupManagers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [varchar](50) NULL,
	[Name] [varchar](250) NULL,
	[JobTitle] [varchar](250) NULL,
	[Email] [varchar](250) NULL,
	[MembershipType] [varchar](50) NULL,
	[IsMember] [bit] NULL,
	[MembershipStartDate] [datetime] NULL,
	[MembershipEndDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_GroupManagers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agencies] ON 
GO
INSERT [dbo].[Agencies] ([Id], [AgencyName], [Address]) VALUES (1, N'National Association of Housing and Redevelopment Officials', N'630 I St NW
Washington, DC 20001-3736')
GO
SET IDENTITY_INSERT [dbo].[Agencies] OFF
GO
SET IDENTITY_INSERT [dbo].[Associates] ON 
GO
INSERT [dbo].[Associates] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [CurrentOrder], [ProformaOrder], [IsDeleted]) VALUES (1, N'00000001', N'test', N'test', N'test@test.com', N'Test', 1, CAST(N'2018-08-19T00:54:35.497' AS DateTime), CAST(N'2018-08-15T06:24:11.487' AS DateTime), N'0000000003A5', N'0000000003A5', 0)
GO
INSERT [dbo].[Associates] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [CurrentOrder], [ProformaOrder], [IsDeleted]) VALUES (2, N'00000002', N'test', N'test', N'test@test.com', N'Test', 1, CAST(N'2018-08-13T20:07:18.113' AS DateTime), NULL, N'0000000003A5', N'0000000003A5', 0)
GO
INSERT [dbo].[Associates] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [CurrentOrder], [ProformaOrder], [IsDeleted]) VALUES (3, N'00000003', N'test', N'test', N'test@test.com', N'Test', 1, CAST(N'2018-08-19T00:58:56.107' AS DateTime), NULL, N'0000000003A5', N'0000000003A5', 0)
GO
INSERT [dbo].[Associates] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [CurrentOrder], [ProformaOrder], [IsDeleted]) VALUES (4, N'00000001', N'test', N'test', N'test@test.com', N'Test', 0, CAST(N'2018-08-19T00:54:35.500' AS DateTime), CAST(N'2018-08-15T06:24:11.487' AS DateTime), N'0000000003A5', N'0000000003A5', 0)
GO
INSERT [dbo].[Associates] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [CurrentOrder], [ProformaOrder], [IsDeleted]) VALUES (5, N'00000002', N'test', N'test', N'test@test.com', N'Test', 0, CAST(N'2018-08-13T20:07:18.113' AS DateTime), NULL, N'0000000003A5', N'0000000003A5', 0)
GO
INSERT [dbo].[Associates] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [CurrentOrder], [ProformaOrder], [IsDeleted]) VALUES (6, N'00000003', N'test', N'test', N'test@test.com', N'Test', 1, CAST(N'2018-08-19T01:00:08.313' AS DateTime), NULL, N'0000000003A5', N'0000000003A5', 0)
GO
SET IDENTITY_INSERT [dbo].[Associates] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([Id], [EmpId], [Prefix], [FirstName], [MiddleName], [LastName], [Suffix], [NickName], [AgencyId], [JobTitle], [Email], [Phone], [Fax], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (3, N'00000001', N'Mr', N'test', N'M', N'L', N'S', N'N', 1, N'test', N'test@test.com', N'12345', N'12345', N'Test', 1, CAST(N'2018-08-17T13:08:41.390' AS DateTime), CAST(N'2018-08-15T23:58:11.133' AS DateTime), 0)
GO
INSERT [dbo].[Employees] ([Id], [EmpId], [Prefix], [FirstName], [MiddleName], [LastName], [Suffix], [NickName], [AgencyId], [JobTitle], [Email], [Phone], [Fax], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (4, N'00000002', N'Mr', N'test', N'M', N'L', N'S', N'N', 1, N'test', N'test@test.com', N'12345', N'12345', N'Test', 1, CAST(N'2018-08-17T13:08:41.390' AS DateTime), CAST(N'2018-08-15T23:29:11.480' AS DateTime), 0)
GO
INSERT [dbo].[Employees] ([Id], [EmpId], [Prefix], [FirstName], [MiddleName], [LastName], [Suffix], [NickName], [AgencyId], [JobTitle], [Email], [Phone], [Fax], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (5, N'00000003', N'Mr', N'test', N'M', N'L', N'S', N'N', 1, N'test', N'test@test.com', N'12345', N'12345', N'Test', 1, CAST(N'2018-08-17T13:08:41.390' AS DateTime), CAST(N'2018-08-15T16:32:12.513' AS DateTime), 0)
GO
INSERT [dbo].[Employees] ([Id], [EmpId], [Prefix], [FirstName], [MiddleName], [LastName], [Suffix], [NickName], [AgencyId], [JobTitle], [Email], [Phone], [Fax], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (6, N'00000004', N'Mr', N'test', N'M', N'L', N'S', N'N', 1, N'test', N'test@test.com', N'12345', N'12345', N'Test', 1, CAST(N'2018-08-17T13:08:41.390' AS DateTime), CAST(N'2018-08-15T06:05:16.660' AS DateTime), 0)
GO
INSERT [dbo].[Employees] ([Id], [EmpId], [Prefix], [FirstName], [MiddleName], [LastName], [Suffix], [NickName], [AgencyId], [JobTitle], [Email], [Phone], [Fax], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (7, N'00000005', N'Mr', N'test', N'M', N'L', N'S', N'N', 1, N'test', N'test@test.com', N'12345', N'12345', N'Test', 1, CAST(N'2018-08-17T13:08:41.390' AS DateTime), CAST(N'2018-08-15T16:02:15.690' AS DateTime), 0)
GO
INSERT [dbo].[Employees] ([Id], [EmpId], [Prefix], [FirstName], [MiddleName], [LastName], [Suffix], [NickName], [AgencyId], [JobTitle], [Email], [Phone], [Fax], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (8, N'00000006', N'Mr', N'test', N'M', N'L', N'S', N'N', 1, N'test', N'test@test.com', N'12345', N'12345', N'Test', 1, CAST(N'2018-08-17T13:08:41.390' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Employees] ([Id], [EmpId], [Prefix], [FirstName], [MiddleName], [LastName], [Suffix], [NickName], [AgencyId], [JobTitle], [Email], [Phone], [Fax], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (9, N'00000007', N'Mr', N'test', N'M', N'L', N'S', N'N', 1, N'test', N'test@test.com', N'12345', NULL, N'Test', 1, CAST(N'2018-08-17T13:08:41.390' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Employees] ([Id], [EmpId], [Prefix], [FirstName], [MiddleName], [LastName], [Suffix], [NickName], [AgencyId], [JobTitle], [Email], [Phone], [Fax], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (10, N'9', N'', N'Mohd', N'', N'Hasan', N'', N'', 1, N'Test', N'test1@test.com', N'', N'', N'test', 1, CAST(N'2018-08-19T01:44:41.220' AS DateTime), CAST(N'2018-08-19T01:44:41.220' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupManagers] ON 
GO
INSERT [dbo].[GroupManagers] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (1, N'00000003', N'test', N'test', N'test@test.com', N'Test', 1, CAST(N'2018-08-19T00:54:02.993' AS DateTime), CAST(N'2018-08-13T20:35:08.803' AS DateTime), 0)
GO
INSERT [dbo].[GroupManagers] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (2, N'00000002', N'test', N'test', N'test@test.com', N'Test', 1, CAST(N'2018-08-13T20:08:05.640' AS DateTime), NULL, 0)
GO
INSERT [dbo].[GroupManagers] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (3, N'00000001', N'test', N'test', N'test@test.com', N'Test', 1, CAST(N'2018-08-19T01:00:18.627' AS DateTime), NULL, 0)
GO
INSERT [dbo].[GroupManagers] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (4, N'00000004', N'test', N'test', N'test@test.com', N'Test', 0, CAST(N'2018-08-19T00:54:02.993' AS DateTime), CAST(N'2018-08-13T20:35:08.803' AS DateTime), 0)
GO
INSERT [dbo].[GroupManagers] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (5, N'00000005', N'test', N'test', N'test@test.com', N'Test', 0, CAST(N'2018-08-13T20:08:05.640' AS DateTime), NULL, 0)
GO
INSERT [dbo].[GroupManagers] ([Id], [EmpId], [Name], [JobTitle], [Email], [MembershipType], [IsMember], [MembershipStartDate], [MembershipEndDate], [IsDeleted]) VALUES (6, N'00000006', N'test', N'test', N'test@test.com', N'Test', 0, CAST(N'2018-08-13T20:08:09.570' AS DateTime), NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[GroupManagers] OFF
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddEmployee]
	-- Add the parameters for the stored procedure here
	@prefix varchar(250) = '',
	@fname varchar(250) = '',
	@mname varchar(250) = '',
	@lname varchar(250) = '',
	@nickname varchar(250) = '',
	@suffix varchar(250) = '',
	@email varchar(250) = '',
	@agencyId int = 0,
	@phone varchar(250) = '',
	@fax varchar(250) = '',
	@jobTitle varchar(50) = ''


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @id int;
	select top 1 @id = Id from Employees order by ID desc
    -- Insert statements for procedure here
	Insert into Employees(EmpId,Prefix,FirstName,MiddleName,LastName,Suffix,NickName,AgencyId,JobTitle,Email,Phone,Fax,MembershipType,IsMember,MembershipStartDate,MembershipEndDate,IsDeleted)
	Values('0000000' + @id,@prefix,@fname,@mname,@lname,@suffix,@nickname,@agencyId,@jobTitle,@email,@phone,@fax,'test',1,getdate(),getdate(),0 )
END
GO
/****** Object:  StoredProcedure [dbo].[spAddAssociate]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddAssociate]
	-- Add the parameters for the stored procedure here
	@id int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Associates
	set IsDeleted = 0, IsMember = 1, MembershipStartDate = GETDATE()
	where Id = @id

	
END
GO
/****** Object:  StoredProcedure [dbo].[spAddManager]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddManager]
	-- Add the parameters for the stored procedure here
	@id int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update GroupManagers
	set IsDeleted = 0, IsMember = 1, MembershipStartDate = GETDATE()
	where Id = @id

	
END
GO
/****** Object:  StoredProcedure [dbo].[spCheckEmail]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCheckEmail]
	-- Add the parameters for the stored procedure here
(
@email varchar(250) = ''
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	If Exists(Select email from Employees where email = @email)
	Begin
	Select 'exist'
	End
	Else
	Select 'no'
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteAssociate]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteAssociate]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Associates 
	Set isDeleted = 1,
	MembershipEndDate = GETDATE()
	where Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteEmployee]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteEmployee]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Employees 
	Set isDeleted = 1,
	MembershipEndDate = GETDATE()
	where Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteManagers]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteManagers]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update GroupManagers 
	Set isDeleted = 1,
	MembershipEndDate = GETDATE()
	where Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAgencyDetailsById]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAgencyDetailsById]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from [dbo].[Agencies] where Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllAssociates]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllAssociates]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Associates where isDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllEmployees]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllEmployees]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Employees where isDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllManagers]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllManagers]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from GroupManagers where isDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[spGetNewAssociates]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spGetNewAssociates]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Associates where isDeleted = 1 or IsMember = 0 
END
GO
/****** Object:  StoredProcedure [dbo].[spGetNewManagers]    Script Date: 8/19/2018 1:46:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[spGetNewManagers]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from GroupManagers where isDeleted = 1 or IsMember = 0
END
GO
USE [master]
GO
ALTER DATABASE [NAHRO] SET  READ_WRITE 
GO
