CREATE TABLE [dbo].[Criterion] (
    [Id]       INT            NOT NULL IDENTITY(1, 1),
    [Name]     NVARCHAR(256)  NOT NULL,
    [AiPrompt] NVARCHAR(2048) NOT NULL,
    [MinScore] NUMERIC(3, 2)  NOT NULL,
    [MaxScore] NUMERIC(3, 2)  NOT NULL,
    CONSTRAINT [PK_Criterion] PRIMARY KEY CLUSTERED ([Id] ASC),
);
