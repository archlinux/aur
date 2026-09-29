# memoria-bin

Arch Linux x86_64 package for [Memoria](https://github.com/viktordanov/rs-memoria).
This recipe packages the official 0.7.0 Linux binary with its MIT license and Bash, Zsh, and Fish completions.
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

For the 0.6 to 0.7 upgrade, update local, agent, and CI executables together.
Set configuration `version = 3`, regenerate disposable review artifacts, and read the queue before acknowledgement.
Documents cover their folder and descendants until an explicit link or import hands a subfolder to another tracked document.
Keep `memoria.lock`. Its first ordinary write upgrades format 2 to 3 while preserving existing review history.
Legacy coverage remains explicitly unknown where reconstruction cannot prove it, until the document receives a normal review and acknowledgement.
Memoria 0.6 cannot read format 3. Do not downgrade the configuration or replace the lock.
See the [migration guide](https://github.com/viktordanov/rs-memoria/blob/v0.7.0/CHANGELOG.md#migration-to-070).

For updates, verify the upstream asset and checksum, update `pkgver`, and reset `pkgrel` to `1`.
Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`. Rebuild and validate before publication.
The packaging files use 0BSD. Memoria uses the upstream MIT license.
