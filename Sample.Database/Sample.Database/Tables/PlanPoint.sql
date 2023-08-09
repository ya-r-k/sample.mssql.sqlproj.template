CREATE TABLE [dbo].[PlanPoint] (
    [Id]          INT            NOT NULL IDENTITY(1, 1),
    [PlanId]      INT            NOT NULL,
    [Description] NVARCHAR(2048) NULL,
    CONSTRAINT [PK_PlanPoint] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PlanPoint_Plan] FOREIGN KEY ([PlanId]) REFERENCES [dbo].[Plan] ([Id]),
);
