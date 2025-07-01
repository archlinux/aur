# 🍅 Pom - CLI Pomodoro Timer

A feature-rich command-line Pomodoro timer written in Go, helping you stay focused and productive with beautiful visuals, comprehensive tracking, and motivational feedback.

![Pom Timer Demo](docs/images/demo.gif)

## 🎯 Project Overview

This project showcases intermediate-level Go programming concepts including:
- Concurrent programming with goroutines and channels
- Cross-platform system integration
- Advanced state management
- Real-time user interaction
- Data persistence and configuration management
- Comprehensive error handling
- Modular project architecture

## ✨ Features

### Core Features
- 🎯 Beautiful progress bar with real-time countdown
- 🎨 Multiple color themes (default, minimal, vibrant)
- 📊 Comprehensive session tracking and statistics
- 🎯 Daily goals with streak tracking
- 📝 Task planning and time tracking
- 🔔 Cross-platform notifications and sounds
- ⏯️ Pause/resume/quit functionality
- 💪 Motivational messages and feedback
- 📦 Multiple package formats for easy installation

### Advanced Features
- 🌈 Theme system with customizable colors
- 📈 Detailed statistics with daily and all-time metrics
- 🎯 Goal tracking with streaks and progress
- 📝 Task management with time tracking
- 🔄 Session recovery and state persistence
- 🎛️ Configurable work/break durations
- 🔔 OS-specific notification systems
- ⚡ Graceful interruption handling

## 🚀 Quick Start

1. Install Pom using your package manager (see [Installation](#-installation))
2. Start a basic Pomodoro session:
   ```bash
   pom start
   ```
3. Or customize your session:
   ```bash
   pom start -w 25 -b 5 -s 4  # 25min work, 5min break, 4 sessions
   ```

## 📖 Usage Guide

### Basic Commands
```bash
# Start a Pomodoro session
pom start                     # Default: 25min work, 5min break, 1 session
pom start -w 30 -b 10 -s 2   # Custom durations
pom start -c                  # Save settings as default

# View statistics
pom stats                     # Show detailed session statistics

# Manage themes
pom theme list               # List available themes
pom theme set vibrant        # Set active theme

# Set daily goals
pom goals set 8 240         # Target: 8 sessions, 240 minutes per day
pom goals show              # Show current progress

# Plan tasks
pom plan add "Project X"    # Add a new task
pom plan list              # List active tasks
pom start -t task-id       # Link session to a task
```

### Interactive Controls
During a session:
- `p` - Pause the timer
- `r` - Resume the timer
- `q` - Quit the session (progress is saved)

### Theme System
Choose from three built-in themes:
- `default` - Professional and clean
- `minimal` - Distraction-free experience
- `vibrant` - Colorful and energetic style

### Statistics and Tracking
View comprehensive statistics:
- Daily progress and goal completion
- All-time session totals
- Focus time and session averages
- Current and longest streaks
- Task-specific time tracking

## 🎨 Screenshots

### Timer with Progress Bar
![Timer Progress](docs/images/timer.png)

### Theme Examples
![Theme Examples](docs/images/themes.png)

### Statistics View
![Statistics](docs/images/stats.png)

## 🔧 Technical Architecture

### Project Structure
```
CLI Pomodoro Timer/
├── cmd/
│   ├── goals.go    # Daily goals management
│   ├── plan.go     # Task planning system
│   ├── pom.go      # Core timer and display
│   ├── root.go     # Base command setup
│   ├── start.go    # Session initialization
│   ├── stats.go    # Statistics and analysis
│   └── theme.go    # Theme management
├── config/
│   ├── config.go   # Base configuration
│   ├── goals.go    # Goals persistence
│   ├── tasks.go    # Task management
│   └── themes.go   # Theme definitions
├── logs/
│   ├── history.go  # Session history
│   ├── notifications.go # System notifications
│   └── session.go  # Session logging
└── [rest of the existing structure]
```

### Key Components
1. **Timer Core** (`cmd/pom.go`):
   - Concurrent timer management
   - State machine implementation
   - OS-specific notifications
   - Real-time user input handling

2. **Configuration** (`config/config.go`):
   - JSON serialization/deserialization
   - File system operations
   - Default configuration management

3. **Session Logging** (`logs/history.go`):
   - Structured logging
   - Statistical calculations
   - Time-series data management

## 🚀 Installation

### Package Managers
<!--
#### Debian/Ubuntu (apt)
```bash
# Add the repository
curl -s --compressed "https://Flack74.github.io/pom/KEY.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/pom.gpg >/dev/null
sudo curl -s --compressed -o /etc/apt/sources.list.d/pom.list "https://Flack74.github.io/pom/pom.list"
sudo apt update
sudo apt install pom
```

#### Fedora/RHEL (rpm)
```bash
# Using dnf
sudo dnf install pom
```
-->
#### Arch Linux (pacman/AUR)
```bash
# Using yay (recommended)
yay -S pom

# Or manually from AUR
git clone https://aur.archlinux.org/pom.git
cd pom
makepkg -si
```
<!--
#### Alpine Linux
```bash
# Using apk
sudo apk add pom
```

### Universal Package Formats

#### Snap
```bash
sudo snap install pom
```

#### Flatpak
```bash
flatpak install flathub com.github.Flack74.pom
```

### macOS

#### Homebrew
```bash
brew tap Flack74/pom
brew install pom
```

### Windows

#### Scoop
```powershell
scoop bucket add pom https://github.com/Flack74/scoop-pom.git
scoop install pom
```
-->
## 🛠️ Building from Source

### Prerequisites

- Go 1.24 or higher
- For package building:
  - DEB: `build-essential`, `debhelper`, `devscripts`
  - RPM: `rpm-build`
  - Snap: `snapcraft`
  - Flatpak: `flatpak-builder`
  - AUR: `base-devel`
  - Man pages: `gzip`

### Building

1. Clone the repository:
   ```bash
   git clone https://github.com/Flack74/pom.git
   cd pom
   ```

2. Install dependencies:
   ```bash
   make dev-deps
   ```

3. Build the application:
   ```bash
   make
   ```

4. Install (optional):
   ```bash
   sudo make install
   ```

### Development Commands

```bash
# Build the application
make

# Install to system
sudo make install

# Run tests
make test

# Run linter
make lint

# Clean build artifacts
make clean

# Build all package formats
make package

# Show all available commands
make help
```

## 🔧 Configuration

Configuration files are stored in `~/.config/pom/`:
- `config.json` - General settings
- `theme.json` - Active theme
- `goals.json` - Daily goals
- `tasks.json` - Task list
- `logs/sessions.json` - Session history

## 📄 License

MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🐛 Bug Reports

Please report any issues on the [GitHub Issues](https://github.com/Flack74/pom/issues) page.

## 🙏 Acknowledgments

- The Pomodoro Technique® is a registered trademark of Francesco Cirillo
- Thanks to all contributors who have helped shape this project

## 📚 Technical Documentation

For detailed technical documentation about the concurrent programming patterns, state management, and system integration used in this project, please refer to the source code comments and the [Wiki](https://github.com/yourusername/pom/wiki) (if available). 

## 📖 Documentation

### Command Line Help

Basic help is available through the command line:
```bash
pom --help
```
<!--
### Man Page

Detailed documentation is available through the man page:
```bash
man pom
```

The man page includes:
- Complete command reference
- All available options and flags
- Interactive controls during sessions
- Configuration details
- Usage examples
- Troubleshooting tips
-->
---
**Built with ❤️ by Flack**