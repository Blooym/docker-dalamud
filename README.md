# Docker-Dalamud
A  docker image for developing and building [Dalamud](https://github.com/goatcorp/Dalamud)-dependant projects, built ontop of the `Dotnet/SDK:alpine` image. The primary targets for this image are CI/CD Pipelines and Development Containers/Codespaces; though it should work for any other usecase as well.

## Project Setup
In order to build a Dotnet project that uses Dalamud, you will first need to be using `<DalamudLibPath>` to point at where your Dalamud files are located. Add the following below to allow for the `$DALAMUD_HOME` environment variable to replace the existing `<DalamudLibPath>` location on operating systems that are not WindowsNT.

```csproj
<PropertyGroup Condition="'$(OS)' != 'Windows_NT'>
  <DalamudLibPath>$(DALAMUD_HOME)/</DalamudLibPath>
  <CopyLocalLockFileAssemblies>true</CopyLocalLockFileAssemblies>
</PropertyGroup>
```

## Using the image
This image is published under 2 separate tags, `latest` and `staging`, which will both include different versions of Dalamud. All release files are sourced from the official [Dalamud-Distrib](https://github.com/goatcorp/dalamud-distrib) repository.

### Latest 
Latest is the current stable version of Dalamud and can used by adding the following to your Dockerfile:

```
FROM ghcr.io/bitsofabyte/docker-dalamud:latest
```

### Staging
Staging is the next version of Dalamud and can be used by adding the following to your Dockerfile:

```
FROM ghcr.io/bitsofabyte/docker-dalamud:staging
```

## Container Image Updates
All container images are automatically updated weekly and bundled in with the latest version of Dalamud for the tag assigned to it. The dotnet version inside of the container will be incremented whenever it is supported, stable and a base image is available for it.
