# Docker-Dalamud
A controlled docker environment for developing [Dalamud](https://github.com/goatcorp/Dalamud)-dependant projects with Dotnet, built ontop of the `Dotnet/SDK:<ver>-alpine` image. 

The primary target of this image is for [development containers](https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/introduction-to-dev-containers) and CI/CD environments, though it will work for any use-case.

## Pre-Requisites
In order to be able to compile a project that uses Dalamud inside of the container, you must be using `DalamudLibPath` and have the following inside of your csproj file:

```
<PropertyGroup Condition="'$([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform($([System.Runtime.InteropServices.OSPlatform]::Linux)))'">
    <DalamudLibPath>$(DALAMUD_HOME)/</DalamudLibPath>
    <CopyLocalLockFileAssemblies>true</CopyLocalLockFileAssemblies>
</PropertyGroup>
```

## Usage 
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
