# Voix - A Modern Privilege Escalation Tool

## Overview

Voix is a modern privilege escalation tool designed to replace traditional tools like `sudo` and `doas`. It provides a secure way to execute commands with elevated privileges while maintaining a clean and user-friendly interface. Voix uses PAM for authentication, creating and using /etc/pam.d/voix for PAM authentication, making it a robust alternative to existing privilege escalation tools. (Upload to AUR planned)

**Note**: Command Aliases in your shell will not work with Voix, this is unknown, feel free to open an issue if you know how to fix this.
## Features

### Current Implementation

1. **CLI Tool**:
   - Secure password prompt with hidden input
   - Configurable user and group permissions
   - Logging of authentication attempts
   - PAM integration for authentication

2. **PAM Helper**:
   - Authentication backend
   - Integration with system authentication

3. **Build System**:
   - CMake-based build configuration
   - Multi-shell compatible build script (fish, bash, zsh)
   - Dependency management

### Work in Progress

1. **Security Enhancements**:
   - More granular permission controls
   - Enhanced logging capabilities
   - Additional authentication methods

2. **Documentation**:
   - Complete API documentation
   - Usage examples and tutorials
   - Configuration guide

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
git clone https://github.com/yourusername/voix.git
cd voix
```

2. Build the project:
```bash
cd src
cmake -B build
cmake --build build
```

## Usage

### CLI Tool
```bash
voix <command> [args...]
```


## Configuration

The main configuration file is located at `/etc/voix/config.lua`.

Example configuration:
```lua
return {
  users = {
    "root",
    "yourusername"
  },
  groups = {
    "wheel",
    "admin"
  },
  max_auth_attempts = 3,
  log_file = "/var/log/voix.log"
}
```

## Project Structure

```
.
├── .gitignore
├── PKGBUILD
├── README.md
├── src/
│   ├── .gitignore
│   ├── build.fish
│   ├── CMakeLists.txt
│   ├── config.cpp
│   ├── LICENSE
│   ├── LICENSE-AGPLv3
│   ├── LICENSE-VCL1.0
│   ├── main.cpp
│   ├── utils.cpp
│   ├── include/
│   │   ├── config.hpp
│   │   └── utils.hpp
│   └── lua/
│       └── config.lua
```

## Missing Parts and Future Work

1. **Enhanced Security Features**:
   - Time-based access controls
   - Command-specific permissions
   - Audit logging

2. **Additional Backend Support**:
   - Additional authentication methods

3. **Documentation**:
   - More detailed usage examples
   - Troubleshooting guide

4. **Testing**:
   - Comprehensive test suite
   - CI/CD pipeline integration

## Contributing

We welcome contributions to Voix! Please follow these steps:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to your branch
5. Open a pull request

## License

Voix is dual-licensed under the AGPLv3 and VCL 1.0 licenses. See the src/LICENSE file for more details.
(IMPORTANT - The VCL 1.0 license is for commercial use, while the AGPLv3 license is for all other uses. Please use the appropriate license for your use case.)
