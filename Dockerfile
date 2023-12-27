# Используем образ с .NET SDK
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# Копируем файл решения и восстанавливаем зависимости
COPY Test.sln ./
# Копируем все файлы и выполняем сборку проекта
COPY . .
