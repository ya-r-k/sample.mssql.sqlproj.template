CREATE TABLE [dbo].[QuestionUserOption] (
    [QuestionId]   BIGINT NOT NULL,
    [UserId]       INT    NOT NULL,
    [OptionNumber] INT    NOT NULL,
    CONSTRAINT [PK_QuestionUserOption] PRIMARY KEY CLUSTERED ([QuestionId] ASC, [UserId] ASC, [OptionNumber] ASC),
);
