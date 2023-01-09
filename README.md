# Docker-Dalamud
A docker image built ontop of the `Dotnet/SDK:alpine` for developing and building [Dalamud](https://github.com/goatcorp/Dalamud)-dependant projects such as Plugins and Libraries.

## Using Docker-Dalamud with your project
In order to utilize the Dalamud setup inside of the container you will first need to be using `<DalamudLibPath>` to point at where your Dalamud files are located. Add the following below to your MsBuild (`.csproj`) configuration to allow for the `$DALAMUD_HOME` environment variable to replace the existing `<DalamudLibPath>` location on operating systems that are not Windows (such as the container runtime OS).

```csproj
<PropertyGroup Condition="'$(OS)' != 'Windows_NT'">
  <DalamudLibPath>$(DALAMUD_HOME)/</DalamudLibPath>
  <CopyLocalLockFileAssemblies>true</CopyLocalLockFileAssemblies>
</PropertyGroup>
```

## Image versions
This image is published under 3 separate tags, `latest`, `staging` and `experimental`, all include different versions of Dalamud. 

- `latest` will always point to the latest release version of Dalamud sent to regular users. Always stable to build projects with.
- `staging` will always point to the staging branch of Dalamud where changes are sent to testing users. Mostly stable to build projects with.
- `experimental` will point to the current testing grounds for big changes to Dalamud, such as API or .NET version increases. Please note that this tag may fall behind or be switched to mirror staging when there are no experimental changes within Dalamud currently available. Very unstable and should not be used long-term for projects.

All of Dalamud's library & release files are sourced from the official [Dalamud-Distrib](https://github.com/goatcorp/dalamud-distrib) repository; You can confirm this by checking the CI runs for this repository.

### Image URL
Add the following to the top of your Dockerfile and replace`latest` if you wish to use a different image version.

```
FROM ghcr.io/bitsofabyte/docker-dalamud:latest
```

## Image Updates
All images are automatically updated weekly and bundled in with the latest version of Dalamud for the tag assigned to it. The .NET version inside of the container will be incremented whenever it is supported by Dalamud.
