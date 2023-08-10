CREATE PROCEDURE [sampleTests].[test_Constraint_PlanFrequency]
AS
BEGIN
    -- Assert that the constraint exists
    EXEC tSQLt.AssertObjectExists 'dbo.Plan.CK_Plan_Frequency';

    -- Test valid Frequency values
    EXEC tSQLt.AssertConstraintPasses 'dbo.Plan', 'CK_Plan_Frequency', 'Frequency = 0'; -- Once
    EXEC tSQLt.AssertConstraintPasses 'dbo.Plan', 'CK_Plan_Frequency', 'Frequency = 1'; -- Daily
    EXEC tSQLt.AssertConstraintPasses 'dbo.Plan', 'CK_Plan_Frequency', 'Frequency = 2'; -- Weekly
    EXEC tSQLt.AssertConstraintPasses 'dbo.Plan', 'CK_Plan_Frequency', 'Frequency = 3'; -- Monthly
    EXEC tSQLt.AssertConstraintPasses 'dbo.Plan', 'CK_Plan_Frequency', 'Frequency = 4'; -- Quarterly
    EXEC tSQLt.AssertConstraintPasses 'dbo.Plan', 'CK_Plan_Frequency', 'Frequency = 5'; -- Yearly

    -- Test invalid Frequency values
    EXEC tSQLt.AssertConstraintFails 'dbo.Plan', 'CK_Plan_Frequency', 'Frequency = -1'; -- Invalid
    EXEC tSQLt.AssertConstraintFails 'dbo.Plan', 'CK_Plan_Frequency', 'Frequency = 6';  -- Invalid
END;
