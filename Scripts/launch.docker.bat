@echo off

rem Navigate to the directory where your docker-compose.yml file is located
cd "../Sample.Database/Sample.Database"

rem Build Docker image and start container based on the builded image
docker build -f Dockerfile -t sample-database-server ..
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=#&E*ye76t&#YGet8q7#*&YTtw8qytt&E7t378ET78etW*87" -p 1433:1433 -d --name sample-database-server sample-database-server

rem Wait user action
set /p WAITTEXT=Press Any key to continue...
