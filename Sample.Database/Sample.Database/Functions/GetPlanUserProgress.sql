CREATE FUNCTION [dbo].[GetPlanUserProgress]
(
    @planId INT,
    @userId INT
)
RETURNS INT
AS
BEGIN
    DECLARE @progress INT;

    SELECT @progress = CAST([dbo].GetPlanPointsCountByStatus(@planId, @userId, 3) AS REAL) / COUNT([PlanPointId]) * 100
    FROM [PlanPoint] pp
    LEFT JOIN [PlanPointUserProgress] ppup ON ppup.[PlanPointId] = pp.[Id]
    WHERE pp.[PlanId] = @planId AND ppup.[UserId] = @userId;

    RETURN @progress;
END
