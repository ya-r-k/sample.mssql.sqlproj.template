FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Sample.Database/Sample.Database.csproj", "Sample.Database/"]
COPY ["Sample.Database/*.sql", "Sample.Database/"]
COPY . .
WORKDIR "/src/Sample.Database"
RUN dotnet restore
RUN dotnet build -c Release -o /app/build

FROM mcr.microsoft.com/mssql/server:2022-latest AS database
EXPOSE 1433

# Elevate to root to install required packages
USER root

RUN apt-get update \
    && apt-get install unzip libunwind8 libicu66 libssl-dev -y

# Install SQLPackage for Linux and make it executable
RUN wget -progress=bar:force -q -O sqlpackage.zip https://aka.ms/sqlpackage-linux \
    && unzip -qq sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage \
    && chown -R mssql /opt/sqlpackage \
    && mkdir /tmp/db \
    && chown -R mssql /tmp/db

COPY --from=build /app/build/Sample.Database.dacpac /tmp/db/Sample.Database.dacpac

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD='#&E*ye76t&#YGet8q7#*&YTtw8qytt&E7t378ET78etW*87'

# Launch SQL Server, confirm startup is complete, deploy the DACPAC, then terminate SQL Server.
# See https://stackoverflow.com/a/51589787/488695
RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" \
    && /opt/sqlpackage/sqlpackage /a:Publish /tsn:localhost /tdn:SampleDb /tu:sa /tp:$SA_PASSWORD /sf:/tmp/db/Sample.Database.dacpac /stsc:true /ttsc:true \
    && rm -r /tmp/db/Sample.Database.dacpac \
    && pkill sqlservr \
    && rm -r /opt/sqlpackage
