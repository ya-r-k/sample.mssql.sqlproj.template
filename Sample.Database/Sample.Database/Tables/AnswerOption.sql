CREATE TABLE [dbo].[AnswerOption] (
    [QuestionId]   BIGINT NOT NULL,
    [UserId]       INT    NOT NULL,
    [OptionNumber] INT    NOT NULL,
    CONSTRAINT [PK_AnswerOption] PRIMARY KEY CLUSTERED ([QuestionId] ASC, [UserId] ASC, [OptionNumber] ASC),
);
