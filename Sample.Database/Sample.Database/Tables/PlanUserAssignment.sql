CREATE TABLE [dbo].[PlanUserAssignment] (
    [PlanId] INT NOT NULL,
    [UserId] INT NOT NULL,
    CONSTRAINT [PK_PlanUserAssignment]      PRIMARY KEY CLUSTERED ([PlanId] ASC, [UserId] ASC),
    CONSTRAINT [FK_PlanUserAssignment_Plan] FOREIGN KEY ([PlanId]) REFERENCES [dbo].[Plan] ([Id])
);
