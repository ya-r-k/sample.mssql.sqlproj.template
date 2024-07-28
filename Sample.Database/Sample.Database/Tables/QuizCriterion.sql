CREATE TABLE [dbo].[QuizCriterion] (
    [QuizId]      BIGINT NOT NULL,
    [CriterionId] INT    NOT NULL,
    CONSTRAINT [PK_QuizCriterion] PRIMARY KEY CLUSTERED ([QuizId] ASC, [CriterionId] ASC),
);
