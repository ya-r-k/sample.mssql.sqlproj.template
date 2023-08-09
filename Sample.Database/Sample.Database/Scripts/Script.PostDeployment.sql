/*
Post-Deployment Script Template
--------------------------------------------------------------------------------------
This file contains SQL instructions that will be added to the build script.
Use SQLCMD syntax to include a file in the post-deployment script.
Example:      :r .\myfile.sql

Use SQLCMD syntax to create a variable reference in the post-deployment script.
Example:      :setvar TableName MyTable
              SELECT * FROM [$(TableName)]
--------------------------------------------------------------------------------------
*/

:r Script.FillForPlanFunctionality.sql
