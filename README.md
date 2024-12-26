# AUR RaiderIO Client Daily Build

This repository provides an automated daily build for updating the Arch Linux AUR package `raiderio-client`. It fetches the latest release from the official `RaiderIO/raiderio-client-builds` GitHub repository and updates the package accordingly.

## About

The `raiderio-client` is a tool used by World of Warcraft players to synchronize data from [Raider.IO](https://raider.io), providing real-time Mythic+ and raid progression tracking. This automated build ensures that the latest release of the client is always available on the Arch User Repository (AUR) for Arch Linux users.

[raiderio-client on AUR](https://aur.archlinux.org/packages/raiderio-client)
[raiderio-client on GitHub](https://github.com/Deltachaos/aur-raiderio-client)

## Features

- **Automated daily build**: Automatically fetches the latest release of `raiderio-client-builds` from the official GitHub repository.
- **Updates the AUR package**: Ensures the `raiderio-client` package on the Arch Linux AUR stays up to date with the latest features and bug fixes.
- **Easy installation**: Use `yay` or any AUR helper to install and update the package.

## Installation

To install `raiderio-client` on Arch Linux, use an AUR helper like `yay`:

```bash
yay -S raiderio-client
```

Alternatively, you can manually install the package from the AUR by downloading the PKGBUILD and running:

```bash
git clone https://aur.archlinux.org/raiderio-client.git raiderio-client
cd raiderio-client
makepkg -si
```

## Automatic Updates

This repository automatically checks for the latest release from the [RaiderIO/raiderio-client-builds](https://github.com/RaiderIO/raiderio-client-builds) repository and ensures that the AUR package is up to date. The update process is run daily to keep the package current with the latest features and bug fixes.

## How It Works

1. The repository pulls the latest release from the official raiderio-client-builds GitHub.
2. It updates updated PKGBUILD file to match the latest version and source hash.
3. It builds the image to ensure it is still working.
4. The updated PKGBUILD is pushed to the AUR package raiderio-client.
5. Arch Linux users can install or update the package to the latest version via the AUR.

## Contributing

Contributions are welcome! If you find any issues or have ideas for improvements, feel free to create an issue or submit a pull request.

## License

The build job is licensed under the MIT License. The [Raider.IO](https://raider.io) Software itself is distributed with its own license and this project is not associated with Raider.IO in any way.

## Acknowledgments

- [RaiderIO/raiderio-client-builds](https://github.com/RaiderIO/raiderio-client-builds) - Raider.IO Release Repository.
- [Arch Linux AUR](https://aur.archlinux.org/) - The Arch User Repository.
