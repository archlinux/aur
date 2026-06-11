# hipfire-git (AUR)

This is the unofficial Arch Linux AUR package for [hipfire](https://github.com/Kaden-Schutt/hipfire), a high-performance AMD GPU inference runtime framework.

## Installation
You can install this package using any AUR helper (e.g., `yay`, `paru`):

yay -S hipfire-git

## Configuration
Upon first execution, `hipfire` creates a local directory at `~/.hipfire` to store auto-detected hardware configurations and downloaded models. See `README.AUR` (installed with the package at `/usr/share/doc/hipfire-git/README.AUR`) for detailed information on how to manage these assets.

## Reporting Issues
- For **packaging-related issues** (build failures, dependency errors, or wrapper logic bugs), please open an issue in this repository.
- For **upstream hipfire bugs** (inference issues, performance, or ROCm-related problems), please report them directly to the [official hipfire issue tracker](https://github.com/Kaden-Schutt/hipfire/issues).

## License
The packaging scripts in this repository are licensed under the [0BSD License](https://opensource.org/licenses/0BSD). The upstream `hipfire` software is dual-licensed under MIT and Apache-2.0.
