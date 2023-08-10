@echo off

rem Navigate to the directory where your Sample.Database.csproj file is located
cd "../Sample.Database/Sample.Database/"

rem Publish database with name SampleDb to local database server
dotnet publish /p:TargetServerName=(local) /p:TargetDatabaseName=TestSampleDb

rem Navigate to the directory where your Sample.Database.Tests.csproj file is located
cd "../Sample.Database.Tests"

rem Set up the TestSampleDb database and execute the InstallTests.sql script to prepare the testing environment.
SQLCMD -d TestSampleDb -i InstallTests.sql
rem Set up the TestSampleDb database and execute the query to run database tests.
SQLCMD -d TestSampleDb -q "EXEC tSQLt.RunAll;"

rem Wait user action
set /p WAITTEXT=Press Any key to continue...
