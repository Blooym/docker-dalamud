# Docker-Dalamud

A Docker image built ontop of the [`Dotnet/SDK:alpine`](https://github.com/dotnet/dotnet-docker) for developing and building [Dalamud](https://github.com/goatcorp/Dalamud)-dependant projects.

All release files are sourced from the official [Dalamud-Distrib](https://github.com/goatcorp/dalamud-distrib) repository - you can confirm this by checking the checksums of the files in `/lib/dalamud`. All images are automatically updated on regular intervals.

## Usage

Add the following to the top of your Dockerfile and replace `latest` if you wish to use a different image version. ([View all](https://github.com/Blooym/docker-dalamud/pkgs/container/docker-dalamud))

```
FROM ghcr.io/blooym/docker-dalamud:latest
```

### C# Projects

To use this image with your C# project, you will need to add the following to your `.csproj` file. Please note that you will need to be using `<DalamudLibPath>` for your Dalamud library references for this to work.

```csproj
<PropertyGroup Condition="'$(OS)' != 'Windows_NT'">
  <DalamudLibPath>$(DALAMUD_HOME)/</DalamudLibPath>
  <CopyLocalLockFileAssemblies>true</CopyLocalLockFileAssemblies>
</PropertyGroup>
```