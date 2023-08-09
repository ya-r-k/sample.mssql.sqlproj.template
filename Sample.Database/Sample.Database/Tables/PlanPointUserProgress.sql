CREATE TABLE [dbo].[PlanPointUserProgress] (
    [PlanPointId]          INT            NOT NULL,
    [UserId]               INT            NOT NULL,
    [Status]               INT            NOT NULL, -- 0 - NotStarted, 1 - InProgress, 2 - Completed
    [StartedAt]            DATETIME       NOT NULL,
    [FinishedAt]           DATETIME       NULL,
    CONSTRAINT [PK_PlanPointUserProgress]            PRIMARY KEY CLUSTERED ([PlanPointId] ASC, [UserId] ASC),
    CONSTRAINT [FK_PlanPointUserProgress_PlanPoint]  FOREIGN KEY ([PlanPointId]) REFERENCES [dbo].[PlanPoint] ([Id]),
    CONSTRAINT [CK_PlanPointUserProgress_Status]     CHECK  ([Status] IN (0, 1, 2)),
    CONSTRAINT [CK_PlanPointUserProgress_FinishedAt] CHECK  ([FinishedAt] IS NULL OR [FinishedAt] >= [StartedAt]),
);
