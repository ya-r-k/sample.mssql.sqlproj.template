CREATE FUNCTION [dbo].[GetPlanPointsCountByStatus]
(
    @planId INT,
    @userId INT,
    @status INT
)
RETURNS INT
AS
BEGIN
    DECLARE @pointsCount INT;

    -- Query for calculate plan points count in plan by userId and status
    SELECT @pointsCount = COUNT(ppup.[PlanPointId])
    FROM [PlanPoint] pp
    LEFT JOIN [PlanPointUserProgress] ppup ON ppup.[PlanPointId] = pp.[Id]
    WHERE pp.[PlanId] = @planId AND ppup.[UserId] = @userId AND ppup.[Status] = @status

    RETURN @pointsCount;
END
