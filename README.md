# Voix - A Secure Privilege Management Tool

## Overview

Voix is a secure privilege management tool designed to provide controlled command execution with elevated privileges. Unlike traditional sudo implementations, Voix focuses on security and simplicity.

## Features

- **Controlled Privilege Escalation**: Execute commands with elevated privileges only when explicitly configured
- **Simple Configuration**: Easy-to-understand configuration format
- **PAM Authentication**: Secure authentication using Pluggable Authentication Modules
- **Shell Integration**: Properly executes commands within the user's shell environment

## Installation

### Dependencies

#### Arch Linux
```bash
sudo pacman -S cmake make gcc pkgconf
```

#### Debian/Ubuntu
```bash
sudo apt-get install cmake make gcc pkg-config
```

#### Fedora
```bash
sudo dnf install cmake make gcc pkgconf
```

### Building

1. Clone the repository:
```bash
git clone https://github.com/Veridian-Zenith/Voix.git
cd Voix/src
```

2. Build the project:
```bash
cmake -B build
cmake --build build
```

3. Install the binary:
```bash
sudo install -o root -m 4755 build/voix /usr/local/bin/voix
```

## Configuration

The configuration file is located at `/etc/voix/config.lua`. Here's an example configuration:

```lua
return {
  -- List of users who can run commands with elevated privileges
  users = {
    "root",
    "your_username"
  },

  -- List of groups whose members can run commands with elevated privileges
  groups = {
    "wheel",
    "admin"
  },

  -- Maximum number of authentication attempts
  max_auth_attempts = 3
}
```

## Usage

To run a command with elevated privileges:
```bash
voix <command> [args...]
```

## Security Notes

- Voix runs commands with the current user's privileges by default
- Privilege escalation must be explicitly configured
- The binary must be owned by root with the setuid bit set for proper operation

## License

Voix is licensed under the AGPLv3 license. See the LICENSE file for more details.
