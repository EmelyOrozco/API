USE [Aerolinea]
GO
/****** Object:  Table [dbo].[Pilotos]    Script Date: 20/02/2023 14:22:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pilotos](
	[IDpiloto] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [int] NOT NULL,
	[NombrePiloto] [varchar](50) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[IDtelefono] [int] NOT NULL,
	[IDdireccion] [int] NOT NULL,
 CONSTRAINT [PK_Pilotos] PRIMARY KEY CLUSTERED 
(
	[IDpiloto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pilotos]  WITH CHECK ADD  CONSTRAINT [FK_Pilotos_Telefono] FOREIGN KEY([IDtelefono])
REFERENCES [dbo].[Telefono] ([IDtelefono])
GO
ALTER TABLE [dbo].[Pilotos] CHECK CONSTRAINT [FK_Pilotos_Telefono]
GO
