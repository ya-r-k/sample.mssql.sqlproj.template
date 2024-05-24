CREATE TABLE [dbo].[Question] (
    [Id]         BIGINT         NOT NULL IDENTITY(1, 1),
    [QuizId]     INT            NOT NULL,
    [Text]       NVARCHAR(1024) NOT NULL,
    [Type]       INT            NOT NULL, -- 0 - OpenEnded, 1 - CloseEnded
    [Complexity] INT            NOT NULL,
    CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Question_Quiz] FOREIGN KEY ([QuizId]) REFERENCES [dbo].[Quiz] ([Id]),
);
