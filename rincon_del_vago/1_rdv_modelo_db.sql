USE [master]
GO
/****** Object:  Database [TESTRDV]    Script Date: 22/05/2019 23:50:07 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'TESTRDV')
BEGIN
CREATE DATABASE [TESTRDV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST_RDV', FILENAME = N'C:\dev\db\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\TEST_RDV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TEST_RDV_log', FILENAME = N'C:\dev\db\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\TEST_RDV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [TESTRDV] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TESTRDV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TESTRDV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TESTRDV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TESTRDV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TESTRDV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TESTRDV] SET ARITHABORT OFF 
GO
ALTER DATABASE [TESTRDV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TESTRDV] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [TESTRDV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TESTRDV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TESTRDV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TESTRDV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TESTRDV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TESTRDV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TESTRDV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TESTRDV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TESTRDV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TESTRDV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TESTRDV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TESTRDV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TESTRDV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TESTRDV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TESTRDV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TESTRDV] SET RECOVERY FULL 
GO
ALTER DATABASE [TESTRDV] SET  MULTI_USER 
GO
ALTER DATABASE [TESTRDV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TESTRDV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TESTRDV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TESTRDV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TESTRDV', N'ON'
GO
USE [TESTRDV]
GO
/****** Object:  Table [dbo].[asignaciones]    Script Date: 22/05/2019 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asignaciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[asignaciones](
	[prof_id] [int] NOT NULL,
	[cur_id] [nchar](10) NOT NULL,
 CONSTRAINT [PK_asignaciones] PRIMARY KEY CLUSTERED 
(
	[prof_id] ASC,
	[cur_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[cursos]    Script Date: 22/05/2019 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cursos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cursos](
	[cur_id] [nchar](10) NOT NULL,
	[cur_nombre_curso] [nchar](256) NULL,
 CONSTRAINT [PK_cursos] PRIMARY KEY CLUSTERED 
(
	[cur_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[estudiantes]    Script Date: 22/05/2019 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[estudiantes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[estudiantes](
	[est_id] [int] IDENTITY(1,1) NOT NULL,
	[est_nombre] [nchar](256) NOT NULL,
 CONSTRAINT [PK_estudiantes] PRIMARY KEY CLUSTERED 
(
	[est_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[matriculas]    Script Date: 22/05/2019 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[matriculas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[matriculas](
	[mat_cur_id] [nchar](10) NOT NULL,
	[mat_est_id] [int] NOT NULL,
	[mat_year] [int] NOT NULL,
	[mat_semestre] [int] NOT NULL,
	[mat_nota_final_est] [float] NULL,
 CONSTRAINT [PK_matriculas] PRIMARY KEY CLUSTERED 
(
	[mat_cur_id] ASC,
	[mat_est_id] ASC,
	[mat_year] ASC,
	[mat_semestre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[profesores]    Script Date: 22/05/2019 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[profesores]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[profesores](
	[prof_id] [int] IDENTITY(1,1) NOT NULL,
	[prof_nombre_profesor] [nchar](256) NOT NULL,
	[prof_cursos_asignados] [int] NOT NULL,
 CONSTRAINT [PK_profesores] PRIMARY KEY CLUSTERED 
(
	[prof_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[v_asignaciones]    Script Date: 22/05/2019 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_asignaciones]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_asignaciones] AS
SELECT prof_nombre_profesor, cur_nombre_curso FROM [dbo].[asignaciones] a
inner join [dbo].[profesores] on a.[prof_id] =[dbo].[profesores].[prof_id]
inner join [dbo].[cursos] on [dbo].[cursos].[cur_id] = a.[cur_id] 
;' 
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[df_matriculas_mat_nota_final_est]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[matriculas] ADD  CONSTRAINT [df_matriculas_mat_nota_final_est]  DEFAULT ((0)) FOR [mat_nota_final_est]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_profesores_prof_cursos_asignados]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[profesores] ADD  CONSTRAINT [DF_profesores_prof_cursos_asignados]  DEFAULT ((0)) FOR [prof_cursos_asignados]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_asignaciones_cursos]') AND parent_object_id = OBJECT_ID(N'[dbo].[asignaciones]'))
ALTER TABLE [dbo].[asignaciones]  WITH CHECK ADD  CONSTRAINT [fk_asignaciones_cursos] FOREIGN KEY([cur_id])
REFERENCES [dbo].[cursos] ([cur_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_asignaciones_cursos]') AND parent_object_id = OBJECT_ID(N'[dbo].[asignaciones]'))
ALTER TABLE [dbo].[asignaciones] CHECK CONSTRAINT [fk_asignaciones_cursos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_asignaciones_profesores]') AND parent_object_id = OBJECT_ID(N'[dbo].[asignaciones]'))
ALTER TABLE [dbo].[asignaciones]  WITH CHECK ADD  CONSTRAINT [fk_asignaciones_profesores] FOREIGN KEY([prof_id])
REFERENCES [dbo].[profesores] ([prof_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_asignaciones_profesores]') AND parent_object_id = OBJECT_ID(N'[dbo].[asignaciones]'))
ALTER TABLE [dbo].[asignaciones] CHECK CONSTRAINT [fk_asignaciones_profesores]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_matriculas_cursos]') AND parent_object_id = OBJECT_ID(N'[dbo].[matriculas]'))
ALTER TABLE [dbo].[matriculas]  WITH CHECK ADD  CONSTRAINT [fk_matriculas_cursos] FOREIGN KEY([mat_cur_id])
REFERENCES [dbo].[cursos] ([cur_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_matriculas_cursos]') AND parent_object_id = OBJECT_ID(N'[dbo].[matriculas]'))
ALTER TABLE [dbo].[matriculas] CHECK CONSTRAINT [fk_matriculas_cursos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_matriculas_estudiantes]') AND parent_object_id = OBJECT_ID(N'[dbo].[matriculas]'))
ALTER TABLE [dbo].[matriculas]  WITH CHECK ADD  CONSTRAINT [fk_matriculas_estudiantes] FOREIGN KEY([mat_est_id])
REFERENCES [dbo].[estudiantes] ([est_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_matriculas_estudiantes]') AND parent_object_id = OBJECT_ID(N'[dbo].[matriculas]'))
ALTER TABLE [dbo].[matriculas] CHECK CONSTRAINT [fk_matriculas_estudiantes]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ck_mat_nota]') AND parent_object_id = OBJECT_ID(N'[dbo].[matriculas]'))
ALTER TABLE [dbo].[matriculas]  WITH CHECK ADD  CONSTRAINT [ck_mat_nota] CHECK  (([mat_nota_final_est]>=(0.0) AND [mat_nota_final_est]<=(10.0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ck_mat_nota]') AND parent_object_id = OBJECT_ID(N'[dbo].[matriculas]'))
ALTER TABLE [dbo].[matriculas] CHECK CONSTRAINT [ck_mat_nota]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ck_mat_semestre_year]') AND parent_object_id = OBJECT_ID(N'[dbo].[matriculas]'))
ALTER TABLE [dbo].[matriculas]  WITH CHECK ADD  CONSTRAINT [ck_mat_semestre_year] CHECK  (([mat_semestre]=(1) OR [mat_semestre]=(2)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ck_mat_semestre_year]') AND parent_object_id = OBJECT_ID(N'[dbo].[matriculas]'))
ALTER TABLE [dbo].[matriculas] CHECK CONSTRAINT [ck_mat_semestre_year]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ck_mat_year]') AND parent_object_id = OBJECT_ID(N'[dbo].[matriculas]'))
ALTER TABLE [dbo].[matriculas]  WITH CHECK ADD  CONSTRAINT [ck_mat_year] CHECK  (([mat_year]>(1900)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ck_mat_year]') AND parent_object_id = OBJECT_ID(N'[dbo].[matriculas]'))
ALTER TABLE [dbo].[matriculas] CHECK CONSTRAINT [ck_mat_year]
GO
/****** Object:  Trigger [dbo].[rdv_upd_num_cursos]    Script Date: 22/05/2019 23:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[rdv_upd_num_cursos]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TRIGGER [dbo].[rdv_upd_num_cursos] 
   ON  [dbo].[asignaciones]
   AFTER insert, delete, update
AS 
	begin transaction t1

		update [profesores]
		 set [prof_cursos_asignados] = t.n_cursos
		FROM (
		select a.prof_id, count(cur_nombre_curso)  as n_cursos 
		from  [dbo].[asignaciones] a
		inner join [dbo].[profesores] on a.[prof_id] =[dbo].[profesores].[prof_id]
		inner join [dbo].[cursos] on [dbo].[cursos].[cur_id] = a.[cur_id] 
		group by a.prof_id
		) t
		where t.prof_id = [profesores].[prof_id]

	commit transaction t1

' 
GO
ALTER TABLE [dbo].[asignaciones] ENABLE TRIGGER [rdv_upd_num_cursos]
GO
USE [master]
GO
ALTER DATABASE [TESTRDV] SET  READ_WRITE 
GO
