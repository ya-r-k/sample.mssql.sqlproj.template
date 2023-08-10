/*
  This script is used to set up the necessary database objects and data for tSQLt testing.
  It prepares the testing environment by creating tables, inserting test data, and setting up other dependencies.
*/

EXEC sp_configure 'clr enabled', 1;
RECONFIGURE;
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'clr strict security', 0;
RECONFIGURE;

:r tSQLt\PrepareServer.sql
:r tSQLt\tSQLt.class.sql

SELECT * FROM sys.assemblies WHERE name = 'tSQLtCLR';

EXEC sp_configure 'clr strict security', 1;
RECONFIGURE;
