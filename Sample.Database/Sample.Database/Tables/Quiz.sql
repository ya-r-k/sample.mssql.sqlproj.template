CREATE TABLE [dbo].[Quiz] (
    [Id]          BIGINT         NOT NULL IDENTITY(1, 1),
    [Name]        NVARCHAR(256)  NOT NULL,
    [Description] NVARCHAR(2048) NULL,
    [CreatedAt]   SMALLDATETIME  NOT NULL,
    CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED ([Id] ASC),
);
