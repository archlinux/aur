# Dashlane CLI GitHub Repository

This repository contains the necessary files to build and maintain the Dashlane CLI package for Arch User Repository (AUR).

## Caution

The rate limit for device registration is 40 calls per day. If you exceed this limit, you will not be able to register a new device for 24 hours. So if you tinker around with this package, you might want to slow it down a bit in case of errors.

## Getting Started

These instructions will get you a copy of the package up and running on your local machine for development and testing purposes.

### Prerequisites

All tools required are installed on package installation.

> Note: Your shell config will be configured if you haven't set up asdf yet.

### Installation

Install the package using the `just` command:

```zsh
just install
```

## Justfile Recipes

The `justfile` contains several recipes for building and maintaining the package. Some of these recipes are private and are prefixed with an underscore `_`.

### Public Recipes

- `default`: Choose a recipe to run.
- `build`: Build the package using `makepkg`.
- `rebuild`: Force rebuild the package using `makepkg -f`.
- `nobuild`: Build the package without cleaning the build directory using `makepkg -o`.
- `prepare`: Prepare the package by running `rebuild`, `_bump-pkgrel`, `_checksum`, and `_srcinfo`.
- `publish`: Publish the new version by running `prepare`, committing, tagging, and pushing to the AUR.

### Private Recipes

- `_delete-src`: Delete the `src` directory.
- `_delete-pkg`: Delete the `pkg` directory.
- `_delete-build-packages`: Delete the built package files.
- `_delete-pkgbase`: Delete the package base directory.
- `_delete-all`: Run `_delete-build-packages`, `_delete-src`, `_delete-pkg`, and `_delete-pkgbase`.
- `_cleanbuild`: Clean build by running `_delete-all` and `makepkg -C`.
- `_commit-count`: Get the commit count from the git repository.
- `_bump-pkgrel`: Bump the package release number based on the commit count.
- `_srcinfo`: Generate the `.SRCINFO` file.
- `_checksum`: Update the checksums in the PKGBUILD.
- `_install`: Install the built package using `pacman`.
- `_uninstall`: Uninstall the package using `pacman`.
- `_src-version`: Get the source version from the git repository.
- `_tag-name`: Generate the tag name based on the source version and commit count.
- `_dcli-bundle-version`: Get the version of the Dashlane CLI bundle.
- `_dcli-bundle-sync`: Sync the Dashlane CLI bundle.
- `_clean`: Show what would be cleaned by `git clean -dX -n`.
- `_clean-force`: Force clean by running `_delete-all` and `git clean -dX -f`.
- `_set-remote-master-to-aur-branch`: Set the remote master branch to the AUR branch.
- `_remote-add-aur`: Add the AUR remote.
- `_clone-empty-aur`: Clone the empty AUR repository.

### Testing

- `test-local`: Run local tests by rebuilding the package and running `_dcli-bundle-version` and `_dcli-bundle-sync`.
- `test`: Run tests by preparing the package, installing it, and then uninstalling it.

## Usage

To use the `justfile`, you need to have `just` installed. You can then run the recipes using the `just` command.

## Contributing

Contributions are welcome.

## Versioning

The versions are mirrored from the [Dashlane CLI repository](https://github.com/Dashlane/dashlane-cli.git)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

[Dashlane CLI repository](https://github.com/Dashlane/dashlane-cli.git) provides its own license.
