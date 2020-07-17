#estagio 1 - base
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
RUN mkdir /app
WORKDIR /app
EXPOSE 80/tcp

#estagio 2 - publish
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS publish
WORKDIR /app
COPY Site.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o dist

#estagio 3 - final
FROM base AS final
WORKDIR /dist
COPY --from=publish /app/dist .
ENTRYPOINT ["dotnet", "Site.dll"]
