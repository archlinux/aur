# Expresso-Kit
☕ A TUI + CLI tool for validating git repositories with docker-compose and environment configuration support
> For my Italian friends, I know it's ESpresso, not EXpresso, but the idea is to play around with the name and convey speed and satisfaction (for coffee lovers, of course☕♥️).

[![CI](https://github.com/amindWalker/expresso-kit/actions/workflows/ci-test.yml/badge.svg)](https://github.com/amindWalker/expresso-kit/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## TL;DR

Expresso-Kit employs a comprehensive approach to integrating _Command-Line Interface_ (`CLI`) and _Terminal User Interface_ (`TUI`) functionality.
They share the same features, with the features targeted first for the `CLI` acting as the backend and the source of truth for the `TUI`.

Quick basic usage:

```bash
# Validate current project
expresso-kit validate

# Discover and validate all projects in a directory
expresso-kit discover --validate

# Clone and validate a repo
expresso-kit clone https://github.com/user/repo

# Launch interactive TUI
expresso-kit
```

## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Commands](#commands)
  - [validate](#validate)
  - [discover](#discover)
  - [clone](#clone)
  - [list-services](#list-services)
  - [check-deps](#check-deps)
  - [init-workflow](#init-workflow)
- [TUI Mode](#tui-mode)
- [Output Formats](#output-formats)
- [Configuration](#configuration)
- [GitHub Actions Integration](#github-actions-integration)

## Installation

### From Source (Rust)

```bash
# Clone the repository
git clone https://github.com/amindWalker/expresso-kit.git
cd expresso-kit

# Build and install
cargo install --path crates/expresso-kit
```

### Prerequisites

- Git (required for clone operations)
- Rust 1.91+ (for building from source)

## Quick Start

Expresso-Kit helps you validate project configurations including:

- **Environment files** (`.env`, `.env.sample`, `.env.example`)
- **Docker Compose files** (`docker-compose.yml`, `compose.yml`)
- **Required files** (customizable list)
- **Cross-validation** between env vars and docker-compose references

## Commands

### validate

Validate repository configuration including `.env` files, docker-compose, and required files.

#### Basic Usage

```bash
# Validate current directory
expresso-kit validate

# Validate a specific path
expresso-kit validate --path ./my-project

# Validate with JSON output for CI/CD
expresso-kit validate --format json
```

#### Validation Options

```bash
# Strict mode - fail on any warnings
expresso-kit validate --strict

# Only validate environment files
expresso-kit validate --env-only

# Only validate docker-compose files
expresso-kit validate --compose-only

# Only check required files exist
expresso-kit validate --files-only

# Compare sample files with actual files
expresso-kit validate --compare

# Cross-validate env vars with docker-compose references
expresso-kit validate --cross-validate
```

#### Examples

**Example 1: Basic validation with strict mode**
```bash
$ expresso-kit validate --strict

✓ Repository Validation: ./
─────────────────────────────────────────
Environment:
  ✓ .env.sample exists
  ✓ .env exists
  ✓ All required variables present

Docker Compose:
  ✓ docker-compose.sample.yml exists
  ✓ docker-compose.yml exists
  ✓ 3 services defined

Required Files:
  ✓ .env

Summary: 0 errors, 0 warnings
```

**Example 2: JSON output for CI pipelines**
```bash
$ expresso-kit validate --format json --cross-validate

{
  "path": ".",
  "valid": true,
  "env": {
    "sample_exists": true,
    "env_exists": true,
    "missing_vars": [],
    "empty_vars": []
  },
  "compose": {
    "sample_exists": true,
    "compose_exists": true,
    "services": ["api", "db", "redis"]
  },
  "errors": [],
  "warnings": []
}
```

**Example 3: GitHub Actions annotation format**
```bash
$ expresso-kit validate --format github

::notice file=.env::Environment configuration valid
::notice file=docker-compose.yml::3 services defined: api, db, redis
```

**Example 4: Custom required files**
```bash
$ expresso-kit validate --required-files ".env,docker-compose.yml,README.md"

✓ Required Files Check
  ✓ .env
  ✓ docker-compose.yml
  ✓ README.md
```

### discover

Discover projects with docker-compose or environment files in a directory tree.

#### Basic Usage

```bash
# Discover projects in current directory
expresso-kit discover

# Discover in a specific path with custom depth
expresso-kit discover --path ~/projects --max-depth 5
```

#### Discovery Options

```bash
# Only find projects with docker-compose
expresso-kit discover --compose-only

# Only find projects with .env files
expresso-kit discover --env-only

# Validate all discovered projects
expresso-kit discover --validate

# Stop on first validation failure
expresso-kit discover --validate --fail-fast

# Strict validation mode
expresso-kit discover --validate --strict
```

#### Examples

**Example 1: Find all projects with docker-compose**
```bash
$ expresso-kit discover --compose-only --max-depth 3

📁 Discovered Projects
─────────────────────────────────────────
Found 4 projects with docker-compose:

  📦 api-gateway
     Path: ./services/api-gateway
     Services: 2
     Has .env sample: ✓

  📦 user-service
     Path: ./services/user-service
     Services: 3
     Has .env sample: ✓

  📦 notification-service
     Path: ./services/notifications
     Services: 1
     Has .env sample: ✗

  📦 frontend
     Path: ./apps/frontend
     Services: 1
     Has .env sample: ✓

Scanned 47 directories
```

**Example 2: Discover and validate all projects**
```bash
$ expresso-kit discover --validate --format json

{
  "root": ".",
  "projects": [
    {
      "name": "api-gateway",
      "path": "./services/api-gateway",
      "valid": true,
      "has_compose": true,
      "service_count": 2
    },
    {
      "name": "notification-service",
      "path": "./services/notifications",
      "valid": false,
      "errors": ["Missing .env file"]
    }
  ],
  "total": 4,
  "valid": 3,
  "invalid": 1
}
```

**Example 3: Find projects needing setup**
```bash
$ expresso-kit discover --env-only

📁 Projects with Environment Configuration
─────────────────────────────────────────
⚠️ Projects needing setup (have sample but no .env):

  📦 user-service
     Has .env.sample: ✓
     Has .env: ✗
     Action: Copy .env.sample to .env

  📦 payment-service
     Has .env.example: ✓
     Has .env: ✗
     Action: Copy .env.example to .env
```

### clone

Clone a git repository and optionally validate its configuration.

#### Basic Usage

```bash
# Clone and validate
expresso-kit clone https://github.com/user/repo

# Clone to specific destination
expresso-kit clone https://github.com/user/repo --dest ./my-folder

# Clone without validation
expresso-kit clone https://github.com/user/repo --no-validate
```

#### Examples

**Example 1: Clone and validate a repository**
```bash
$ expresso-kit clone https://github.com/example/microservice

📡 Cloning repository...
   URL: https://github.com/example/microservice
   Destination: ./microservice

✓ Clone complete

🔍 Validating configuration...
─────────────────────────────────────────
Environment:
  ✓ .env.sample exists
  ⚠ .env missing (copy from .env.sample)

Docker Compose:
  ✓ docker-compose.yml exists
  ✓ 2 services: api, postgres

Required Files:
  ⚠ .env missing

Summary: 0 errors, 2 warnings
```

**Example 2: Clone with JSON output**
```bash
$ expresso-kit clone https://github.com/example/app --format json

{
  "cloned": true,
  "path": "./app",
  "validation": {
    "valid": false,
    "warnings": [".env file missing - copy from .env.sample"]
  }
}
```

**Example 3: Clone to custom destination without validation**
```bash
$ expresso-kit clone https://github.com/example/service --dest ~/projects/my-service --no-validate

📡 Cloning repository...
   URL: https://github.com/example/service
   Destination: /home/user/projects/my-service

✓ Clone complete (validation skipped)
```

### list-services

List docker-compose services with their environment configuration.

#### Basic Usage

```bash
# List services in current directory
expresso-kit list-services

# List services with environment details
expresso-kit list-services --with-env

# Output as JSON
expresso-kit list-services --format json
```

#### Examples

**Example 1: Basic service listing**
```bash
$ expresso-kit list-services

📦 Docker Compose Services
─────────────────────────────────────────
Service: api
  Has environment: ✓
  Has env_file: ✓

Service: postgres
  Has environment: ✓
  Has env_file: ✗

Service: redis
  Has environment: ✗
  Has env_file: ✗

Total: 3 services
```

**Example 2: List with environment variable details**
```bash
$ expresso-kit list-services --with-env

📦 Docker Compose Services
─────────────────────────────────────────
Service: api
  Environment Variables:
    - DATABASE_URL=${DATABASE_URL}
    - REDIS_URL=${REDIS_URL}
    - API_KEY=${API_KEY:-default}
  Env Files:
    - .env

Service: postgres
  Environment Variables:
    - POSTGRES_USER=${DB_USER:-postgres}
    - POSTGRES_PASSWORD=${DB_PASSWORD}
    - POSTGRES_DB=${DB_NAME:-app}

Service: redis
  (No environment configuration)
```

**Example 3: JSON format for scripting**
```bash
$ expresso-kit list-services --format json --with-env

{
  "services": [
    {
      "name": "api",
      "has_environment": true,
      "has_env_file": true,
      "environment": [
        {"key": "DATABASE_URL", "value": "${DATABASE_URL}"},
        {"key": "REDIS_URL", "value": "${REDIS_URL}"}
      ],
      "env_files": [".env"]
    },
    {
      "name": "postgres",
      "has_environment": true,
      "has_env_file": false,
      "environment": [
        {"key": "POSTGRES_USER", "value": "${DB_USER:-postgres}"}
      ]
    }
  ],
  "total": 3
}
```

### check-deps

Check system dependencies required for Expresso-Kit operations.

#### Examples

**Example 1: Basic dependency check**
```bash
$ expresso-kit check-deps

🔍 System Dependencies
─────────────────────────────────────────
  ✓ git (version 2.43.0)
  ✓ docker (version 24.0.7)
  ✓ docker-compose (version 2.23.3)

All dependencies available
```

**Example 2: Strict mode (fail if missing)**
```bash
$ expresso-kit check-deps --strict

🔍 System Dependencies
─────────────────────────────────────────
  ✓ git (version 2.43.0)
  ✗ docker (not found)
  ✗ docker-compose (not found)

Error: Missing required dependencies
Exit code: 1
```

**Example 3: JSON output**
```bash
$ expresso-kit check-deps --format json

{
  "dependencies": {
    "git": {"available": true, "version": "2.43.0"},
    "docker": {"available": true, "version": "24.0.7"},
    "docker-compose": {"available": true, "version": "2.23.3"}
  },
  "all_available": true
}
```

### init-workflow

Generate a GitHub Actions workflow for your project with auto-detection of project types.

#### Basic Usage

```bash
# Generate workflow with auto-detection
expresso-kit init-workflow --auto-detect

# Generate workflow for specific paths
expresso-kit init-workflow --paths "./api,./web"

# Preview without writing file
expresso-kit init-workflow --dry-run
```

#### Examples

**Example 1: Auto-detect and generate workflow**
```bash
$ expresso-kit init-workflow --auto-detect

🔍 Detecting project type...
   Detected: Rust, Docker Compose, .env config

📝 Generating workflow...
   Output: .github/workflows/project-ci.yml

✓ Workflow generated successfully!

Generated jobs:
  - rust: Build & test with stable/beta toolchains
  - docker-compose: Validate and test compose services
  - validate: Check .env and docker-compose configuration
```

**Example 2: Dry run to preview workflow**
```bash
$ expresso-kit init-workflow --auto-detect --dry-run

# Generated by expresso-kit
# Project: my-api
# Detected: Rust, Docker

name: my-api CI

on:
  push:
    branches: [main, master, dev, develop]
  pull_request:
    branches: [main, master]
  workflow_dispatch:

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  rust:
    name: Rust Build & Test
    runs-on: ubuntu-latest
    ...
```

**Example 3: Custom paths and compose validation**
```bash
$ expresso-kit init-workflow --paths "./services/api,./services/web" --compose --output ci.yml

📝 Generating workflow...
   Validation paths: ./services/api, ./services/web
   Include compose validation: ✓
   Output: .github/workflows/ci.yml

✓ Workflow generated successfully!
```

## TUI Mode

Launch the interactive Terminal User Interface by running `expresso-kit` without any subcommand:

```bash
expresso-kit
```

Or explicitly:

```bash
expresso-kit --tui
```

### TUI Features

The TUI provides a dashboard with four tabs:

| Tab | Description |
|-----|-------------|
| **Repositories** | View and manage tracked repositories with status indicators |
| **Environment** | Inspect environment variables and validation status |
| **Workflows** | Generate and manage GitHub Actions workflows |
| **Logs** | View operation history and debug information |

### TUI Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `Tab` / `Shift+Tab` | Navigate between tabs |
| `↑` / `↓` | Navigate list items |
| `Enter` | Select/expand item |
| `Space` | Toggle selection |
| `a` | Add new repository |
| `d` | Delete selected |
| `r` | Refresh/re-validate |
| `c` | Clone selected |
| `v` | Validate selected |
| `w` | Open workflow generator |
| `s` | Save configuration |
| `?` | Show help |
| `q` / `Esc` | Quit |

### TUI Status Icons

| Icon | Meaning |
|------|---------|
| 🟢 | Ready - all validations passed |
| 📡 | Cloning in progress |
| 🔍 | Validating |
| ⚠️ | Warning - has non-critical issues |
| ❗ | Error - has critical issues |
| `-` | Pending - not yet processed |

## Output Formats

Expresso-Kit supports three output formats for all commands:

### Text (Default)

Human-readable output with colors and symbols.

```bash
expresso-kit validate --format text
```

### JSON

Structured JSON for parsing and integration with other tools.

```bash
expresso-kit validate --format json | jq '.errors'
```

### GitHub Actions

GitHub Actions annotation format for CI/CD integration.

```bash
expresso-kit validate --format github
```

Produces annotations like:
```
::error file=.env,line=1::Missing required variable: DATABASE_URL
::warning file=docker-compose.yml::Service 'api' references undefined env var: API_SECRET
::notice file=.env.sample::Sample file found with 12 variables
```

## Configuration

Expresso-Kit can be configured via `.expresso-kit.toml` in your project root:

```toml
version = "0.1.0"

[clone_settings]
dir_name = "projects"
base_path = "."

[[repositories]]
name = "my-api"
url = "https://github.com/user/my-api"
path = "./projects/my-api"
selected = true
required_files = [".env", "docker-compose.yml"]

[[repositories]]
name = "my-web"
url = "https://github.com/user/my-web"
path = "./projects/my-web"
selected = false
required_files = [".env"]

[required_files]
default = [".env"]
```

## GitHub Actions Integration

### Basic Validation Workflow

```yaml
name: Validate Configuration

on: [push, pull_request]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install Expresso-Kit
        run: cargo install expresso-kit

      - name: Validate
        run: expresso-kit validate --format github --strict
```

### Multi-Project Discovery Workflow

```yaml
name: Validate All Projects

on: [push, pull_request]

jobs:
  discover-and-validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install Expresso-Kit
        run: cargo install expresso-kit

      - name: Discover and Validate
        run: |
          expresso-kit discover --validate --format github --fail-fast
```

### Matrix Build with Validation

```yaml
name: CI

on: [push, pull_request]

jobs:
  validate:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        arch: [ubuntu-latest, ubuntu-24.04-arm]
    steps:
      - uses: actions/checkout@v4

      - name: Install Rust
        uses: dtolnay/rust-toolchain@stable

      - name: Install Expresso-Kit
        run: cargo install expresso-kit

      - name: Validate Configuration
        run: expresso-kit validate --format github
```

## File Pattern Recognition

Expresso-Kit automatically recognizes various file patterns:

### Docker Compose Files
- `docker-compose.yml` / `docker-compose.yaml`
- `compose.yml` / `compose.yaml`
- `docker-compose.sample.yml`
- `docker-compose.example.yml`

### Environment Files
- `.env`
- `.env.sample`
- `.env.example`
- `env.sample`
- `env.example`

### Project Type Detection
- **Rust**: `Cargo.toml`
- **Node.js**: `package.json`
- **Python**: `pyproject.toml`, `requirements.txt`, `setup.py`
- **Go**: `go.mod`
- **Docker**: `Dockerfile`

## Exit Codes

| Code | Meaning |
|------|---------|
| `0` | Success - no errors |
| `1` | Validation errors found (or warnings in `--strict` mode) |
| `2` | Command-line argument error |
| `3` | File system error |
| `4` | Git operation error |

## License

MIT License - see [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

<p align="center">
  Made with ☕ and 🦀 by <a href="https://github.com/amindWalker">amindWalker</a>
</p>