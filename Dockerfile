# 빌드 단계
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# 프로젝트 파일 복사 및 패키지 복원
COPY *.csproj ./
RUN dotnet restore

# 소스 코드 복사 및 빌드
COPY . .
RUN dotnet publish -c Release -o /app/publish

# 런타임 단계
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

# 빌드된 애플리케이션 복사
COPY --from=build /app/publish .

# 포트 노출
EXPOSE 8080

# 애플리케이션 실행
ENTRYPOINT ["dotnet", "HelloWorld.dll"]
