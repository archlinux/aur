# memoria-bin

Arch Linux x86_64 package for [Memoria](https://github.com/viktordanov/rs-memoria).
This recipe packages the official 0.3.0 Linux binary with its MIT license and Bash, Zsh, and Fish completions.
Runtime dependencies are `glibc>=2.39`, `libgcc`, and `git`. No Rust compiler is required.

AUR package: https://aur.archlinux.org/packages/memoria-bin

On an updated Arch Linux system with `base-devel` and `git` available:

```sh
git clone https://aur.archlinux.org/memoria-bin.git
cd memoria-bin
less PKGBUILD
makepkg --verifysource
makepkg -si
memoria --version
memoria --help
```

Run makepkg as a regular user. The install step can request administrator authorization.
Bash completion discovery uses `bash-completion`. Zsh uses `compinit`. Fish loads vendor completions automatically.

Validation passed with real makepkg on Arch Linux x86_64: upstream checksums, package generation, CLI commands, and completion syntax.
A temporary Git project passed initialization, review acknowledgement, freshness validation, and detection of a later input change.
System-wide installation, upgrade, uninstall, and clean-chroot validation were not run.

For updates, verify the upstream asset and checksum, update `pkgver`, and reset `pkgrel` to `1`.
Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`. Rebuild and validate before publication.
The packaging files use 0BSD. Memoria uses the upstream MIT license.
