@echo off

rem Navigate to the directory where your Sample.Database.csproj file is located
cd "../Sample.Database/Sample.Database/"

rem Publish database with name SampleDb to local database server
dotnet publish /p:TargetServerName=(local) /p:TargetDatabaseName=QuestionnaireDb

rem Wait user action
set /p WAITTEXT=Press Any key to continue...
