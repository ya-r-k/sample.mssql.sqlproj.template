CREATE TABLE [dbo].[QuizUser] (
    [QuizId]              BIGINT        NOT NULL,
    [UserId]              INT           NOT NULL,
    [Role]                INT           NOT NULL, -- Student - 0, Reviewer - 1, Supervisor - 2
    [ParticipationStatus] INT           NOT NULL, -- Pending - 0, Accepted - 1, Rejected - 2
    [AssignedDate]        SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_QuizUser] PRIMARY KEY CLUSTERED ([QuizId] ASC, [UserId] ASC),
);
