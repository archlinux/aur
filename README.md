# nGPT

<p align="center">
  <a href="https://pypi.org/project/ngpt/"><img src="https://img.shields.io/pypi/v/ngpt.svg" alt="PyPI version"></a>
  <a href="https://aur.archlinux.org/packages/ngpt"><img alt="AUR Version" src="https://img.shields.io/aur/version/ngpt"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT"></a>
  <a href="https://nazdridoy.github.io/ngpt/"><img src="https://img.shields.io/badge/docs-available-brightgreen.svg" alt="Documentation"></a>
</p>

<p align="center">
  <a href="https://nazdridoy.github.io/ngpt/installation/"><img src="https://img.shields.io/badge/Linux-support-blue?logo=linux" alt="Linux"></a>
  <a href="https://nazdridoy.github.io/ngpt/installation/"><img src="https://img.shields.io/badge/Windows-support-blue?logo=windows" alt="Windows"></a>
  <a href="https://nazdridoy.github.io/ngpt/installation/"><img src="https://img.shields.io/badge/macOS-support-blue?logo=apple" alt="macOS"></a>
  <a href="https://nazdridoy.github.io/ngpt/installation/"><img src="https://img.shields.io/badge/Android-Termux-blue?logo=android" alt="Android"></a>
</p> 

🤖 nGPT: A Swiss army knife for LLMs: powerful CLI and interactive chatbot in one package. Seamlessly work with OpenAI, Ollama, Groq, Claude, Gemini, or any OpenAI-compatible API to generate code, craft git commits, rewrite text, and execute shell commands. Fast, lightweight, and designed for both casual users and developers.


![2025-04-23_16-18-01](https://github.com/user-attachments/assets/b8e58926-5165-4352-b48b-9f4a982da86e)


## Features

- ✅ **Versatile**: Powerful and easy-to-use CLI tool for various AI tasks
- 🪶 **Lightweight**: Minimal dependencies with everything you need included
- 🔄 **API Flexibility**: Works with OpenAI, Ollama, Groq, Claude, Gemini, and any OpenAI-compatible endpoint
- 💬 **Interactive Chat**: Continuous conversation with memory in modern UI
- 📊 **Streaming Responses**: Real-time output for better user experience
- 🔍 **Web Search**: Enhance any model with contextual information from the web, using advanced content extraction to identify the most relevant information from web pages
- 📥 **Stdin Processing**: Process piped content by using `{}` placeholder in prompts
- 🎨 **Markdown Rendering**: Beautiful formatting of markdown and code with syntax highlighting
- ⚡ **Real-time Markdown**: Stream responses with live updating syntax highlighting and formatting
- ⚙️ **Multiple Configurations**: Cross-platform config system supporting different profiles
- 💻 **Shell Command Generation**: OS-aware command execution
- 🧠 **Text Rewriting**: Improve text quality while maintaining original tone and meaning
- 🧩 **Clean Code Generation**: Output code without markdown or explanations
- 📝 **Rich Multiline Editor**: Interactive multiline text input with syntax highlighting and intuitive controls
- 📑 **Git Commit Messages**: AI-powered generation of conventional, detailed commit messages from git diffs
- 🎭 **System Prompts**: Customize model behavior with custom system prompts
- 📃 **Conversation Logging**: Save your conversations to text files for later reference
- 🔌 **Modular Architecture**: Well-structured codebase with clean separation of concerns
- 🔄 **Provider Switching**: Easily switch between different LLM providers with a single parameter
- 🚀 **Performance Optimized**: Fast response times and minimal resource usage

See the [Feature Overview](https://nazdridoy.github.io/ngpt/overview/) for more details.


## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Usage](#usage)
  - [Command Line Options](#command-line-options)
  - [Documentation](https://nazdridoy.github.io/ngpt/)
- [Documentation](#documentation)
- [Configuration](#configuration)
  - [API Key Setup](#api-key-setup)
  - [OpenAI API Key](#openai-api-key)
  - [Google Gemini API Key](#google-gemini-api-key)
  - [CLI Configuration](#cli-configuration)
  - [Interactive Configuration](#interactive-configuration)
  - [Configuration File](#configuration-file)
  - [Configuration Priority](#configuration-priority)
- [Contributing](#contributing)
- [License](#license)

## Installation

```bash
# Installation with pip
pip install ngpt

# Or install with uv (faster installation)
uv pip install ngpt

# Or install globally as a CLI tool (recommended for command-line usage)
uv tool install ngpt

# Arch Linux: install from AUR
paru -S ngpt
```

Requires Python 3.8 or newer.

For detailed installation instructions, see the [Installation Guide](https://nazdridoy.github.io/ngpt/installation/).

## Quick Start

```bash
# Chat with default settings
ngpt "Tell me about quantum computing"

# Alternatively, run as a Python module
python -m ngpt "Tell me about quantum computing"

# Start an interactive chat session with conversation memory
ngpt -i

# Return response without streaming
ngpt --no-stream "Tell me about quantum computing"

# Generate code
ngpt --code "function to calculate the Fibonacci sequence"

# Generate code with syntax highlighting
ngpt --code --prettify "function to calculate the Fibonacci sequence"

# Generate code with real-time syntax highlighting
ngpt --code --stream-prettify "function to calculate the Fibonacci sequence"

# Generate and execute shell commands
ngpt --shell "list all files in the current directory"

# Read from stdin and use the content in your prompt
echo "What is this text about?" | ngpt -p "Analyze the following text: {}"

# Rewrite text to improve quality while preserving tone and meaning
echo "your text" | ngpt -r

# Rewrite text from a command-line argument
ngpt -r "your text to rewrite"

# Rewrite text from a file
cat file.txt | ngpt -r

# Generate AI-powered git commit messages for staged changes
ngpt -g

# Generate commit message from staged changes with a context directive
ngpt -g --preprompt "type:feat"

# Process large diffs in chunks with recursive analysis
ngpt -g --rec-chunk

# Process a diff file instead of staged changes
ngpt -g --diff /path/to/changes.diff

# Generate a commit message with logging for debugging
ngpt -g --log commit_log.txt

# Use interactive multiline editor to enter text to rewrite
ngpt -r

# Display markdown responses with beautiful formatting
ngpt --prettify "Explain markdown syntax with examples"

# Display markdown responses with real-time formatting
ngpt --stream-prettify "Explain markdown syntax with examples"

# Use a specific markdown renderer
ngpt --prettify --renderer=rich "Create a markdown table"

# Use multiline editor for complex prompts
ngpt --text

# Use custom system prompt
ngpt --preprompt "You are a Linux expert" "How do I find large files?"

# Log your conversation to a file
ngpt --interactive --log conversation.log

# Create a temporary log file automatically
ngpt --log "Tell me about quantum computing"

# Process text from stdin using the {} placeholder
cat README.md | ngpt -p "Summarize this document: {}"

# Use different model providers by specifying the provider name
ngpt --provider Groq "Explain quantum computing"

# Compare outputs from different providers
ngpt --provider OpenAI "Explain quantum physics" > openai_response.txt
ngpt --provider Ollama "Explain quantum physics" > ollama_response.txt

# Show all API configurations
ngpt --show-config --all

# List available models for the active configuration
ngpt --list-models

# List models for a specific configuration (index)
ngpt --list-models --config-index 1

# List models for a specific configuration (provider)
ngpt --list-models --provider Gemini

# With custom options
ngpt --api-key your-key --base-url http://your-endpoint --model your-model "Hello"

# Enable web search capability to enhance prompts with web information
ngpt --web-search "What's the latest news about AI?"

# Generate and execute shell commands (using -s or --shell flag)
# OS-aware: generates appropriate commands for Windows, macOS, or Linux
ngpt -s "list all files in current directory"
# On Windows generates: dir
# On Linux/macOS generates: ls -la

# Generate code (using -c or --code flag)
ngpt -c "create a python function that calculates fibonacci numbers"

# Use multiline text editor for complex prompts (using -t or --text flag)
ngpt -t
```

For more examples and detailed usage, visit the [CLI Usage Guide](https://nazdridoy.github.io/ngpt/usage/cli_usage/).

## Usage

### Command Line Options

```console
❯ ngpt -h
usage: ngpt [-h] [-v] [--language LANGUAGE] [--config [CONFIG]] [--config-index CONFIG_INDEX] [--provider PROVIDER]
            [--remove] [--show-config] [--all] [--list-models] [--list-renderers] [--cli-config [COMMAND ...]]
            [--api-key API_KEY] [--base-url BASE_URL] [--model MODEL] [--web-search] [--temperature TEMPERATURE]
            [--top_p TOP_P] [--max_tokens MAX_TOKENS] [--log [FILE]] [--preprompt PREPROMPT] [--no-stream | --prettify |
            --stream-prettify] [--renderer {auto,rich,glow}] [--rec-chunk] [--diff [FILE]] [--chunk-size CHUNK_SIZE]
            [--analyses-chunk-size ANALYSES_CHUNK_SIZE] [--max-msg-lines MAX_MSG_LINES]
            [--max-recursion-depth MAX_RECURSION_DEPTH] [-i | -s | -c | -t | -p | -r | -g]
            [prompt]

nGPT - Interact with AI language models via OpenAI-compatible APIs

positional arguments::

[PROMPT]                            The prompt to send

options::

-h, --help                          show this help message and exit
-v, --version                       Show version information and exit
--language LANGUAGE                 Programming language to generate code in (for code mode)

Configuration Options::

--config [CONFIG]                   Path to a custom config file or, if no value provided, enter interactive configuration mode to create a new config
--config-index CONFIG_INDEX         Index of the configuration to use or edit (default: 0)
--provider PROVIDER                 Provider name to identify the configuration to use
--remove                            Remove the configuration at the specified index (requires --config and --config-index or --provider)
--show-config                       Show the current configuration(s) and exit
--all                               Show details for all configurations (requires --show-config)
--list-models                       List all available models for the current configuration and exit
--list-renderers                    Show available markdown renderers for use with --prettify
--cli-config [COMMAND ...]          Manage CLI configuration (set, get, unset, list, help)

Global Options::

--api-key API_KEY                   API key for the service
--base-url BASE_URL                 Base URL for the API
--model MODEL                       Model to use
--web-search                        Enable web search capability using DuckDuckGo to enhance prompts with relevant information
--temperature TEMPERATURE           Set temperature (controls randomness, default: 0.7)
--top_p TOP_P                       Set top_p (controls diversity, default: 1.0)
--max_tokens MAX_TOKENS             Set max response length in tokens
--log [FILE]                        Set filepath to log conversation to, or create a temporary log file if no path provided
--preprompt PREPROMPT               Set custom system prompt to control AI behavior
--renderer {auto,rich,glow}         Select which markdown renderer to use with --prettify or --stream-prettify (auto, rich, or glow)

Output Display Options (mutually exclusive)::

--no-stream                         Return the whole response without streaming or formatting
--prettify                          Render complete response with markdown and code formatting (non-streaming)
--stream-prettify                   Stream response with real-time markdown rendering (default)

Git Commit Message Options::

--rec-chunk                         Process large diffs in chunks with recursive analysis if needed
--diff [FILE]                       Use diff from specified file instead of staged changes. If used without a path, uses the path from CLI config.
--chunk-size CHUNK_SIZE             Number of lines per chunk when chunking is enabled (default: 200)
--analyses-chunk-size ANALYSES_CHUNK_SIZE Number of lines per chunk when recursively chunking analyses (default: 200)
--max-msg-lines MAX_MSG_LINES       Maximum number of lines in commit message before condensing (default: 20)
--max-recursion-depth MAX_RECURSION_DEPTH Maximum recursion depth for commit message condensing (default: 3)

Modes (mutually exclusive)::

-i, --interactive                   Start an interactive chat session
-s, --shell                         Generate and execute shell commands
-c, --code                          Generate code
-t, --text                          Enter multi-line text input (submit with Ctrl+D)
-p, --pipe                          Read from stdin and use content with prompt. Use {} in prompt as placeholder for stdin content
-r, --rewrite                       Rewrite text from stdin to be more natural while preserving tone and meaning
-g, --gitcommsg                     Generate AI-powered git commit messages from staged changes or diff file
```

> **Note**: For better visualization of conventional commit messages on GitHub, you can use the [GitHub Commit Labels](https://greasyfork.org/en/scripts/526153-github-commit-labels) userscript, which adds colorful labels to your commits.

For a complete reference of all available options, detailed CLI examples and usage information, see the [CLI Usage Guide](https://nazdridoy.github.io/ngpt/usage/cli_usage/).


## Documentation

Comprehensive documentation, including usage guides and examples, is available at:

**[https://nazdridoy.github.io/ngpt/](https://nazdridoy.github.io/ngpt/)**

Key documentation sections:
- [Installation Guide](https://nazdridoy.github.io/ngpt/installation/)
- [CLI Usage Guide](https://nazdridoy.github.io/ngpt/usage/cli_usage/)
- [Configuration Guide](https://nazdridoy.github.io/ngpt/configuration/)
- [Examples & Tutorials](https://nazdridoy.github.io/ngpt/examples/basic/)
- [Git Commit Message Guide](https://nazdridoy.github.io/ngpt/usage/gitcommsg/)


## Configuration

### API Key Setup

#### OpenAI API Key
1. Create an account at [OpenAI](https://platform.openai.com/)
2. Navigate to API keys: https://platform.openai.com/api-keys
3. Click "Create new secret key" and copy your API key
4. Configure nGPT with your key:
   ```bash
   ngpt --config
   # Enter provider: OpenAI
   # Enter API key: your-openai-api-key
   # Enter base URL: https://api.openai.com/v1/
   # Enter model: gpt-3.5-turbo (or other model)
   ```

#### Google Gemini API Key
1. Create or use an existing Google account
2. Go to [Google AI Studio](https://aistudio.google.com/)
3. Navigate to API keys in the left sidebar (or visit https://aistudio.google.com/app/apikey)
4. Create an API key and copy it
5. Configure nGPT with your key:
   ```bash
   ngpt --config
   # Enter provider: Gemini
   # Enter API key: your-gemini-api-key
   # Enter base URL: https://generativelanguage.googleapis.com/v1beta/openai
   # Enter model: gemini-2.0-flash
   ```

For more detailed information, refer to the [API Key Setup documentation](https://nazdridoy.github.io/ngpt/configuration/#api-key-setup).

### CLI Configuration

NGPT offers a CLI configuration system that allows you to set default values for command-line options. This is especially useful when you:

- Repeatedly use the same provider or model
- Have preferred settings for specific tasks
- Want to create different workflows based on context

For example, setting your preferred language for code generation or temperature value means you won't have to specify these parameters each time:

```console

❯ ngpt --cli-config help

CLI Configuration Help:
  Command syntax:
    ngpt --cli-config help                - Show this help message
    ngpt --cli-config set OPTION VALUE    - Set a default value for OPTION
    ngpt --cli-config get OPTION          - Get the current value of OPTION
    ngpt --cli-config get                 - Show all CLI configuration settings
    ngpt --cli-config unset OPTION        - Remove OPTION from configuration
    ngpt --cli-config list                - List all available options

  Available options:
    General options (all modes):
      config-index - int (default: 0) [exclusive with: provider]
      log - str 
      max_tokens - int 
      no-stream - bool (default: False) [exclusive with: prettify, stream-prettify]
      preprompt - str 
      prettify - bool (default: False) [exclusive with: no-stream, stream-prettify]
      provider - str  [exclusive with: config-index]
      renderer - str (default: auto)
      stream-prettify - bool (default: False) [exclusive with: no-stream, prettify]
      temperature - float (default: 0.7)
      top_p - float (default: 1.0)
      web-search - bool (default: False)

    Options for Code generation mode:
      language - str (default: python)

    Options for Git commit message mode:
      analyses-chunk-size - int (default: 200)
      chunk-size - int (default: 200)
      diff - str 
      max-msg-lines - int (default: 20)
      max-recursion-depth - int (default: 3)
      rec-chunk - bool (default: False)

  Example usage:
    ngpt --cli-config set language java        - Set default language to java for code generation
    ngpt --cli-config set provider Gemini      - Set Gemini as your default provider
    ngpt --cli-config set temperature 0.9      - Set default temperature to 0.9
    ngpt --cli-config set no-stream true       - Disable streaming by default
    ngpt --cli-config set recursive-chunk true - Enable recursive chunking for git commit messages
    ngpt --cli-config set diff /path/to/file.diff - Set default diff file for git commit messages
    ngpt --cli-config get temperature          - Check the current temperature setting
    ngpt --cli-config get                      - Show all current CLI settings
    ngpt --cli-config unset language           - Remove language setting

  Notes:
    - CLI configuration is stored in:
      • Linux: ~/.config/ngpt/ngpt-cli.conf
      • macOS: ~/Library/Application Support/ngpt/ngpt-cli.conf
      • Windows: %APPDATA%\ngpt\ngpt-cli.conf
    - Settings are applied based on context (e.g., language only applies to code generation mode)
    - Command-line arguments always override CLI configuration
    - Some options are mutually exclusive and will not be applied together

```

For more details, see the [CLI Configuration Guide](https://nazdridoy.github.io/ngpt/usage/cli_config/).

### Interactive Configuration

The `--config` option without arguments enters interactive configuration mode, allowing you to add or edit configurations:

```bash
# Add a new configuration
ngpt --config

# Edit an existing configuration at index 1
ngpt --config --config-index 1

# Edit an existing configuration by provider name
ngpt --config --provider Gemini

# Remove a configuration at index 2
ngpt --config --remove --config-index 2

# Remove a configuration by provider name
ngpt --config --remove --provider Gemini

# Use a specific configuration by provider name
ngpt --provider OpenAI "Tell me about quantum computing"
```

In interactive mode:
- When editing an existing configuration, press Enter to keep the current values
- When creating a new configuration, press Enter to use default values
- For security, your API key is not displayed when editing configurations
- When removing a configuration, you'll be asked to confirm before deletion

For more details on configuring nGPT, see the [Configuration Guide](https://nazdridoy.github.io/ngpt/configuration/).

### Configuration File

nGPT uses a configuration file stored in the standard user config directory for your operating system:

- **Linux**: `~/.config/ngpt/ngpt.conf` or `$XDG_CONFIG_HOME/ngpt/ngpt.conf`
- **macOS**: `~/Library/Application Support/ngpt/ngpt.conf`
- **Windows**: `%APPDATA%\ngpt\ngpt.conf`

The configuration file uses a JSON list format, allowing you to store multiple configurations. You can select which configuration to use with the `--config-index` argument (or by default, index 0 is used).

#### Multiple Configurations Example (`ngpt.conf`)
```json
[
  {
    "api_key": "your-openai-api-key-here",
    "base_url": "https://api.openai.com/v1/",
    "provider": "OpenAI",
    "model": "gpt-4o"
  },
  {
    "api_key": "your-groq-api-key-here",
    "base_url": "https://api.groq.com/openai/v1/",
    "provider": "Groq",
    "model": "llama3-70b-8192"
  },
  {
    "api_key": "your-ollama-key-if-needed",
    "base_url": "http://localhost:11434/v1/",
    "provider": "Ollama-Local",
    "model": "llama3"
  }
]
```

For details on the configuration file format and structure, see the [Configuration Guide](https://nazdridoy.github.io/ngpt/configuration/).

### Configuration Priority

nGPT determines configuration values in the following order (highest priority first):

1. Command line arguments (`--api-key`, `--base-url`, `--model`, etc.)
2. Environment variables (`OPENAI_API_KEY`, `OPENAI_BASE_URL`, `OPENAI_MODEL`)
3. CLI configuration file (`ngpt-cli.conf`, managed with `--cli-config`)
4. Main configuration file `ngpt.conf` or `custom-config-file`
5. Default values

## Contributing

We welcome contributions to nGPT! Whether it's bug fixes, feature additions, or documentation improvements, your help is appreciated.

To contribute:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Make your changes
4. Commit with clear messages following conventional commit guidelines
5. Push to your fork and submit a pull request

Please check the [CONTRIBUTING.md](CONTRIBUTING.md) file for detailed guidelines on code style, pull request process, and development setup.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
