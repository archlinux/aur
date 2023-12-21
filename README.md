
# Dashlane CLI Git AUR package

This project provides a command-line interface (CLI) for Dashlane, built with the local Node.js version installed. It is the GitHub version of the Dashlane CLI.

## Getting Started

These instructions will get you a copy of the package up and running on your local machine for development and testing purposes.

### Prerequisites

All tools required are installed on package installation.

### Installation

Install the package using the `just` command:

```zsh
just install
```

## Usage

You can use the `just _<task-name>_` command to perform various tasks:

- `just build`: Build the package.
- `just rebuild`: Rebuild the package.
- `just install`: Install the package.
- `just uninstall`: Uninstall the package.
- `just test`: Test the package installation.
- `just publish`: Publish the package.
- `just push:` Push to the AUR remote.
- `just dcli-bundle-version`: Check the version of the Dashlane CLI bundle.
- `just dcli-bundle-sync`: Sync the Dashlane CLI bundle.
- `just test-local`: Test the local build.
- `just test`: Test the package installation.
- `just clean`: Clean the Git repository.
- `just clean-force`: Force clean the Git repository.
- `just set-remote-master-to-aur-branch`: Set the remote master branch to the AUR branch.
- `just remote-add-aur`: Add the AUR remote.
- `just clone-empty-aur`: Clone the empty AUR repository.


Use only the `just` command to see the list of available tasks:

```zsh
just
```

## Contributing

Contributions are welcome.

## Versioning

The versions are mirrored from the [Dashlane CLI repository](https://github.com/Dashlane/dashlane-cli.git)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

[Dashlane CLI repository](https://github.com/Dashlane/dashlane-cli.git) provides its own license.
