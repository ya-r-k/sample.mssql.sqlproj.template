# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR "/src/Sample.Database"

# Copy project files
COPY ["Sample.Database/Sample.Database.csproj", "."]
COPY ["Sample.Database/*.sql", "."]
COPY [".", ".."]

# Restore dependencies
RUN dotnet restore

# Build the application
RUN dotnet build -c Release -o /app/build

# Stage 2: Database
FROM mcr.microsoft.com/mssql/server:2022-latest AS database
EXPOSE 1433

# Switch to root user
USER root

# Install required packages
RUN apt-get update && apt-get install -y \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Download and set up SQLPackage for Linux
RUN wget -progress=bar:force -q -O sqlpackage.zip https://aka.ms/sqlpackage-linux \
    && unzip -qq sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage \
    && chown -R mssql /opt/sqlpackage \
    && mkdir /tmp/db \
    && chown -R mssql /tmp/db \
    && rm sqlpackage.zip

# Copy the built dacpac file from the build stage
COPY --from=build /app/build/Sample.Database.dacpac /tmp/db/Sample.Database.dacpac

# Set environment variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD='#&E*ye76t&#YGet8q7#*&YTtw8qytt&E7t378ET78etW*87'
ENV DB_NAME=QuestionnaireDb

# Start SQL Server and publish the database
RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" \
    && /opt/sqlpackage/sqlpackage /a:Publish /tsn:localhost /tdn:$DB_NAME /tu:sa /tp:$SA_PASSWORD /sf:/tmp/db/Sample.Database.dacpac /stsc:true /ttsc:true \
    && rm -r /tmp/db/Sample.Database.dacpac \
    && pkill sqlservr \
    && rm -r /opt/sqlpackage
