-- Script to fill data for plan functionality.

BEGIN TRANSACTION;

DECLARE @PlanNumber INT
DECLARE @PlanId INT
DECLARE @PlanPointId INT

-- Get the UserId values
SET @PlanNumber = 1
SET @PlanPointId = 1

WHILE @PlanNumber <= 25
BEGIN
  INSERT INTO [dbo].[Plan] ([Name], [Description], [Frequency], [CreatedAt])
  VALUES
    ('Plan ' + CAST(@PlanNumber AS VARCHAR(10)), 'Description about plan ' + CAST(@PlanNumber AS VARCHAR(10)), FLOOR(RAND() * 5) + 1, DATEADD(day, -FLOOR(RAND() * 365), GETDATE()));

	SET @PlanNumber = @PlanNumber + 1
	SET @PlanId = SCOPE_IDENTITY()

	DECLARE @PointsCount INT
	DECLARE @PointNumber INT

	SET @PointsCount = FLOOR(RAND() * 5) + 5
	SET @PointNumber = 1

	WHILE @PointNumber <= @PointsCount
	BEGIN
    INSERT INTO [dbo].[PlanPoint] ([PlanId], [Description])
		VALUES (@PlanId, 'Description for plan point ' + CAST(@PlanPointId AS VARCHAR(10)));

		SET @PlanPointId = @PlanPointId + 1
		SET @PointNumber = @PointNumber + 1
	END;

	DECLARE @UsersCount INT
	DECLARE @UserNumber INT
	DECLARE @UserId INT

	SET @UsersCount = FLOOR(RAND() * 5) + 5
	SET @UserNumber = 1
	SET @UserId = FLOOR(RAND() * 4) + 1

	WHILE @UserNumber <= @UsersCount
	BEGIN
    INSERT INTO [dbo].[PlanUserAssignment] ([PlanId], [UserId])
		VALUES (@PlanId, @UserId);

		SET @UserId = @UserId + FLOOR(RAND() * 4) + 1
		SET @UserNumber = @UserNumber + 1
	END;
END;

-- Get the UserId values

SELECT TOP(1) @PlanPointId = [Id] FROM [PlanPoint]

-- Insert data into the `PlanPointUserProgress` table using a loop
WHILE 1 = 1
BEGIN
		SELECT TOP(1) @UserId = [UserId] FROM [PlanPoint] pp
		LEFT JOIN [PlanUserAssignment] pua ON pp.[PlanId] = pua.[PlanId]
		WHERE pp.[Id] = @PlanPointId;

		WHILE 1 = 1
		BEGIN
				DECLARE @Status INT;
				DECLARE @StartedAt DATETIME;
				DECLARE @FinishedAt DATETIME;

				SET @Status = FLOOR(RAND() * 3); -- Randomly select a status (0, 1, or 2)
				SET @StartedAt = DATEADD(day, -FLOOR(RAND() * 365), GETDATE()); -- Randomly select a past date
				SET @FinishedAt = CASE WHEN @Status = 2 THEN DATEADD(day, FLOOR(RAND() * 30), @StartedAt) ELSE NULL END; -- Randomly select a future date if status is "Completed"

				INSERT INTO [dbo].[PlanPointUserProgress] ([PlanPointId], [UserId], [Status], [StartedAt], [FinishedAt])
				VALUES (@PlanPointId, @UserId, @Status, @StartedAt, @FinishedAt);

				IF (SELECT TOP(1) COUNT([UserId]) FROM [PlanPoint] pp
						LEFT JOIN [PlanUserAssignment] pua ON pp.[PlanId] = pua.[PlanId]
						WHERE pp.[Id] = @PlanPointId AND pua.[UserId] > @UserId) = 0 BREAK

				SELECT TOP(1) @UserId = [UserId] FROM [PlanPoint] pp
				LEFT JOIN [PlanUserAssignment] pua ON pp.[PlanId] = pua.[PlanId]
				WHERE pp.[Id] = @PlanPointId AND pua.[UserId] > @UserId;
		END

		IF (SELECT TOP(1) COUNT([Id]) FROM [PlanPoint] WHERE [Id] > @PlanPointId) = 0 BREAK
		
		SELECT TOP(1) @PlanPointId = [Id] FROM [PlanPoint] WHERE [Id] > @PlanPointId
END;

COMMIT TRANSACTION;
