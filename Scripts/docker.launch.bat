@echo off

rem Navigate to the directory where your docker-compose.yml file is located
cd "../Sample.Database/Sample.Database"

rem Build Docker image and start container based on the builded image
docker build -f Dockerfile -t sample-database-server ..
docker run sample-database-server

rem Wait user action
set /p WAITTEXT=Press Any key to continue...
