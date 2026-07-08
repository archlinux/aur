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
3. Creates or upgrades the Proton compatdata prefix under
   `${XDG_DATA_HOME:-~/.local/share}/minecraft-bedrock/compatdata/0`.
4. Stages the WinRT contract metadata that the GameCore installer expects from
   Microsoft's `Microsoft.Windows.SDK.Contracts` NuGet package.
5. Patches the staged GameCore installer to avoid a Proton Mono failure in the
   WinRT high-contrast theme check.
6. Runs the Minecraft installer in that prefix.
7. Applies the known GDK-Proton online support patches if
   `Minecraft.Windows.exe` is already installed.
8. Installs the Microsoft GameInput redist from direct GDK game archives when
   a game executable is available.
9. Adds or updates a Steam non-Steam shortcut named
   `Minecraft Bedrock (Proton)`.

If the launcher installer finishes before Bedrock itself is installed, run the
game install in the launcher, then run:

```sh
minecraft-bedrock patch-online
```

The current GameCore installer can fail under Wine/Proton when it reaches the
Microsoft Store install API. For E2E testing without the launcher, import an
extracted GDK build you are allowed to use:

```sh
minecraft-bedrock install-game /path/to/MinecraftWindowsGDK.zip
minecraft-bedrock setup --installed-game
```

Or opt into a GitHub release source that publishes extracted game archives:

```sh
MINECRAFT_BEDROCK_GAME_ARCHIVE_REPO=owner/repo minecraft-bedrock setup --game-archive
```

The direct game path requires GDK-Proton by default, because regular Steam
Proton can exit before Minecraft creates a window. Set
`MINECRAFT_BEDROCK_PREFER_STEAM_PROTON=1` to override that for diagnostics.
It also installs the bundled Microsoft GameInput redist directly from
`Installers/GameInputRedist.msi`; otherwise Minecraft can stop at a missing
component prompt on first launch.

## Commands

```sh
minecraft-bedrock setup
minecraft-bedrock setup --legacy
minecraft-bedrock setup --game-archive
minecraft-bedrock setup --installed-game
minecraft-bedrock stop
minecraft-bedrock purge --yes
minecraft-bedrock install-proton
minecraft-bedrock download-installer
minecraft-bedrock download-installer --legacy
minecraft-bedrock install-winrt-contracts
minecraft-bedrock patch-installer
minecraft-bedrock init-prefix
minecraft-bedrock install-prereqs
minecraft-bedrock patch-proton-runtime
minecraft-bedrock install-gameinput
minecraft-bedrock install-launcher
minecraft-bedrock list-game-versions
minecraft-bedrock download-game
minecraft-bedrock install-game /path/to/game.zip
minecraft-bedrock configure-launcher
minecraft-bedrock patch-online
minecraft-bedrock add-steam-shortcut
minecraft-bedrock launch launcher
minecraft-bedrock launch game
minecraft-bedrock launch installer
minecraft-bedrock paths
```

With no arguments, `minecraft-bedrock` launches the game if
`Minecraft.Windows.exe` is present, otherwise it launches the Minecraft
launcher. If neither executable is installed yet, it runs the installer instead
of exiting silently.

`setup` only adds the Steam shortcut after the installer leaves either a launcher
or game executable in the prefix. If the GameCore installer shows an error and
exits without installing the launcher, setup fails before creating a broken
shortcut.

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

`MINECRAFT_BEDROCK_PREFER_STEAM_PROTON=1` keeps direct game launches on regular
Steam Proton instead of automatically preferring GDK-Proton. This is mainly
useful for comparing failures.

`MINECRAFT_BEDROCK_NO_PROTON_PATCH=1` skips the GDK-Proton runtime DLL patches.
`MINECRAFT_BEDROCK_ALLOW_PROTON_PATCH=1` allows those patches against a
non-GDK runtime selected with `MINECRAFT_BEDROCK_PROTON_PATH`.

`MINECRAFT_BEDROCK_COMPAT_DATA_PATH` changes the compatdata directory. Proton's
Wine prefix lives at `$MINECRAFT_BEDROCK_COMPAT_DATA_PATH/pfx`.

`MINECRAFT_BEDROCK_INSTALLER` points at a pre-downloaded installer.

`MINECRAFT_BEDROCK_GAME_ARCHIVE_URL` points at a zip, appx, appxbundle, msix,
or msixbundle containing `Minecraft.Windows.exe` and `AppxManifest.xml`.

`MINECRAFT_BEDROCK_GAME_ARCHIVE_REPO` points at a GitHub `owner/repo` to use
with `list-game-versions`, `download-game`, and `setup --game-archive`.
Because this may involve unofficial redistribution of Minecraft game files, it
is opt-in and has no default.

`MINECRAFT_BEDROCK_GAME_VERSION` selects a release tag from the configured game
archive repo. By default, prereleases are skipped when choosing automatically;
set `MINECRAFT_BEDROCK_INCLUDE_PRERELEASE=1` to allow them.

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

`MINECRAFT_BEDROCK_NO_INSTALLER_PATCH=1` skips the GameCore installer patch.
This is mainly useful for diagnostics; the unpatched installer currently fails
under Proton Mono while checking WinRT high-contrast settings.

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

`MINECRAFT_BEDROCK_USE_NATIVE_DOTNET=1` tries native .NET Framework 4.8 before
running the GameCore installer. This is a diagnostic fallback only; it can hang
or fail during the .NET 4.0/4.8 bootstrap under Proton/Wine. Set
`MINECRAFT_BEDROCK_SKIP_DOTNET=1` to disable that opt-in path again without
changing other environment settings.

`MINECRAFT_BEDROCK_DIAGNOSTICS=1` enables verbose Wine debug channels for game
launches. Proton logs are written under
`${XDG_STATE_HOME:-~/.local/state}/minecraft-bedrock/logs`.

## Caveats

This targets the current community GDK-Proton path. Minecraft Bedrock on
Windows has historically depended on Microsoft Store, Gaming Services, Xbox,
and GDK APIs that upstream Wine/Proton do not fully implement. GDK-Proton can
change quickly, Microsoft login support may be incomplete, and Minecraft
updates can break the setup.

The official GameCore installer path is still useful for diagnostics, but it
may exit with a generic installer error before installing the launcher because
Wine/Proton does not provide a real Microsoft Store install session. In that
case, `setup` fails before writing a broken Steam shortcut.

Steam should be restarted after `add-steam-shortcut`. If Steam is running while
the shortcut file is edited, it can overwrite the file on exit.
