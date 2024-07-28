CREATE TABLE [dbo].[QuestionUserEvaluation] (
    [QuestionId]      BIGINT         NOT NULL,
    [UserId]          INT            NOT NULL,
    [AnswerText]      NVARCHAR(4000) NOT NULL,
    [Description]     NVARCHAR(4000) NOT NULL,
    [Score]           NUMERIC(3, 2)  NOT NULL,
    [IsAiBased]       BIT            NOT NULL,
    [IsHumanApproved] BIT            NOT NULL,
    CONSTRAINT [PK_QuestionUserEvaluation] PRIMARY KEY CLUSTERED ([QuestionId] ASC, [UserId] ASC),
);
