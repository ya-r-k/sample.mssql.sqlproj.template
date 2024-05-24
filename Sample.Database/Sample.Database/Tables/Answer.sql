CREATE TABLE [dbo].[Answer] (
    [QuestionId]   BIGINT         NOT NULL,
    [UserId]       INT            NOT NULL,
    [Text]         NVARCHAR(4000) NULL,
    [Evaluation]   REAL           NULL,
    CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED ([Id] ASC, [Answer] ASC),
);
