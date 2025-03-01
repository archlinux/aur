# BONK

![GitHub License](https://img.shields.io/github/license/KingJorjai/BONK)
![Go Version](https://img.shields.io/badge/go-1.23.6-blue) ![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/KingJorjai/BONK/go.yml)


A mighty command-line tool for bonking your friends, enemies, or inanimate objects! Keep track of exactly how many times you've bonked anything with persistent cloud-based bonking statistics.

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
```

## Features

- 🔨 **Bonk** anybody or anything with the power of command-line tools!
- 🔢 **Track** bonking statistics persistently in the cloud
- 🖼️ **Display** delightful ASCII art with each successful BONK
- 🌐 **Cloud-based** bonking memory powered by *counterapi.dev*
- 💨 **Fast** and efficient bonking, written in Go

## Installation

You need Go 1.18 or higher installed on your system.

```bash
# Clone the repository
git clone https://github.com/KingJorjai/BONK.git
cd BONK

# Install the project
go install
```

## Usage

Bonking is as simple as pointing and... well, bonking!

```bash
# Basic usage
BONK <name>

# Examples
BONK keyboard
BONK mondayMornings
BONK bugs
```

### Example Output

```
⠀⠀⠀⠀⠀⠀⢀⣁⣤⣶⣶⡒⠒⠲⠾⣭⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
...ASCII art...

You gave bugs a mighty BONK!
bugs has been bonked 42 times! BONK BONK!
```

## Rules of Bonking

1. Names must be 1-100 characters long
2. Only alphanumeric characters are allowed
3. No spaces or special characters (we're strict bonkers here!)
4. You can't bonk the void (empty names are not allowed)

## Advanced Bonking Techniques

For true bonking connoisseurs, try these pro moves:

```bash
# Bonk scheduled tasks
0 9 * * * BONK mondayMornings

# Count how many times you've bonked something
BONK coffee > /dev/null && echo "I need more coffee!"

# Multi-bonking with a for loop
for i in {1..5}; do BONK keyboard; done
```

## Troubleshooting

**Q: My BONK was denied!**  
A: Make sure you're using only letters and numbers, no spaces or special characters.

**Q: The API isn't responding!**  
A: The bonking servers might be overloaded with bonk requests. Please try again later.

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

### Feature Ideas

- Multi-bonking capabilities
- Bonk statistics dashboard
- Custom BONK ASCII art
- Bonk scheduling and reminders
- Competitive BONK leaderboards

Remember: with great BONK comes great responsibility!

## License

This software is released under the "Bonk As You Please" license (also known as MIT).
