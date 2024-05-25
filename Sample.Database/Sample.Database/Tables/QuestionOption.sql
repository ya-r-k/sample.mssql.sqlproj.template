CREATE TABLE [dbo].[QuestionOption] (
    [QuestionId]   BIGINT        NOT NULL,
    [OptionNumber] INT           NOT NULL,
    [OptionLetter] NCHAR(1)      NULL,
    [Text]         NVARCHAR(256) NOT NULL,
    [IsCorrect]    BIT           NOT NULL,
    CONSTRAINT [PK_QuestionOption] PRIMARY KEY CLUSTERED ([QuestionId] ASC, [OptionNumber] ASC),
);
