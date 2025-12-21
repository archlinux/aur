# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.2] - 2025-12-21

### Added

- Add host import command for ShareX sxcu files
- Add argument to throttle uploads when bulk uploading to a host

### Changed

- Deletion URL json path defaults to NULL during configuration

### Fixed

- Generate version header for version command
- Add debug logging to upload process
- Increase buffer for API token string to account for null terminator

## [1.2.1] - 2025-12-20

### Added

- Batch upload support for multiple files and directories
- Interactive TUI configuration editor using ncurses
- Version header auto-generated from CMake at build time

### Changed

- Default deletion URL JSON path is now blank when adding hosts
- Improved prompt text for deletion URL configuration

### Fixed

- TUI crash when entering host editor from config menu
- Build output redirection in bump.sh for proper tarball creation
- Pedantic compiler warnings

## [1.2.0] - 2025-12-08

### Added

- `--json` flag for machine-readable output
- `--verbose` and `--quiet` flags for output control
- `--no-color` flag and `NO_COLOR` environment variable support

### Fixed

- Command injection vulnerability in clipboard operations
- Command injection in log directory creation
- Use-after-free in config_save
- Memory leaks in main init and network upload paths
- NULL checks for strdup calls in config parsing

### Changed

- Enable stricter compiler warnings

## [1.1.5] - 2025-11-05

### Fixed

- Replace fixed-size buffers with dynamic allocation
- Improve input validation with null checks and length limits
- Add bounds checking to string operations

## [1.1.4] - 2025-04-30

### Fixed

- Deletion URL now saved properly in config
- Config set command functionality restored
- Support for hosts without authentication

## [1.1.3] - 2025-04-26

### Changed

- Major source code refactoring (no API changes)

## [1.1.2] - 2025-04-26

### Fixed

- Random upload failures
- Unnecessary logging removed

### Changed

- Network code refactored for better performance

## [1.1.1] - 2025-04-23

### Fixed

- Display upload IDs in list-uploads command
- Consistent output formatting

## [1.1.0] - 2025-04-23

### Added

- Deletion URL support for removing uploaded files
- `delete-file` command to delete files from remote hosts
- `delete-upload` command to remove records from local history
- Visual indicators for files with deletion URLs in upload history

### Fixed

- Network operation error handling

## [1.0.0] - 2025-04-22

### Added

- Initial release
