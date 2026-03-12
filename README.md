# Voix - A Secure Privilege Management Tool

## Overview

Voix is a secure, modern, and easy-to-use privilege escalation tool designed to replace traditional solutions like `sudo` and `doas`. It provides a flexible, rule-based system for granting permissions and uses the Pluggable Authentication Modules (PAM) framework for authentication.

**Built from scratch but inspired by OpenDoas**, Voix provides a secure alternative to sudo with PAM authentication support built-in.

## Features

- **Controlled Privilege Escalation**: Execute commands with elevated privileges only when explicitly configured.
- **PAM Authentication**: Secure authentication using Pluggable Authentication Modules.
- **Simple, Intuitive Configuration**: Uses a clear, easy-to-understand syntax in `voix.conf`.
- **Shell Integration**: Properly executes commands within the user's shell environment.
- **Security First**: Designed with security as a top priority.
- **Timestamp Support**: Optional persist authentication (similar to sudo).

## Installation

### Arch Linux (AUR)

For Arch Linux users, Voix is available in the Arch User Repository (AUR). You can install it using your favorite AUR helper (e.g., `yay`, `paru`):

```bash
yay -S voix
```

Alternatively, you can build and install it manually:

```bash
git clone https://aur.archlinux.org/voix.git
cd voix
makepkg -si
```

### From Source

This is the recommended method for all other Linux distributions.

#### Prerequisites

To build Voix, you will need the following dependencies:

- A C++20 compliant compiler (e.g. Clang 21+)
- CMake (version 3.18 or higher)
- Ninja (recommended) or Make
- PAM development libraries (e.g., `libpam-dev` on Debian/Ubuntu, `pam-devel` on Fedora/CentOS)
- `pkg-config`

#### Build Steps

1. **Clone the repository:**

    ```bash
    git clone https://github.com/Veridian-Zenith/Voix.git
    cd Voix
    ```

2. **Configure the project with CMake:** This will generate the build files in a `build` directory.

    ```bash
    cmake -B build
    ```

3. **Build the project:** This will compile the source code and create the `voix` executable.

    ```bash
    cmake --build build
    ```

#### Final Steps

To install Voix on your system, run the following command. This will copy the binary, configuration files, and documentation to their appropriate locations and set the necessary permissions.

```bash
sudo cmake --install build
```

## Configuration

Voix is configured via a simple configuration file at `/etc/voix.conf`.

### Main Configuration (`/etc/voix.conf`)

The syntax is as follows:
`(permit|deny) [nopass] <ident> [as <target>] [cmd <command> [args ...]]`

**Example:**

```conf
# Allow members of the wheel group to run any command
permit :wheel

# Allow user "admin" to run /usr/bin/systemctl as root without a password
permit nopass admin as root cmd /usr/bin/systemctl

# Deny user "guest" from running any commands
deny guest
```

### PAM Configuration (`/etc/pam.d/voix`)

Voix uses PAM for authentication. The default configuration is usually sufficient, but can be modified for advanced use cases like LDAP or multi-factor authentication.

**Default PAM configuration:**

```text
#%PAM-1.0
auth       include    system-auth
account    include    system-auth
session    include    system-auth
```

## Usage

To run a command with elevated privileges:

```bash
voix <command> [args...]
```

### Command Line Options

- `-u USER, --user USER`: Execute command as specified user (default: root).
- `-n, --non-interactive`: Fail if a password is required, rather than prompting.
- `-C, --clear`: Clear any persisted authentications for the current user.

## For Developers

### Static Analysis with clang-tidy

We use `clang-tidy` to ensure a high level of code quality. To run the static analysis checks, you will first need to generate a compile commands database.

1. **Configure CMake to generate compile commands:**

    ```shell
    cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    ```

2. **Run clang-tidy:**

    ```fish
    clang-tidy -p build src/*.cpp --checks='-*,bugprone-*,performance-*,readability-identifier-naming'
    ```

## License

Voix is licensed under the Open Software License v3.0. See the LICENSE file for full details.

## Contributing

We welcome contributions! Please fork the repository, create a feature branch, make your changes, and submit a pull request.
