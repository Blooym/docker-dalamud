# Docker-Dalamud
A Docker image built ontop of the [`Dotnet/SDK:alpine`](https://github.com/dotnet/dotnet-docker) for developing and building [Dalamud](https://github.com/goatcorp/Dalamud)-dependant projects.

## Image versions
This image is published under 2 separate tags: 
  - `latest`: Points to the latest stable release of Dalamud.
  - `staging`: Points to the staging branch release Dalamud, good for development and testing.

All release files are sourced from the official [Dalamud-Distrib](https://github.com/goatcorp/dalamud-distrib) repository - you can confirm this by checking the checksums of the files in `/lib/dalamud`.

### Image URL
Add the following to the top of your Dockerfile and replace`latest` if you wish to use a different image version.

```
FROM ghcr.io/bitsofabyte/docker-dalamud:latest
```

## Image Updates
All images are automatically updated and bundled in with the latest version of Dalamud for the tag assigned to it. The .NET version inside of the container will be incremented whenever it is supported by Dalamud.

## Using with C# projects
To use this image with your C# project, you will need to add the following to your `.csproj` file. Please note that you will need to be using `<DalamudLibPath>` for your Dalamud library references for this to work.

```csproj
<PropertyGroup Condition="'$(OS)' != 'Windows_NT'">
  <DalamudLibPath>$(DALAMUD_HOME)/</DalamudLibPath>
  <CopyLocalLockFileAssemblies>true</CopyLocalLockFileAssemblies>
</PropertyGroup>
```