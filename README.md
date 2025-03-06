![GitHub Repo stars](https://img.shields.io/github/stars/KingJorjai/BONK?style=for-the-badge)
![GitHub contributors](https://img.shields.io/github/contributors/KingJorjai/BONK?style=for-the-badge)
![GitHub License](https://img.shields.io/github/license/KingJorjai/BONK?style=for-the-badge)

![GitHub Issues or Pull Requests](https://img.shields.io/github/issues/KingJorjai/BONK?style=for-the-badge)
![GitHub Issues or Pull Requests](https://img.shields.io/github/issues-pr/KingJorjai/BONK?style=for-the-badge)

# BONK

A mighty command-line tool for bonking your friends, enemies, or inanimate objects! Keep track of exactly how many times you've bonked anything with persistent cloud-based bonking statistics.

![BonkingGif](img/demo-bonk.gif)

## Features

- 🔨 **BONK** anybody or anything with the power of  your command-line!
- 🖼️ **Display** delightful ASCII art with each successful BONK.
- 🌐 **Online** bonking records powered by [BONK-api](https://github.com/KingJorjai/BONK-api/) to spread your bonks around the globe.
- 💨 **Blazingly Fast** and efficient bonking, written in Go.

## Installation

### Method 1: Using a package manager

#### Snap Store
![Snapcraft Version](https://img.shields.io/snapcraft/v/bonk/latest/stable)
![Snapcraft Last Update](https://img.shields.io/snapcraft/last-update/bonk/latest/stable)
![Snapcraft License](https://img.shields.io/snapcraft/l/bonk)

```bash
snap install bonk 
```

#### AUR (Arch User Repository)

![AUR Votes](https://img.shields.io/aur/votes/bonk)
![AUR Version](https://img.shields.io/aur/version/bonk)
![AUR Last Modified](https://img.shields.io/aur/last-modified/bonk)
![AUR Maintainer](https://img.shields.io/aur/maintainer/bonk)
![AUR License](https://img.shields.io/aur/license/bonk)

```bash
# https://aur.archlinux.org/packages/bonk
yay -S bonk
```

### Method 2: Manually download the binaries
[![GitHub Release](https://img.shields.io/github/v/release/KingJorjai/BONK)](https://github.com/KingJorjai/BONK/releases/latest)
![GitHub Release Date](https://img.shields.io/github/release-date/KingJorjai/BONK)

You can download the latest release binaries from the [**releases page**](https://github.com/KingJorjai/BONK/releases/).

### Method 3: Building from source

> [!IMPORTANT]
> Is required to have a **Go** installation. 

![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/KingJorjai/BONK)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/KingJorjai/BONK/go.yml)

```bash
# Clone the repository
git clone https://github.com/KingJorjai/BONK.git
cd BONK

# Install the project
go install
```

## Usage

### BONK BONK Give a mighty BONK

Bonking is as simple as pointing and... well, bonking!

###### Input

```bash
$ BONK "Georgey"
```

###### Output

```
⠀⠀⠀⠀⠀⠀⢀⣁⣤⣶⣶⡒⠒⠲⠾⣭⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣿⡀⣸⠟⠛⠃⠀⣀⣀⠈⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⡠⠂⢠⠏⠀⠉⠀⠀⠀⠰⣿⠟⠀⠙⢧⡀⠀⠀⠀⠀⠀⠀⢀⠀⠀⢀⢀⡀⣼⣧⡾⠃⠀⠀⠀⠀⠀
⢀⠔⠀⣠⠔⠁⠀⠀⠀⠀⠀⠀⠀⠰⢄⡠⣶⢾⣽⡆⠀⠀⠀⠀⠄⢡⡀⢰⣾⣿⡀⠈⠵⠟⠛⠀⠀⠀⠀⠀
⠀⣠⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡟⠋⠉⠀⠀⠀⠀⣰⢦⣼⡷⣼⡏⢯⢉⣡⠖⠋⣩⡇⠀⠀⠀⠀
⣰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⢺⣿⡄⣿⡄⣿⢿⠈⢁⡴⠋⠀⢀⣴⣋⡀⠀⠀⠀⠀
⡇⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠒⢛⣡⣸⡏⢹⡟⠻⠏⢀⡴⠋⠀⣠⣖⠻⠿⠿⣤⡀⠀⠀⠀
⡇⠀⠀⠈⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⠛⢡⡞⠻⠟⠁⢀⡴⠋⢀⣤⣞⣛⣻⡆⠀⠀⠉⢇⠀⠀⠀
⣇⠀⠀⠀⠈⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠇⠀⠠⠏⠀⠀⢀⠴⠋⣀⠴⣿⠛⠛⠁⠈⠁⠀⠀⠀⠈⢧⠀⡄
⠸⡄⠀⠀⠀⠀⡇⠀⠀⢰⠃⠀⠈⣇⠀⠸⣦⡀⠀⠀⢀⡔⠁⣠⠞⠁⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡀⠀
⠀⠙⣄⠀⠀⠀⣿⠀⠀⢸⠒⠒⠒⠻⡀⠀⣷⠬⣉⡶⠋⣠⠞⠁⠀⠀⠀⡇⠀⠀⠀⡀⠀⢠⠀⠀⠀⠘⡇⠀
⠀⠀⠈⠑⠦⠤⣽⣄⠀⢸⠤⠤⠤⠤⢷⡀⠸⣷⠋⣠⢾⡁⠀⠀⠀⠀⠀⡇⢠⠇⠀⢹⠀⢸⠃⠀⠀⣸⠃⠀
⠀⠀⠀⠀⠀⠀⠀⢹⠀⢸⠀⠀⠀⠀⠀⢈⠦⣀⣙⣻⡞⠃⠀⠀⠀⢀⡼⢡⠧⠤⠤⢸⠀⣾⠤⠤⠚⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⡀⠸⡄⠀⠀⠀⠀⣧⠴⠃⠉⠉⠁⠀⠀⠰⣾⡭⠔⠁⠀⠀⠀⡜⠀⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠳⢤⣼⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠄⠀⠀⠀⠀⠀⢰⣥⣴⠃⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠤⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
You gave Georgey a mighty BONK!
Georgey has been bonked 1,563,097 times! BONK BONK!
```

### ONLINE Leaderboard *(a.k.a. LeaderBONK)*

Challenge the rest of the world to see who... has received the most BONKS... ??

###### Input

```bash
# Both commands are equivalent
$ BONK --leaderboard
$ BONK -l
```

###### Output

```
+-----+--------------------------+---------------+
| NO. |           NAME           |     BONKS     |
+-----+--------------------------+---------------+
|   1 |                     John | 15,678        |
|   2 |                    Alice | 9,432         |
|   3 |                      Bob | 7,890         |
|   4 |                    Carol | 5,678         |
|   5 |                     Dave | 4,321         |
|   6 |                      Eve | 3,210         |
|   7 |                    Frank | 2,109         |
|   8 |                    Grace | 1,987         |
|   9 |                    Heidi | 1,234         |
|  10 |                     Ivan | 987           |
+-----+--------------------------+---------------+

```

### Advanced Bonking Techniques

For true bonking connoisseurs, try these pro moves:

```bash
# Bonk scheduled tasks
0 9 * * 1 BONK mondayMornings
```
```bash
# Count how many times you've bonked something
BONK coffee > /dev/null && echo "I need more coffee!"
```
```bash
# Multi-bonking with a for loop
for i in {1..5}; do BONK keyboard; done
```

## Contributing

Pull requests are welcome! Please feel free to BONK this repository with your improvements.

### How to Contribute

1. **Fork** the repository
2. **Clone** your fork locally
3. **Create a branch** for your feature or bugfix (`git checkout -b feature/amazing-bonk`)
4. **Commit** your changes (`git commit -am 'Add some amazing bonking feature'`)
5. **Push** to the branch (`git push origin feature/amazing-bonk`)
6. Create a new **Pull Request**

### Development Setup

```bash
# Get all dependencies
go mod tidy

# Run tests
go test ./...

# Build for development
go build
```

### Contribution Guidelines

- Write clean, readable Go code
- Add tests for new features
- Update documentation when needed
- Follow Go best practices
- Make your BONKs count!

Remember: with great BONK comes great responsibility!

## License

This software is released under the "Bonk As You Please" license (also known as MIT).
