# codeql-cli-bin

Arch Linux AUR package for the [**GitHub CodeQL CLI Binaries**](https://github.com/github/codeql-cli-binaries).

This package installs the pre-compiled binaries for CodeQL, the analysis engine used by developers worldwide to automate security checks and by security researchers to perform variant analysis.

## Installation

If you are using an AUR helper like `yay`:

```bash
yay -S codeql-cli-bin
```

Alternatively, you can install it manually:

```bash
git clone [https://aur.archlinux.org/codeql-cli-bin.git](https://aur.archlinux.org/codeql-cli-bin.git)
cd codeql-cli-bin
makepkg -si
```

Or with your prefered AUR helper.

## Usage

Once installed, you can verify the installation by running:

```bash
codeql --version

```

## Issues & Contributions

Since this is a `-bin` package, issues are generally limited to the **packaging process** (e.g., broken symlinks, checksum mismatches).

* If CodeQL itself is crashing, please report it to the [official CodeQL repository](https://github.com/github/codeql-cli-binaries).
* If the Arch package is broken or out of date, please **open an issue here** on GitHub.

## License

This AUR package is maintained by **skdishansachin**. The underlying CodeQL software is subject to the [GitHub CodeQL Terms and Conditions](https://github.com/github/codeql-cli-binaries/blob/main/LICENSE.md).

