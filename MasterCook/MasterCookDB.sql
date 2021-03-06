USE [master]
GO
/****** Object:  Database [RecipeWebDB]    Script Date: 11/02/2017 08:55:26 AM ******/
CREATE DATABASE [RecipeWebDB]
 GO
ALTER DATABASE [RecipeWebDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RecipeWebDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RecipeWebDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RecipeWebDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RecipeWebDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RecipeWebDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RecipeWebDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RecipeWebDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RecipeWebDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RecipeWebDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RecipeWebDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RecipeWebDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RecipeWebDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RecipeWebDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RecipeWebDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RecipeWebDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RecipeWebDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RecipeWebDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RecipeWebDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RecipeWebDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RecipeWebDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RecipeWebDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RecipeWebDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RecipeWebDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RecipeWebDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RecipeWebDB] SET  MULTI_USER 
GO
ALTER DATABASE [RecipeWebDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RecipeWebDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RecipeWebDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RecipeWebDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RecipeWebDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [RecipeWebDB]
GO
/****** Object:  Table [dbo].[tbl_Article]    Script Date: 11/02/2017 08:55:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Article](
	[ArticleID] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ContentURL] [nvarchar](200) NOT NULL,
	[AuthorID] [nvarchar](10) NOT NULL,
	[ReviewerID] [nvarchar](10) NULL,
	[ApproverID] [nvarchar](10) NULL,
	[DateTime] [datetime] NOT NULL,
	[SubcategoryID] [nvarchar](10) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[LastModifiedDateTime] [datetime] NULL,
	[Views] [int] NOT NULL,
	[LastEditorID] [nvarchar](10) NULL,
	[Reason] [nvarchar](500) NULL,
 CONSTRAINT [PK_tbl_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 11/02/2017 08:55:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[CategoryID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Comment]    Script Date: 11/02/2017 08:55:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Comment](
	[CommentID] [nvarchar](10) NOT NULL,
	[GuestName] [nvarchar](200) NOT NULL,
	[GuestEmail] [nvarchar](30) NULL,
	[GuestPhone] [nvarchar](12) NULL,
	[CommentContent] [nvarchar](4000) NOT NULL,
	[Datetime] [datetime] NOT NULL,
	[ArticleID] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Staff]    Script Date: 11/02/2017 08:55:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Staff](
	[StaffID] [nvarchar](10) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Gender] [nvarchar](13) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Role] [nvarchar](13) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Subcategory]    Script Date: 11/02/2017 08:55:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Subcategory](
	[SubcategoryID] [nvarchar](10) NOT NULL,
	[CategoryID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Subcategory] PRIMARY KEY CLUSTERED 
(
	[SubcategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_WorkingSubcategory]    Script Date: 11/02/2017 08:55:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_WorkingSubcategory](
	[StaffID] [nvarchar](10) NOT NULL,
	[SubcategoryID] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_WorkingSubcategory] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC,
	[SubcategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'1', N'Caribbean beef patties', N'02_1508894914900.txt', N'02', N'13', N'19', CAST(N'2017-08-25 08:28:34.920' AS DateTime), N'14', N'Accepted', CAST(N'2017-11-02 08:21:56.207' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'10', N'The truth about low-fat foods', N'03_1508940796683.txt', N'03', N'13', N'18', CAST(N'2017-08-21 21:13:16.713' AS DateTime), N'02', N'Accepted', CAST(N'2017-08-29 11:17:05.017' AS DateTime), 6, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'100', N'Teriyaki tuna skewers', N'09_1509438247122.txt', N'09', N'13', N'19', CAST(N'2017-10-31 15:24:07.137' AS DateTime), N'09', N'Accepted', CAST(N'2017-11-02 08:14:58.353' AS DateTime), 9, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'101', N'SHINJI BY KANESAKA (CARLTON HOTEL AND ST. REGIS)', N'03_1509438278925.txt', N'03', N'13', N'19', CAST(N'2017-10-31 15:24:38.933' AS DateTime), N'17', N'Accepted', CAST(N'2017-11-02 08:14:46.063' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'102', N'AOKI JAPANESE RESTAURANT', N'03_1509438374908.txt', N'03', N'13', N'19', CAST(N'2017-10-31 15:26:14.917' AS DateTime), N'18', N'Accepted', CAST(N'2017-11-02 08:14:32.827' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'103', N'TONKICHI RESTAURANT AT NGHEE ANN CITY', N'03_1509438484486.txt', N'03', N'13', N'19', CAST(N'2017-10-31 15:28:04.497' AS DateTime), N'16', N'Accepted', CAST(N'2017-11-02 08:14:17.247' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'104', N'YAYOIKEN JAPANESE RESTAURANT AT LIANG COURT', N'03_1509438551998.txt', N'03', N'13', N'19', CAST(N'2017-10-31 15:29:12.007' AS DateTime), N'17', N'Accepted', CAST(N'2017-11-02 08:13:13.740' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'11', N'Moroccan meatball tagine with lemon & olives', N'04_1508941135702.txt', N'04', N'13', N'19', CAST(N'2017-08-29 21:18:55.747' AS DateTime), N'13', N'Accepted', CAST(N'2017-11-02 08:21:46.710' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'12', N'Aromatic lamb with dates', N'04_1508941368607.txt', N'04', N'13', N'19', CAST(N'2017-09-02 21:22:48.620' AS DateTime), N'13', N'Accepted', CAST(N'2017-11-02 08:21:32.193' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'13', N'Pumpkin, cranberry & red onion tagine', N'04_1508942587343.txt', N'04', NULL, NULL, CAST(N'2017-09-05 21:43:07.350' AS DateTime), N'13', N'Pending for Employee', NULL, 1, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'14', N'Roast cod with paella & saffron olive oil', N'04_1508943032354.txt', N'04', NULL, NULL, CAST(N'2017-09-11 21:50:32.397' AS DateTime), N'11', N'Pending for Employee', NULL, 1, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'15', N'Churros with chocolate dipping sauce', N'04_1508943408273.txt', N'04', N'17', N'19', CAST(N'2017-09-12 21:56:48.277' AS DateTime), N'11', N'Accepted', CAST(N'2017-11-02 08:20:46.867' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'16', N'Spanish fig & almond balls', N'04_1508943563646.txt', N'04', NULL, NULL, CAST(N'2017-09-13 21:59:23.703' AS DateTime), N'11', N'Pending for Employee', NULL, 1, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'17', N'Easiest ever paella', N'04_1508943707058.txt', N'04', NULL, NULL, CAST(N'2017-09-13 22:01:47.093' AS DateTime), N'11', N'Pending for Employee', NULL, 1, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'18', N'Texas BBQ medley', N'05_1508945263622.txt', N'05', N'14', N'18', CAST(N'2017-09-21 22:27:43.627' AS DateTime), N'06', N'Accepted', CAST(N'2017-09-21 23:27:43.627' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'19', N'BBQ pulled pork', N'05_1508945614958.txt', N'05', N'14', N'18', CAST(N'2017-09-27 22:33:34.963' AS DateTime), N'06', N'Accepted', CAST(N'2017-09-28 00:33:34.963' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'2', N'Sticky jerk salmon with mango slaw', N'02_1508895064222.txt', N'02', N'13', N'18', CAST(N'2017-09-27 08:31:04.230' AS DateTime), N'14', N'Accepted', CAST(N'2017-09-28 08:31:04.230' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'20', N'Simple seafood chowder', N'05_1508945881475.txt', N'05', N'15', N'18', CAST(N'2017-09-30 22:38:01.487' AS DateTime), N'06', N'Accepted', CAST(N'2017-10-02 22:38:01.487' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'21', N'Key lime pie', N'05_1508946104582.txt', N'05', N'14', N'18', CAST(N'2017-09-28 22:41:44.587' AS DateTime), N'06', N'Accepted', CAST(N'2017-09-29 00:00:00.000' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'22', N'New York Cheesecake', N'05_1508946382549.txt', N'05', N'14', N'18', CAST(N'2017-09-29 22:46:22.577' AS DateTime), N'06', N'Accepted', CAST(N'2017-09-30 00:00:00.000' AS DateTime), 11, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'23', N'Beer Glazed Brats and Sauerkraut', N'05_1508946813812.txt', N'05', N'15', N'18', CAST(N'2017-10-11 22:53:33.857' AS DateTime), N'07', N'Accepted', CAST(N'2017-10-13 22:53:33.857' AS DateTime), 7, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'24', N'Lengenberg''s Boiled Potatoes', N'05_1508947277995.txt', N'05', N'15', N'18', CAST(N'2017-10-09 23:01:18.000' AS DateTime), N'07', N'Accepted', CAST(N'2017-10-13 23:01:18.000' AS DateTime), 6, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'25', N'German Beef Rouladen', N'05_1508947539410.txt', N'05', NULL, NULL, CAST(N'2017-10-02 23:05:39.453' AS DateTime), N'07', N'Pending for Employee', NULL, 1, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'26', N'Papa Drexler''s Bavarian Pretzels', N'05_1508947825447.txt', N'05', N'14', N'18', CAST(N'2017-10-02 23:10:25.450' AS DateTime), N'07', N'Accepted', CAST(N'2017-11-02 08:03:06.593' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'27', N'Authentic German Potato Salad', N'05_1508948072272.txt', N'05', N'15', N'18', CAST(N'2017-10-08 23:14:32.277' AS DateTime), N'07', N'Accepted', CAST(N'2017-10-10 23:14:32.277' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'28', N'Spicy BBQ chicken drumettes', N'05_1508949066121.txt', N'05', N'17', N'18', CAST(N'2017-09-29 23:31:06.127' AS DateTime), N'10', N'Accepted', CAST(N'2017-09-29 23:57:06.127' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'29', N'Noodles with blackbean sauce', N'05_1508949645167.txt', N'05', N'17', N'18', CAST(N'2017-09-29 23:40:45.243' AS DateTime), N'10', N'Accepted', CAST(N'2017-09-29 23:58:45.243' AS DateTime), 9, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'3', N'Jerk chicken with rice & peas', N'02_1508895223541.txt', N'02', N'12', N'18', CAST(N'2017-10-23 08:33:43.593' AS DateTime), N'14', N'Accepted', CAST(N'2017-10-25 08:33:43.593' AS DateTime), 7, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'30', N'Hot and spicy rice cake', N'05_1508950108919.txt', N'05', N'17', N'18', CAST(N'2017-09-29 23:48:28.947' AS DateTime), N'10', N'Accepted', CAST(N'2017-09-29 23:59:28.947' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'31', N'Easy-to-make kimchi', N'05_1508951065674.txt', N'05', N'17', N'18', CAST(N'2017-09-29 00:04:25.677' AS DateTime), N'10', N'Accepted', CAST(N'2017-09-29 12:04:25.677' AS DateTime), 7, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'32', N'Seaweed rice rolls', N'05_1508951659514.txt', N'05', N'17', N'18', CAST(N'2017-09-29 00:14:19.520' AS DateTime), N'10', N'Accepted', CAST(N'2017-09-29 12:24:19.520' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'33', N'ABC Kitchen', N'06_1508952273515.txt', N'06', N'14', N'18', CAST(N'2017-10-22 00:24:33.537' AS DateTime), N'16', N'Accepted', CAST(N'2017-10-25 00:24:33.537' AS DateTime), 8, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'34', N'How to cook the perfect carrot halwa', N'02_1508983270342.txt', N'02', NULL, NULL, CAST(N'2017-07-26 09:01:10.387' AS DateTime), N'13', N'Pending for Employee', NULL, 7, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'35', N'The perfect carrot halwa', N'02_1508983951094.txt', N'02', N'13', N'19', CAST(N'2017-08-16 09:12:31.100' AS DateTime), N'13', N'Accepted', CAST(N'2017-11-02 08:22:09.987' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'36', N'The pasta of Italian', N'02_1508984322500.txt', N'02', N'13', N'19', CAST(N'2017-09-17 09:18:42.540' AS DateTime), N'15', N'Accepted', CAST(N'2017-11-02 08:20:26.267' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'37', N'Oliver’s Prime Steakhouse', N'07_1508984429135.txt', N'07', N'15', N'18', CAST(N'2017-09-02 09:20:29.153' AS DateTime), N'17', N'Accepted', CAST(N'2017-09-05 09:20:29.153' AS DateTime), 6, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'38', N'Cook the delicious penne all’arrabbiata', N'02_1508984636233.txt', N'02', N'13', N'19', CAST(N'2017-09-02 09:23:56.247' AS DateTime), N'15', N'Accepted', CAST(N'2017-11-02 08:21:39.370' AS DateTime), 4, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'39', N'Water Grill- Los Angeles ', N'07_1508985165033.txt', N'07', N'15', N'18', CAST(N'2017-09-19 09:32:45.050' AS DateTime), N'17', N'Accepted', CAST(N'2017-09-25 09:32:45.050' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'4', N'Goat curry', N'02_1508895338093.txt', N'02', N'13', N'19', CAST(N'2017-08-18 08:35:38.103' AS DateTime), N'14', N'Accepted', CAST(N'2017-11-02 08:22:03.150' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'40', N'German'' Deserts', N'09_1508985361222.txt', N'09', N'13', N'18', CAST(N'2017-10-26 09:36:01.227' AS DateTime), N'02', N'Accepted', CAST(N'2017-10-28 09:36:01.227' AS DateTime), 23, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'41', N'Make the perfect no-bake cheesecake', N'09_1508985628201.txt', N'09', N'15', N'18', CAST(N'2017-10-26 09:40:28.207' AS DateTime), N'07', N'Accepted', CAST(N'2017-10-28 09:40:28.207' AS DateTime), 13, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'42', N'LA Prime ', N'07_1508985791744.txt', N'07', N'15', N'18', CAST(N'2017-10-26 09:43:11.787' AS DateTime), N'17', N'Accepted', CAST(N'2017-10-28 09:43:11.787' AS DateTime), 24, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'43', N'Strawberry is better than your thoughts', N'09_1508985925375.txt', N'09', N'13', N'18', CAST(N'2017-10-16 09:45:25.487' AS DateTime), N'02', N'Accepted', CAST(N'2017-10-18 09:45:25.487' AS DateTime), 7, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'44', N'Bake the perfect strawberry tart', N'09_1508986171498.txt', N'09', N'15', N'18', CAST(N'2017-10-06 09:49:31.503' AS DateTime), N'07', N'Accepted', CAST(N'2017-10-08 09:49:31.503' AS DateTime), 10, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'45', N'Wolvesmouth at the Wolvesden', N'06_1508986353092.txt', N'06', N'13', N'19', CAST(N'2017-10-26 09:52:33.100' AS DateTime), N'16', N'Accepted', CAST(N'2017-11-02 08:19:24.490' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'46', N'Scotch eggs - The great meal for vegetarian', N'09_1508986571237.txt', N'09', N'13', N'18', CAST(N'2017-10-11 09:56:11.240' AS DateTime), N'02', N'Accepted', CAST(N'2017-10-13 09:56:11.240' AS DateTime), 7, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'47', N'The perfect vegetarian scotch eggs', N'09_1508986931977.txt', N'09', N'15', N'19', CAST(N'2017-09-09 10:02:11.980' AS DateTime), N'07', N'Accepted', CAST(N'2017-11-02 08:21:14.713' AS DateTime), 4, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'48', N'SharksTeeth', N'06_1508987464263.txt', N'06', N'15', N'18', CAST(N'2017-09-10 10:11:04.270' AS DateTime), N'16', N'Accepted', CAST(N'2017-09-13 10:11:04.270' AS DateTime), 10, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'49', N'test test test test test test test ', N'02_1508990816116.txt', N'02', N'12', N'18', CAST(N'2017-10-26 11:06:56.130' AS DateTime), N'13', N'Rejected', CAST(N'2017-10-26 11:17:05.017' AS DateTime), 8, N'18', N'zzczxc')
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'5', N'Cannoli', N'02_1508895616263.txt', N'02', N'12', N'19', CAST(N'2017-09-19 08:40:16.267' AS DateTime), N'15', N'Accepted', CAST(N'2017-11-02 08:19:41.867' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'50', N'4 Food Tips to Improve Your Arthritis Symptoms', N'03_1509072346427.txt', N'03', N'13', N'19', CAST(N'2017-10-27 09:45:46.000' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:19:10.677' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'51', N'5 Food Tips for Camping and Hiking', N'03_1509072664429.txt', N'03', N'12', N'18', CAST(N'2017-10-27 09:51:04.000' AS DateTime), N'01', N'Accepted', CAST(N'2017-11-02 08:03:03.053' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'52', N'7 Tips for Clean Eating', N'03_1509080688798.txt', N'03', N'13', N'19', CAST(N'2017-10-27 12:04:49.000' AS DateTime), N'11', N'Accepted', CAST(N'2017-11-02 08:19:02.577' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'53', N'7 Tips for Using Your Microwave', N'03_1509165188644.txt', N'03', NULL, NULL, CAST(N'2017-10-28 11:33:09.000' AS DateTime), N'01', N'Rejected', CAST(N'2017-11-02 08:24:15.170' AS DateTime), 0, N'13', N'Not related with cooking topic')
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'54', N'8 Creative Ways to Use a Blender', N'03_1509172307587.txt', N'03', N'13', N'19', CAST(N'2017-10-28 13:31:47.610' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:18:47.787' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'55', N'10 Food Tips To Help Your Brain', N'03_1509189130078.txt', N'03', N'12', N'18', CAST(N'2017-10-28 18:12:10.697' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:02:47.197' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'56', N'60 Food Facts That Will Blow Your Mind (Part 1)', N'03_1509191595280.txt', N'03', N'12', N'18', CAST(N'2017-10-28 18:53:15.297' AS DateTime), N'01', N'Accepted', CAST(N'2017-11-02 08:02:43.127' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'57', N'60 Food Facts That Will Blow Your Mind (Part 2)', N'03_1509192565650.txt', N'03', N'12', N'18', CAST(N'2017-10-28 19:09:25.667' AS DateTime), N'01', N'Accepted', CAST(N'2017-11-02 08:03:11.740' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'58', N'60 Food Facts That Will Blow Your Mind (Part 3 - END)', N'03_1509193076466.txt', N'03', N'12', N'18', CAST(N'2017-10-28 19:17:56.603' AS DateTime), N'01', N'Accepted', CAST(N'2017-11-02 08:02:53.160' AS DateTime), 0, N'13', NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'59', N'Healthy eating tips', N'03_1509194540550.txt', N'03', N'13', N'19', CAST(N'2017-10-28 19:42:20.803' AS DateTime), N'05', N'Accepted', CAST(N'2017-11-02 08:18:40.643' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'6', N'Pizza Margherita in 4 easy steps', N'02_1508895826170.txt', N'02', N'12', N'18', CAST(N'2017-09-21 08:43:46.173' AS DateTime), N'15', N'Accepted', CAST(N'2017-09-24 08:43:46.173' AS DateTime), 12, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'60', N'Interview with “Cooking for Love” Hosts, Sarah Benjamin and Nik Imran', N'03_1509194971273.txt', N'03', N'13', N'19', CAST(N'2017-10-28 19:49:31.290' AS DateTime), N'06', N'Accepted', CAST(N'2017-11-02 08:18:33.857' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'61', N'Late Night Guide: Jakarta', N'03_1509195718180.txt', N'03', N'13', N'19', CAST(N'2017-10-28 20:01:58.183' AS DateTime), N'07', N'Accepted', CAST(N'2017-11-02 08:18:12.873' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'62', N'Late Night Guide: Krabi', N'03_1509196230401.txt', N'03', N'13', N'19', CAST(N'2017-10-28 20:10:30.423' AS DateTime), N'08', N'Accepted', CAST(N'2017-11-02 08:18:06.473' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'63', N'Late Night Guide: Phuket', N'03_1509196666180.txt', N'03', N'13', N'18', CAST(N'2017-10-28 20:17:46.233' AS DateTime), N'09', N'Accepted', CAST(N'2017-11-02 08:02:37.173' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'64', N'Asian Greens', N'09_1509431095007.txt', N'09', N'13', N'19', CAST(N'2017-10-31 13:24:55.040' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:18:01.067' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'65', N'Vietnamese prawn summer rolls', N'09_1509431285330.txt', N'09', N'13', N'19', CAST(N'2017-10-31 13:28:05.347' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:17:54.787' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'66', N'Vietnamese chicken baguettes', N'09_1509431449578.txt', N'09', N'13', N'19', CAST(N'2017-10-31 13:30:49.593' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:17:49.383' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'67', N'Crunchy prawn noodle salad', N'09_1509431640319.txt', N'09', N'13', N'19', CAST(N'2017-10-31 13:34:00.320' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:17:40.427' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'68', N'Tangy carrot, red cabbage & onion salad', N'09_1509431737626.txt', N'09', N'13', N'19', CAST(N'2017-10-31 13:35:37.627' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:17:32.853' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'69', N'Salmon noodle wraps', N'09_1509433097573.txt', N'09', N'13', N'19', CAST(N'2017-10-31 13:58:17.587' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:17:20.557' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'7', N'Pappardelle with rabbit & chestnut ragu', N'02_1508899096298.txt', N'02', N'12', N'18', CAST(N'2017-08-25 09:38:16.330' AS DateTime), N'15', N'Accepted', CAST(N'2017-08-28 09:38:16.330' AS DateTime), 10, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'70', N'Minty Asian chicken salad', N'09_1509433212946.txt', N'09', N'13', N'19', CAST(N'2017-10-31 14:00:12.963' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:17:10.890' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'71', N'Spiced chicken meatballs with noodles, basil & broth', N'09_1509433562043.txt', N'09', N'13', N'19', CAST(N'2017-10-31 14:06:02.060' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:17:04.727' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'72', N'Sea bass with sizzled ginger, chilli & spring onions', N'09_1509433699121.txt', N'09', N'13', N'19', CAST(N'2017-10-31 14:08:19.137' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:16:58.570' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'73', N'Fragrant Thai prawns', N'09_1509433871624.txt', N'09', N'13', N'19', CAST(N'2017-10-31 14:11:11.623' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:16:52.023' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'74', N'Pad Thai', N'09_1509433992203.txt', N'09', N'13', N'19', CAST(N'2017-10-31 14:13:12.203' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:16:45.573' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'75', N'Chicken & lemon skewers', N'09_1509434261794.txt', N'09', N'12', N'18', CAST(N'2017-10-31 14:17:41.810' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:02:31.323' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'76', N'Squash & spinach fusilli with pecans', N'09_1509434457644.txt', N'09', N'12', N'18', CAST(N'2017-10-31 14:20:57.660' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:01:51.993' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'77', N'Indian chicken protein pots', N'09_1509434587705.txt', N'09', N'12', N'18', CAST(N'2017-10-31 14:23:07.720' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:01:58.423' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'78', N'Beetroot & lentil tabbouleh', N'09_1509434771271.txt', N'09', N'12', N'18', CAST(N'2017-10-31 14:26:11.287' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:02:03.437' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'79', N'Slow cooker mushroomtes risotto Test', N'09_1509435052753.txt', N'09', N'12', N'18', CAST(N'2017-10-31 14:30:52.770' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:49:04.077' AS DateTime), 0, N'01', NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'8', N'Healthy lunch ideas for work', N'03_1508921964984.txt', N'03', N'12', N'18', CAST(N'2017-10-13 15:59:25.000' AS DateTime), N'02', N'Accepted', CAST(N'2017-10-15 15:59:25.000' AS DateTime), 6, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'80', N'Slow cooker breakfast beans', N'09_1509435239961.txt', N'09', N'12', N'18', CAST(N'2017-10-31 14:33:59.977' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:01:46.307' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'81', N'Cucumber, pea & lettuce soup', N'09_1509435329770.txt', N'09', N'12', N'18', CAST(N'2017-10-31 14:35:29.770' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:01:38.997' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'82', N'Three-grain porridge', N'09_1509435474020.txt', N'09', N'12', N'18', CAST(N'2017-10-31 14:37:54.037' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:01:25.100' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'83', N'Poor man''s vongole rosso', N'09_1509435678417.txt', N'09', N'12', N'18', CAST(N'2017-10-31 14:41:18.433' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:01:20.717' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'84', N'Cauliflower, paneer & pea curry', N'09_1509435984240.txt', N'09', N'12', N'18', CAST(N'2017-10-31 14:46:24.240' AS DateTime), N'03', N'Accepted', CAST(N'2017-11-02 08:01:03.273' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'85', N'Curry Spiced Creamy Lobster Pasta', N'03_1509436269772.txt', N'03', N'13', N'19', CAST(N'2017-10-31 14:51:09.787' AS DateTime), N'10', N'Accepted', CAST(N'2017-11-02 08:16:39.360' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'86', N'Spanish sardines on toast', N'09_1509436364437.txt', N'09', N'13', N'19', CAST(N'2017-10-31 14:52:44.457' AS DateTime), N'11', N'Accepted', CAST(N'2017-11-02 08:16:32.047' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'87', N'Cha Yen (Thai Tea) Panna Cotta', N'03_1509436591364.txt', N'03', N'13', N'19', CAST(N'2017-10-31 14:56:31.373' AS DateTime), N'11', N'Accepted', CAST(N'2017-11-02 08:16:24.650' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'88', N'Japanese-style bento box', N'09_1509436663128.txt', N'09', N'13', N'19', CAST(N'2017-10-31 14:57:43.140' AS DateTime), N'09', N'Accepted', CAST(N'2017-11-02 08:16:08.637' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'89', N'Salted Egg Chicken', N'03_1509436686918.txt', N'03', N'12', N'18', CAST(N'2017-10-31 14:58:06.927' AS DateTime), N'12', N'Accepted', CAST(N'2017-11-02 08:00:55.650' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'9', N'Can a better diet help headaches?', N'03_1508940316050.txt', N'03', N'13', N'18', CAST(N'2017-10-11 21:05:16.053' AS DateTime), N'02', N'Accepted', CAST(N'2017-10-13 21:05:16.053' AS DateTime), 5, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'90', N'Smoked salmon & avocado sushi', N'09_1509436814031.txt', N'09', N'13', N'19', CAST(N'2017-10-31 15:00:14.047' AS DateTime), N'09', N'Accepted', CAST(N'2017-11-02 08:15:57.260' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'91', N'Fried Okra', N'03_1509436854235.txt', N'03', N'12', N'18', CAST(N'2017-10-31 15:00:54.247' AS DateTime), N'13', N'Accepted', CAST(N'2017-11-02 08:00:47.503' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'92', N'Green tea frozen yogurt with sesame brittle shards', N'09_1509436920738.txt', N'09', N'13', N'19', CAST(N'2017-10-31 15:02:00.760' AS DateTime), N'09', N'Accepted', CAST(N'2017-11-02 08:15:50.643' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'93', N'Chicken Salad – Goi Ga Bap Cai', N'03_1509437079853.txt', N'03', N'12', N'18', CAST(N'2017-10-31 15:04:39.863' AS DateTime), N'14', N'Accepted', CAST(N'2017-11-02 08:00:43.323' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'94', N'Lawar', N'03_1509437158231.txt', N'03', N'12', N'18', CAST(N'2017-10-31 15:05:58.240' AS DateTime), N'15', N'Accepted', CAST(N'2017-11-02 08:00:19.703' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'95', N'Miso chilli steak with crispy sweet potatoes', N'09_1509437217592.txt', N'09', N'13', N'19', CAST(N'2017-10-31 15:06:57.607' AS DateTime), N'09', N'Accepted', CAST(N'2017-11-02 08:15:42.457' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'96', N'Chicken Hangi Salad', N'03_1509437364798.txt', N'03', N'13', N'19', CAST(N'2017-10-31 15:09:24.807' AS DateTime), N'04', N'Accepted', CAST(N'2017-11-02 08:15:35.197' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'97', N'Soy tuna with wasabi mash', N'09_1509437375200.txt', N'09', N'13', N'19', CAST(N'2017-10-31 15:09:35.210' AS DateTime), N'09', N'Accepted', CAST(N'2017-11-02 08:15:27.467' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'98', N'Citrus soba noodles', N'09_1509437534366.txt', N'09', N'13', N'19', CAST(N'2017-10-31 15:12:14.367' AS DateTime), N'09', N'Accepted', CAST(N'2017-11-02 08:15:20.140' AS DateTime), 0, N'09', NULL)
INSERT [dbo].[tbl_Article] ([ArticleID], [Title], [ContentURL], [AuthorID], [ReviewerID], [ApproverID], [DateTime], [SubcategoryID], [Status], [LastModifiedDateTime], [Views], [LastEditorID], [Reason]) VALUES (N'99', N'FUKUICHI JAPANESE DINING', N'03_1509438101071.txt', N'03', N'13', N'19', CAST(N'2017-10-31 15:21:41.080' AS DateTime), N'16', N'Accepted', CAST(N'2017-11-02 08:15:08.690' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description]) VALUES (N'1', N'Food news', NULL)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description]) VALUES (N'2', N'Recipes', NULL)
INSERT [dbo].[tbl_Category] ([CategoryID], [Name], [Description]) VALUES (N'3', N'Restaurants', NULL)
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C585498222', N'LC', N'', N'', N'Ez game ez life', CAST(N'2017-11-02 08:18:18.223' AS DateTime), N'31')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C587022288', N'1234', N'', N'', N'asfd', CAST(N'2017-11-02 08:43:42.290' AS DateTime), N'100')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C587040036', N'123456', N'', N'', N'123456', CAST(N'2017-11-02 08:44:00.037' AS DateTime), N'100')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C587247994', N'asdasd', N'aa@', N'asdas', N'asdasd', CAST(N'2017-11-02 08:47:27.997' AS DateTime), N'44')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C938377389', N'Young Buffalo', N'', N'', N'Anyway, it''s just a pizza', CAST(N'2017-10-25 20:32:57.390' AS DateTime), N'6')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C987258961', N'Johny', N'', N'', N'This helps me a lot, thank you!', CAST(N'2017-10-26 10:07:38.963' AS DateTime), N'46')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C988146711', N'Star', N'', N'', N'Wow. Just wow. I felt like I haven''t written a five star review in a while for a restaurant but this place blew my mind. ', CAST(N'2017-10-26 10:22:26.713' AS DateTime), N'42')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C988306868', N'Fisher', N'', N'', N'Lobster is big! Look like a pet of fizz', CAST(N'2017-10-26 10:25:06.887' AS DateTime), N'42')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C988354787', N'Tran Trong Hieu', N'', N'', N'Not bad', CAST(N'2017-10-26 10:25:54.787' AS DateTime), N'40')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C988408338', N'Tran Trong Hieu', N'', N'', N'Manificien !!!', CAST(N'2017-10-26 10:26:48.340' AS DateTime), N'48')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C988900664', N'Questioner', N'', N'', N'How can they eat the whole big cake for dessert ? ', CAST(N'2017-10-26 10:35:00.667' AS DateTime), N'40')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C989027191', N'CGDD', N'', N'', N'A lot of milk in their cake! Is it healthy', CAST(N'2017-10-26 10:37:07.197' AS DateTime), N'40')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C989169160', N'Yamamoto', N'', N'', N'Watashi ha cheese ga daisuki desu ga, topping ga suki jaarimasen', CAST(N'2017-10-26 10:39:29.163' AS DateTime), N'41')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C990137112', N'aaa', N'', N'aaa', N'ádasdasdas', CAST(N'2017-10-26 10:55:37.113' AS DateTime), N'29')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C990151410', N'a', N'', N'', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', CAST(N'2017-10-26 10:55:51.410' AS DateTime), N'29')
INSERT [dbo].[tbl_Comment] ([CommentID], [GuestName], [GuestEmail], [GuestPhone], [CommentContent], [Datetime], [ArticleID]) VALUES (N'C990191520', N'b', N'', N'', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc', CAST(N'2017-10-26 10:56:31.520' AS DateTime), N'29')
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'01', N'admin', N'123', N'admin', CAST(N'1990-01-01' AS Date), N'male', N'01228839011', N'admin@gmail.com', N'Tòa nhà HAGL Safomec, 7/1 Thành Thái, P14, Q10, TP.HCM', N'Administrator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'02', N'collaborator01', N'123', N'Hai Dang', CAST(N'1990-01-01' AS Date), N'male', N'01228839011', N'collaborator1@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'03', N'collaborator02', N'123', N'Ba Dang', CAST(N'1990-01-01' AS Date), N'male', N'01228839011', N'collaborator2@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'04', N'collaborator03', N'123', N'Nhat Dang', CAST(N'1990-01-01' AS Date), N'female', N'01229930112', N'collaborator3@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'05', N'collaborator04', N'123', N'Tu Dang', CAST(N'1990-01-01' AS Date), N'female', N'01228837192', N'collaborator4@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'06', N'collaborator05', N'123', N'Nam Dang', CAST(N'1990-01-01' AS Date), N'female', N'01228871923', N'collaborator5@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'07', N'collaborator06', N'123', N'Sau Lang', CAST(N'1990-01-01' AS Date), N'female', N'01228232913', N'collaborator6@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'08', N'collaborator07', N'123', N'Bay Dan', CAST(N'1990-01-01' AS Date), N'male', N'01239181838', N'collaborator7@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'09', N'collaborator08', N'123', N'Le Van Tam', CAST(N'1990-01-01' AS Date), N'male', N'01239928193', N'collaborator8@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'10', N'collaborator09', N'123', N'Cu Dang', CAST(N'1990-01-01' AS Date), N'male', N'01281938193', N'collaborator9@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'11', N'collaborator10', N'123', N'Muoi Dang', CAST(N'1990-01-01' AS Date), N'female', N'02191938191', N'collaborator10@gmail.com', N'Tầng 19, Tòa nhà Saigon Centre – Tháp 2, 67 Lê Lợi, Phường Bến Nghé, Quận 1', N'Collaborator', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'12', N'employee01', N'123', N'Thuy Kieu', CAST(N'1990-01-01' AS Date), N'male', N'01919238912', N'employee01@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'13', N'employee02', N'123', N'Thuy Van', CAST(N'1990-01-01' AS Date), N'male', N'01192939123', N'employee02@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'14', N'employee03', N'123', N'Tu Hai', CAST(N'1990-01-01' AS Date), N'male', N'01221891823', N'employee03@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'15', N'employee04', N'123', N'Hoan Thu', CAST(N'1990-01-01' AS Date), N'female', N'01128391813', N'employee04@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'16', N'employee05', N'123', N'So Khanh', CAST(N'1990-01-01' AS Date), N'male', N'01918381823', N'employee05@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'17', N'employee06', N'123', N'Kim Trong', CAST(N'1900-01-01' AS Date), N'female', N'01283819183', N'employee06@gmail.com', N'Số 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1', N'Employee', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'18', N'manager01', N'123', N'Man Nay Cho', CAST(N'1990-01-01' AS Date), N'female', N'01239918391', N'manager01@gmail.com', N'Số 166, Đường Nguyễn Công Trứ, Phường Nguyễn Thái Bình, Quận 1, TPHCM', N'Manager', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'19', N'manager02', N'123', N'manager nihai', CAST(N'1990-01-01' AS Date), N'male', N'01283712837', N'manager02@gmail.com', N'Số 166, Đường Nguyễn Công Trứ, Phường Nguyễn Thái Bình, Quận 1, TPHCM', N'Manager', 1)
INSERT [dbo].[tbl_Staff] ([StaffID], [Username], [Password], [Name], [Birthday], [Gender], [Phone], [Email], [Address], [Role], [IsActive]) VALUES (N'20', N'manager03', N'123', N'manager sanbai', CAST(N'1990-01-01' AS Date), N'female', N'01928381837', N'manager03@gmail.com', N'Số 166, Đường Nguyễn Công Trứ, Phường Nguyễn Thái Bình, Quận 1, TPHCM', N'Manager', 1)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'01', N'1', N'Masterchef', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'02', N'1', N'Chef''s advisions', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'03', N'1', N'Nutritious', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'04', N'2', N'South East Asian', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'05', N'2', N'French', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'06', N'2', N'American', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'07', N'2', N'German', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'08', N'2', N'Indian', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'09', N'2', N'Japanese', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'10', N'2', N'Korean', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'11', N'2', N'Spanish', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'12', N'2', N'Mexican', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'13', N'2', N'African', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'14', N'2', N'Carribean', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'15', N'2', N'Italian', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'16', N'3', N'5-stars', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'17', N'3', N'4-stars', 1, NULL)
INSERT [dbo].[tbl_Subcategory] ([SubcategoryID], [CategoryID], [Name], [IsActive], [Description]) VALUES (N'18', N'3', N'Home made', 1, NULL)
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'02', N'13')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'02', N'14')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'02', N'15')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'01')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'02')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'03')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'04')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'05')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'06')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'07')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'08')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'09')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'10')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'11')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'12')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'13')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'14')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'15')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'16')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'17')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'03', N'18')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'04', N'11')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'04', N'13')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'05', N'06')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'05', N'07')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'05', N'10')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'06', N'12')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'06', N'16')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'07', N'02')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'07', N'17')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'07', N'18')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'08', N'01')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'09', N'02')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'09', N'03')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'09', N'04')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'09', N'07')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'09', N'09')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'09', N'11')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'09', N'12')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'10', N'01')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'10', N'16')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'11', N'01')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'11', N'17')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'12', N'01')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'12', N'02')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'12', N'03')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'12', N'12')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'12', N'13')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'12', N'14')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'12', N'15')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'01')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'02')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'03')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'04')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'05')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'06')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'07')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'08')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'09')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'10')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'11')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'12')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'13')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'14')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'15')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'16')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'17')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'13', N'18')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'14', N'04')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'14', N'05')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'14', N'06')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'14', N'07')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'14', N'16')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'14', N'17')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'14', N'18')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'15', N'04')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'15', N'05')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'15', N'06')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'15', N'07')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'15', N'16')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'15', N'17')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'15', N'18')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'16', N'08')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'16', N'09')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'16', N'10')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'16', N'11')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'17', N'08')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'17', N'09')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'17', N'10')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'17', N'11')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'18', N'01')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'18', N'02')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'18', N'03')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'04')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'05')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'06')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'07')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'08')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'09')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'10')
GO
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'11')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'12')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'13')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'14')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'19', N'15')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'20', N'16')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'20', N'17')
INSERT [dbo].[tbl_WorkingSubcategory] ([StaffID], [SubcategoryID]) VALUES (N'20', N'18')
ALTER TABLE [dbo].[tbl_Article]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Article_tbl_Staff] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[tbl_Staff] ([StaffID])
GO
ALTER TABLE [dbo].[tbl_Article] CHECK CONSTRAINT [FK_tbl_Article_tbl_Staff]
GO
ALTER TABLE [dbo].[tbl_Article]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Article_tbl_Staff1] FOREIGN KEY([ReviewerID])
REFERENCES [dbo].[tbl_Staff] ([StaffID])
GO
ALTER TABLE [dbo].[tbl_Article] CHECK CONSTRAINT [FK_tbl_Article_tbl_Staff1]
GO
ALTER TABLE [dbo].[tbl_Article]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Article_tbl_Staff2] FOREIGN KEY([ApproverID])
REFERENCES [dbo].[tbl_Staff] ([StaffID])
GO
ALTER TABLE [dbo].[tbl_Article] CHECK CONSTRAINT [FK_tbl_Article_tbl_Staff2]
GO
ALTER TABLE [dbo].[tbl_Article]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Article_tbl_Staff3] FOREIGN KEY([LastEditorID])
REFERENCES [dbo].[tbl_Staff] ([StaffID])
GO
ALTER TABLE [dbo].[tbl_Article] CHECK CONSTRAINT [FK_tbl_Article_tbl_Staff3]
GO
ALTER TABLE [dbo].[tbl_Article]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Article_tbl_Subcategory] FOREIGN KEY([SubcategoryID])
REFERENCES [dbo].[tbl_Subcategory] ([SubcategoryID])
GO
ALTER TABLE [dbo].[tbl_Article] CHECK CONSTRAINT [FK_tbl_Article_tbl_Subcategory]
GO
ALTER TABLE [dbo].[tbl_Comment]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Comment_tbl_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[tbl_Article] ([ArticleID])
GO
ALTER TABLE [dbo].[tbl_Comment] CHECK CONSTRAINT [FK_tbl_Comment_tbl_Article]
GO
ALTER TABLE [dbo].[tbl_Subcategory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Subcategory_tbl_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tbl_Category] ([CategoryID])
GO
ALTER TABLE [dbo].[tbl_Subcategory] CHECK CONSTRAINT [FK_tbl_Subcategory_tbl_Category]
GO
ALTER TABLE [dbo].[tbl_WorkingSubcategory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_WorkingSubcategory_tbl_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[tbl_Staff] ([StaffID])
GO
ALTER TABLE [dbo].[tbl_WorkingSubcategory] CHECK CONSTRAINT [FK_tbl_WorkingSubcategory_tbl_Staff]
GO
ALTER TABLE [dbo].[tbl_WorkingSubcategory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_WorkingSubcategory_tbl_Subcategory] FOREIGN KEY([SubcategoryID])
REFERENCES [dbo].[tbl_Subcategory] ([SubcategoryID])
GO
ALTER TABLE [dbo].[tbl_WorkingSubcategory] CHECK CONSTRAINT [FK_tbl_WorkingSubcategory_tbl_Subcategory]
GO
USE [master]
GO
ALTER DATABASE [RecipeWebDB] SET  READ_WRITE 
GO
