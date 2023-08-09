CREATE TABLE [dbo].[Plan] (
    [Id]          INT            NOT NULL IDENTITY(1, 1),
    [Name]        NVARCHAR(256)  NOT NULL,
    [Description] NVARCHAR(2048) NULL,
    [BannerPath]  NVARCHAR(2048) NULL,
    [Frequency]   INT            NOT NULL, -- Once - 0, Daily - 1, Weekly - 2, Monthly - 3, Quarterly - 4, Yearly - 5
    [CreatedAt]   DATETIME       NOT NULL,
    CONSTRAINT [PK_Plan]           PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Plan_Name]      UNIQUE ([Name]),
    CONSTRAINT [CK_Plan_Frequency] CHECK  ([Frequency] IN (0, 1, 2, 3, 4, 5))
);
