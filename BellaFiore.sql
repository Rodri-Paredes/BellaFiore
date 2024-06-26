USE [master]
GO
/****** Object:  Database [bd_bellafiore]    Script Date: 5/9/2024 7:11:51 PM ******/
CREATE DATABASE [bd_bellafiore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_bellafiore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\bd_bellafiore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd_bellafiore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\bd_bellafiore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [bd_bellafiore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_bellafiore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_bellafiore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_bellafiore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_bellafiore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_bellafiore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_bellafiore] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_bellafiore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [bd_bellafiore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_bellafiore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_bellafiore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_bellafiore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_bellafiore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_bellafiore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_bellafiore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_bellafiore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_bellafiore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bd_bellafiore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_bellafiore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_bellafiore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_bellafiore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_bellafiore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_bellafiore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_bellafiore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_bellafiore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bd_bellafiore] SET  MULTI_USER 
GO
ALTER DATABASE [bd_bellafiore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_bellafiore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_bellafiore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_bellafiore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd_bellafiore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bd_bellafiore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bd_bellafiore] SET QUERY_STORE = ON
GO
ALTER DATABASE [bd_bellafiore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [bd_bellafiore]
GO
/****** Object:  Table [dbo].[category]    Script Date: 5/9/2024 7:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id_category] [smallint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[created_by] [smallint] NOT NULL,
	[updated_by] [smallint] NULL,
	[last_update] [datetime] NULL,
	[is_active] [tinyint] NOT NULL,
 CONSTRAINT [PK__category__E548B67399735E62] PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 5/9/2024 7:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id_customer] [smallint] IDENTITY(1,1) NOT NULL,
	[ci] [varchar](10) NOT NULL,
	[name] [varchar](60) NOT NULL,
	[surname] [varchar](60) NOT NULL,
	[second_sur_name] [varchar](60) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](30) NOT NULL,
	[created_by] [smallint] NOT NULL,
	[updated_by] [smallint] NULL,
	[last_update] [datetime] NULL,
	[is_active] [tinyint] NOT NULL,
	[creation_date] [datetime] NOT NULL,
 CONSTRAINT [PK__customer__8CC9BA4617FB6417] PRIMARY KEY CLUSTERED 
(
	[id_customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission]    Script Date: 5/9/2024 7:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission](
	[id_permission] [smallint] IDENTITY(1,1) NOT NULL,
	[id_rol] [smallint] NOT NULL,
	[name_menu] [varchar](100) NOT NULL,
	[created_by] [smallint] NULL,
	[updated_by] [smallint] NULL,
	[last_update] [datetime] NOT NULL,
	[is_active] [tinyint] NOT NULL,
	[creation_date] [datetime] NOT NULL,
 CONSTRAINT [PK__permissi__5180B3BF52422B8C] PRIMARY KEY CLUSTERED 
(
	[id_permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 5/9/2024 7:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id_product] [smallint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[id_category] [smallint] NOT NULL,
	[stock] [smallint] NOT NULL,
	[price_unitary] [decimal](7, 2) NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[created_by] [smallint] NOT NULL,
	[updated_by] [smallint] NULL,
	[last_update] [datetime] NULL,
	[is_active] [tinyint] NOT NULL,
 CONSTRAINT [PK__product__BA39E84F6B7513B8] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 5/9/2024 7:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[id_rol] [smallint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[created_by] [smallint] NOT NULL,
	[updated_by] [smallint] NULL,
	[last_update] [datetime] NULL,
	[is_active] [tinyint] NOT NULL,
	[creation_date] [datetime] NOT NULL,
 CONSTRAINT [PK__rol__6ABCB5E0ED07F62C] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sale]    Script Date: 5/9/2024 7:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale](
	[id_sale] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [smallint] NOT NULL,
	[document_customer] [varchar](10) NOT NULL,
	[name_customer] [varchar](180) NOT NULL,
	[total] [decimal](7, 2) NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[created_by] [smallint] NOT NULL,
	[updated_by] [smallint] NULL,
	[last_update] [datetime] NULL,
	[is_active] [tinyint] NOT NULL,
 CONSTRAINT [PK__sale__D18B01575E0698E4] PRIMARY KEY CLUSTERED 
(
	[id_sale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sale_detail]    Script Date: 5/9/2024 7:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale_detail](
	[id_sale_detail] [int] IDENTITY(1,1) NOT NULL,
	[id_sale] [int] NOT NULL,
	[id_product] [smallint] NOT NULL,
	[price_unitary] [decimal](7, 2) NOT NULL,
	[cant] [smallint] NOT NULL,
	[subtotal] [decimal](7, 2) NOT NULL,
	[creation_date] [datetime] NOT NULL,
	[created_by] [smallint] NOT NULL,
	[updated_by] [smallint] NULL,
	[last_update] [datetime] NULL,
	[is_active] [tinyint] NOT NULL,
 CONSTRAINT [PK__sale_det__33BFC62501FDA997] PRIMARY KEY CLUSTERED 
(
	[id_sale_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 5/9/2024 7:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id_user] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NOT NULL,
	[password] [varbinary](35) NOT NULL,
	[id_rol] [smallint] NOT NULL,
	[created_by] [smallint] NOT NULL,
	[updated_by] [smallint] NULL,
	[last_update] [datetime] NULL,
	[is_active] [tinyint] NOT NULL,
	[creation_date] [datetime] NOT NULL,
 CONSTRAINT [PK__users__D2D1463788CDA921] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[category] ADD  CONSTRAINT [DF__category__date_c__59063A47]  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[category] ADD  CONSTRAINT [DF_category_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF__customer__last_u__534D60F1]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_creation_date]  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[permission] ADD  CONSTRAINT [DF__permissio__last___5070F446]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[permission] ADD  CONSTRAINT [DF_permission_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[permission] ADD  CONSTRAINT [DF_permission_creation_date]  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF__product__stock__5CD6CB2B]  DEFAULT ((0)) FOR [stock]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF__product__date_cr__5DCAEF64]  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[rol] ADD  CONSTRAINT [DF__rol__last_update__4CA06362]  DEFAULT (getdate()) FOR [last_update]
GO
ALTER TABLE [dbo].[rol] ADD  CONSTRAINT [DF_rol_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[rol] ADD  CONSTRAINT [DF_rol_creation_date]  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[sale] ADD  CONSTRAINT [DF__sale__date_creat__619B8048]  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[sale] ADD  CONSTRAINT [DF_sale_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[sale_detail] ADD  CONSTRAINT [DF__sale_deta__date___66603565]  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[sale_detail] ADD  CONSTRAINT [DF_sale_detail_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_creation_date]  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[permission]  WITH CHECK ADD  CONSTRAINT [FK__permissio__id_ro__4F7CD00D] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id_rol])
GO
ALTER TABLE [dbo].[permission] CHECK CONSTRAINT [FK__permissio__id_ro__4F7CD00D]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__id_cate__5BE2A6F2] FOREIGN KEY([id_category])
REFERENCES [dbo].[category] ([id_category])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__id_cate__5BE2A6F2]
GO
ALTER TABLE [dbo].[sale]  WITH CHECK ADD  CONSTRAINT [FK__sale__id_user__60A75C0F] FOREIGN KEY([id_user])
REFERENCES [dbo].[customer] ([id_customer])
GO
ALTER TABLE [dbo].[sale] CHECK CONSTRAINT [FK__sale__id_user__60A75C0F]
GO
ALTER TABLE [dbo].[sale]  WITH CHECK ADD  CONSTRAINT [FK_sale_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[sale] CHECK CONSTRAINT [FK_sale_users]
GO
ALTER TABLE [dbo].[sale_detail]  WITH CHECK ADD  CONSTRAINT [FK__sale_deta__id_pr__656C112C] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id_product])
GO
ALTER TABLE [dbo].[sale_detail] CHECK CONSTRAINT [FK__sale_deta__id_pr__656C112C]
GO
ALTER TABLE [dbo].[sale_detail]  WITH CHECK ADD  CONSTRAINT [FK__sale_deta__id_sa__6477ECF3] FOREIGN KEY([id_sale])
REFERENCES [dbo].[sale] ([id_sale])
GO
ALTER TABLE [dbo].[sale_detail] CHECK CONSTRAINT [FK__sale_deta__id_sa__6477ECF3]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK__users__id_rol__73BA3083] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id_rol])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK__users__id_rol__73BA3083]
GO
USE [master]
GO
ALTER DATABASE [bd_bellafiore] SET  READ_WRITE 
GO
