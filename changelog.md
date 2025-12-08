# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2025-12-08

### Added

- Add `--json` flag for machine-readable output
- Add `--verbose` and `--quiet` flags for output control
- Add `--no-color` flag and respect `NO_COLOR` environment variable

### Fixed

- Fix command injection vulnerability in clipboard copy by using popen
- Fix command injection in log directory creation with mkdir_recursive
- Fix use-after-free in config_save where path was freed before chmod
- Fix memory leaks on init failure in main
- Fix memory leak in network upload on success path
- Add NULL checks for strdup calls in config parsing
- Enable stricter compiler warnings (-Wall -Wextra -Wpedantic -Werror=return-type)

## [1.1.5] - 2025-11-05

### Fixed

- Replace fix-sized buffers with dynamic allocation
- Better input validation with null checks and length limits
- Add bounds checking to string operations
- Use safe string functions where applicable

## [1.1.4] - 2025-04-30

### Fixed

- Deletion URL is now saved properly in the config
- Config set command works now (idk when it broke)
- You can now use hosts without authentication

## [1.1.3] - 2025-04-26

### Fixed

- Refactored the entire source code
- No breaking changes to the API

## [1.1.2] - 2025-04-26

### Fixed

- Fixed a bug where uploads fail randomly
- Removed some unnecessary logging
- Refactored network code to increase performance
- Remove an unused install script

## [1.1.1] - 2025-04-23

### Fixed

- Now displays upload IDs in the list-uploads command
- Formatting is more consistent
- Bump for the AUR

## [1.1.0] - 2025-04-23

### Added

- Support for deletion URLs provided by hosts to remove uploaded files
- New `delete-file` command to delete files from remote hosts using deletion URLs
- New `delete-upload` command to remove upload records from local history
- Visual indicators in the upload history for files with deletion URLs
- Improved error handling for network operations

## [1.0.0] - 2025-04-22

### Added

- Initial release of Hostman.
- Core functionality for uploading files via command-line.
- Support for multiple configurable hosting services using JSON configuration.
- Management commands for hosts (`add-host`, `remove-host`, `list-hosts`, `set-default-host`).
- Upload history tracking using SQLite (`list-uploads`).
- Secure API key storage with encryption (AES-256-GCM).
- Basic configuration management (`config get`, `config set`).
- Visual progress bar during uploads (requires ncurses).
- Detailed logging to a configurable file.
- Support for different authentication types (e.g., bearer token).
- Support for multipart form data uploads.
- Ability to specify static form fields in host configuration.
- JSON path parsing for extracting the uploaded URL from the host response.
- Build system using CMake.
- Basic command-line interface parsing.

````
