# Docker-Dalamud

A Docker image built for developing and building [Dalamud](https://github.com/goatcorp/Dalamud)-dependant projects and plugins.

All Dalamud release files are sourced from the official [dalamud-distrib](https://github.com/goatcorp/dalamud-distrib) repository - you can confirm this by checking the checksums of the files in `/lib/dalamud`. All images are automatically updated on a regular interval.

The .NET SDK is also provided in this image and is automatically matched to whatever version that Dalamud is using at the time.

## Usage

Tags for this image are created using the format `{dalamud-branch}-{os-version}`, for example the stable branch for Dalamud using Alpine Linux would be `stable-alpine`. It is highly recommended not to just use the `latest` tag by itself as this is not explicitly defined and could randomly change.

To use this image, simply add the following to your `Dockerfile`:

```
FROM ghcr.io/blooym/docker-dalamud:<dalamud-branch>-<os-version>
```

[View all tags](https://github.com/Blooym/docker-dalamud/pkgs/container/docker-dalamud)

### In C# Projects

Add the following to your `.csproj` or `.targets` file, replacing any existing definitions of `DalamudLibPath` property.

```xml
<PropertyGroup>
  <DalamudLibPath Condition="$([MSBuild]::IsOSPlatform('Windows'))">$(appdata)\XIVLauncher\addon\Hooks\dev\</DalamudLibPath>
  <DalamudLibPath Condition="$([MSBuild]::IsOSPlatform('Linux'))">$(HOME)/.xlcore/dalamud/Hooks/dev/</DalamudLibPath>
  <DalamudLibPath Condition="$([MSBuild]::IsOSPlatform('OSX'))">$(HOME)/Library/Application Support/XIV on Mac/dalamud/Hooks/dev/</DalamudLibPath>
  <DalamudLibPath Condition="$(DALAMUD_HOME) != ''">$(DALAMUD_HOME)/</DalamudLibPath>
</PropertyGroup>
```
