# minecraft-bedrock

Arch package for a user-level helper that runs the Windows Minecraft launcher
and Minecraft Bedrock/GDK build through Steam's Proton runtime.

The package does not redistribute Minecraft, the Minecraft installer, Proton,
or game content. It installs a helper, desktop entry, and Steam shortcut writer.
Run the helper as your normal user after installing the package.

The package depends on `steam`, `proton-ge-custom-bin`, `winetricks`, and the
basic archive/download tools it calls. GDK-Proton is not packaged in AUR, so the
helper can still download Weather-OS GDK-Proton as a fallback or when explicitly
requested.

## Quick start

```sh
minecraft-bedrock setup
```

That command:

1. Downloads Mojang's current Windows 10/11 GameCore installer from
   `aka.ms/minecraftClientGameCoreWindows`.
2. Uses Steam's installed Proton by default, then falls back to the
   pacman-managed `proton-ge-custom-bin` compatibility tool. If no packaged or
   Steam-managed Proton install is found, it downloads the latest Weather-OS
   GDK-Proton release into Steam's `compatibilitytools.d` directory. Set
   `MINECRAFT_BEDROCK_PREFER_GDK_PROTON=1` to prefer GDK-Proton when both are
   installed.
3. Installs native .NET Framework 4.8 into the compatdata prefix before Proton
   initializes it. Wine Mono can start loading the installer but fails on WinRT
   runtime metadata, and `dotnet48` is fragile in already-initialized Proton
   prefixes.
4. Creates or upgrades the Proton compatdata prefix under
   `${XDG_DATA_HOME:-~/.local/share}/minecraft-bedrock/compatdata/0`.
5. Stages the WinRT contract metadata that the GameCore installer expects from
   Microsoft's `Microsoft.Windows.SDK.Contracts` NuGet package.
6. Runs the Minecraft installer in that prefix.
7. Applies the known GDK-Proton `XCurl.dll` and CA bundle patch if
   `Minecraft.Windows.exe` is already installed.
8. Adds or updates a Steam non-Steam shortcut named
   `Minecraft Bedrock (Proton)`.

If the launcher installer finishes before Bedrock itself is installed, run the
game install in the launcher, then run:

```sh
minecraft-bedrock patch-online
```

## Commands

```sh
minecraft-bedrock setup
minecraft-bedrock setup --legacy
minecraft-bedrock stop
minecraft-bedrock purge --yes
minecraft-bedrock install-proton
minecraft-bedrock download-installer
minecraft-bedrock download-installer --legacy
minecraft-bedrock install-winrt-contracts
minecraft-bedrock init-prefix
minecraft-bedrock install-prereqs
minecraft-bedrock install-launcher
minecraft-bedrock configure-launcher
minecraft-bedrock patch-online
minecraft-bedrock add-steam-shortcut
minecraft-bedrock launch launcher
minecraft-bedrock launch game
minecraft-bedrock paths
```

With no arguments, `minecraft-bedrock` launches the game if
`Minecraft.Windows.exe` is present, otherwise it launches the Minecraft
launcher.

The launcher uses CEF/Chromium. The helper passes software-rendering flags to
`MinecraftLauncher.exe` by default because the launcher can otherwise open as a
black window under Wine/Proton. Set `MINECRAFT_BEDROCK_NO_LAUNCHER_ARGS=1` to
disable those flags, or set `MINECRAFT_BEDROCK_LAUNCHER_ARGS` to test a custom
flag set.

The helper also writes `disableGPU: true` and `additionalCEFOptions` into the
launcher's `launcher_settings.json`, because the launcher builds Chromium
subprocess command lines internally and does not reliably propagate all wrapper
arguments. Reapply this without reinstalling with:

```sh
minecraft-bedrock configure-launcher
```

`minecraft-bedrock purge` tears down the user-level test environment and asks
for confirmation. Use `minecraft-bedrock purge --yes` for non-interactive E2E
resets. It removes the Steam shortcut, compatdata prefix, app data, state, cache,
running helper-owned Wine/Proton processes, and helper-managed GDK-Proton
installs. Use `--keep-cache`, `--keep-proton`, or `--keep-shortcut` to preserve
those pieces. Use `minecraft-bedrock stop` on its own to stop a hung installer or
launcher without deleting files.

## Environment overrides

`MINECRAFT_BEDROCK_PROTON_PATH` can point at a Proton directory or `proton`
script.

`MINECRAFT_BEDROCK_PREFER_GDK_PROTON=1` chooses GDK-Proton before Steam's own
Proton when both are installed.

`MINECRAFT_BEDROCK_COMPAT_DATA_PATH` changes the compatdata directory. Proton's
Wine prefix lives at `$MINECRAFT_BEDROCK_COMPAT_DATA_PATH/pfx`.

`MINECRAFT_BEDROCK_INSTALLER` points at a pre-downloaded installer.

`MINECRAFT_BEDROCK_WINRT_CONTRACTS_DIR` points at a directory containing
`Windows.Foundation.FoundationContract.winmd` and
`Windows.Foundation.UniversalApiContract.winmd`. If unset, the helper downloads
them from Microsoft's `Microsoft.Windows.SDK.Contracts` NuGet package and caches
them under `${XDG_CACHE_HOME:-~/.cache}/minecraft-bedrock`.

`MINECRAFT_BEDROCK_WINRT_CONTRACTS_VERSION`, `MINECRAFT_BEDROCK_WINRT_CONTRACTS_URL`,
and `MINECRAFT_BEDROCK_WINRT_CONTRACTS_SHA256` can be used together to test a
different SDK contracts package.

`MINECRAFT_BEDROCK_NO_IMPORT_GUI_ENV=1` disables importing `DISPLAY`,
`WAYLAND_DISPLAY`, `XAUTHORITY`, and related variables from the systemd user
manager. By default, the helper imports them when launched from a shell that
lacks a graphical session environment.

`MINECRAFT_BEDROCK_DISABLE_GPU=0` prevents the helper from writing
`disableGPU: true` and `additionalCEFOptions` to `launcher_settings.json`.

`MINECRAFT_BEDROCK_CEF_OPTIONS` overrides the CEF switches written to
`launcher_settings.json`. Use switch names without leading `--`.

`MINECRAFT_BEDROCK_LAUNCHER_ARGS` overrides the default CEF/Chromium flags
passed to `MinecraftLauncher.exe`.

`MINECRAFT_BEDROCK_NO_LAUNCHER_ARGS=1` launches `MinecraftLauncher.exe` without
extra flags.

`MINECRAFT_BEDROCK_STEAM_USER_ID` selects a Steam userdata account when
multiple accounts exist.

`MINECRAFT_BEDROCK_SKIP_WINETRICKS=1` skips all winetricks-managed
prerequisites.

`MINECRAFT_BEDROCK_SKIP_DOTNET=1` skips native .NET Framework 4.8 for the
GameCore installer. This is mainly useful for diagnostics; the GameCore
installer fails under Wine Mono in current testing.

## Caveats

This targets the current community GDK-Proton path. Minecraft Bedrock on
Windows has historically depended on Microsoft Store, Gaming Services, Xbox,
and GDK APIs that upstream Wine/Proton do not fully implement. GDK-Proton can
change quickly, Microsoft login support may be incomplete, and Minecraft
updates can break the setup.

Steam should be restarted after `add-steam-shortcut`. If Steam is running while
the shortcut file is edited, it can overwrite the file on exit.
