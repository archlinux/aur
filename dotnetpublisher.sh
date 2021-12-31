dotnet publish $1 -o linux-x64 -r linux-x64  --self-contained true -o $2 /p:PublishSingleFile=true /p:IncludeNativeLibariesForSelfExtract=true
