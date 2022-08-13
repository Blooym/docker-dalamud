# Docker-Dalamud

A controlled docker environment for developing Dalamud Plugins with Dotnet, built ontop of `DotnetSDK:Alpine`. The primary target of this image is for [Dev Containers](https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/introduction-to-dev-containers) and CI/CD environments.

## Usage

To work on a project inside of this environment, you must first add the following to your plugin `.csproj` file to be able to use the bundled dependencies.

```
<PropertyGroup Condition="'$([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform($([System.Runtime.InteropServices.OSPlatform]::Linux)))'">
    <DalamudLibPath>$(DALAMUD_HOME)/</DalamudLibPath>
    <CopyLocalLockFileAssemblies>true</CopyLocalLockFileAssemblies>
</PropertyGroup>
```

You can then use the image by adding the following to your Dockerfile:

```
FROM ghcr.io/bitsofabyte/docker-dalamud:latest
```

## Image Updates

The container image will automatically rebuild & publish itself every week with the latest Dalamud library files; and the Dotnet SDK version will be manually changed to the latest stable version when released unless it is incompatible.
