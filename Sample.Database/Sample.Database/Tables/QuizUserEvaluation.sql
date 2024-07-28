CREATE TABLE [dbo].[QuizUserEvaluation] (
    [QuizId]          BIGINT         NOT NULL,
    [UserId]          INT            NOT NULL,
    [Description]     NVARCHAR(4000) NOT NULL,
    [Score]           NUMERIC(3, 2)  NOT NULL,
    [IsAiBased]       BIT            NOT NULL,
    [IsHumanApproved] BIT            NOT NULL,
    CONSTRAINT [PK_QuizUserEvaluation] PRIMARY KEY CLUSTERED ([QuizId] ASC, [UserId] ASC),
);
