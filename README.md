# PPLX-Zero

> Fast Perplexity AI search CLI - minimal setup, maximal results

<p align="center">
  <a href="https://badge.fury.io/js/pplx-zero"><img src="https://badge.fury.io/js/pplx-zero.svg" alt="npm version"></a>
  <a href="https://aur.archlinux.org/packages/pplx-zero"><img src="https://img.shields.io/aur/version/pplx-zero?style=flat-square" alt="AUR package"></a>
  <a href="https://www.typescriptlang.org/"><img src="https://img.shields.io/badge/TypeScript-007ACC?logo=typescript&logoColor=white" alt="TypeScript"></a>
  <a href="https://bun.sh"><img src="https://img.shields.io/badge/Bun-black?logo=bun&logoColor=white" alt="Bun"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT"></a>
</p>

A fast TypeScript CLI for Perplexity AI search with multimodal support. Built with Bun runtime for performance and reliability.

## Features

- **⚡ Fast Search** - Concurrent queries with intelligent rate limiting
- **🎯 Simple Setup** - Works with just an API key, no configuration required
- **📦 Batch Processing** - Handle multiple searches simultaneously
- **🔄 Real-time Updates** - JSONL streaming progress events
- **🖼️ File Analysis** - Process documents and images with AI models
- **🤖 AI Models** - Sonar, Sonar Pro, Sonar Deep Research, Sonar Reasoning
- **🛡️ Type Safe** - Full Zod validation and TypeScript support
- **🌍 Cross-Platform** - Native Bun runtime support

## Quick Start

### 1️⃣ Install

**📦 Package Manager Installation (Recommended)**

<p align="center">
  <a href="https://badge.fury.io/js/pplx-zero"><img src="https://badge.fury.io/js/pplx-zero.svg" alt="npm version"></a>
  <a href="https://aur.archlinux.org/packages/pplx-zero"><img src="https://img.shields.io/aur/version/pplx-zero?style=flat-square" alt="AUR package"></a>
</p>

```bash
# npm (Node.js package manager) - Global installation
npm install -g pplx-zero

# AUR (Arch Linux) - Binary package
yay -S pplx-zero

# AUR (Arch Linux) - Manual build
git clone https://aur.archlinux.org/pplx-zero.git
cd pplx-zero
makepkg -si

# Verify installation
pplx --version
```

**🔨 Manual Installation**

```bash
# Clone and build locally
git clone https://github.com/codewithkenzo/pplx-zero.git
cd pplx-zero
bun install && bun run build

# Add to PATH
sudo ln -s "$(pwd)/dist/cli.js" /usr/local/bin/pplx

# Verify installation
pplx --version
```

### 2️⃣ Setup API Key

**Linux/macOS:**
```bash
export PERPLEXITY_API_KEY="your-api-key"
```

**Windows:**
```cmd
setx PERPLEXITY_API_KEY "your-api-key"
```

**Get your API key:** https://www.perplexity.ai/account/api/keys

### 3️⃣ Start Searching (Simplified Interface)

```bash
# Simple search
pplx "latest AI developments"

# Choose model for detailed analysis
pplx --model sonar-pro "Explain quantum computing"

# Analyze document (simplified syntax)
pplx --file report.pdf "Summarize this document"

# Analyze image (simplified syntax)
pplx --image screenshot.png "What does this interface do?"

# Document + image analysis
pplx --file data.csv --image chart.png "Analyze this data"

# Advanced AI models
pplx --model sonar-reasoning "Solve this math problem"
pplx --model sonar-deep-research "History of artificial intelligence"

# See basic help
pplx --help

# See advanced options
pplx --help-advanced
```

**🔄 Migration from v1.0.x:**
```bash
# OLD: pplx --format jsonl --input queries.json "search"
# NEW: pplx --format jsonl --input queries.json "search"  # format flag unchanged

# OLD: pplx --attach document.pdf "analyze"
# NEW: pplx --file document.pdf "analyze"              # simplified syntax
```

## Usage Guide

### Command Line Options

**Quick Reference:**
```bash
# Basic search
pplx "latest AI developments"

# File analysis (simplified)
pplx -f document.pdf "Summarize this"

# Advanced batch processing
pplx --input queries.json -c 10 -t 60000

# See all options
pplx --help-advanced
```

**Essential Commands:**
```bash
# Model selection
pplx -m sonar-pro "Detailed analysis"

# File + image
pplx -f doc.md -i chart.png "Analyze both"

# Output format
pplx -o jsonl "Get streaming output"

# Async with webhook
pplx --async --webhook https://api.example.com "Long task"
```

### Batch Processing

Create `queries.json`:

```json
{
  "version": "1.0.0",
  "requests": [
    {"op": "search", "args": {"query": "AI trends", "maxResults": 5}},
    {"op": "search", "args": {"query": "TypeScript patterns", "maxResults": 3}},
    {"op": "search", "args": {"query": "Bun performance", "maxResults": 3}}
  ],
  "options": {
    "concurrency": 5,
    "timeoutMs": 30000
  }
}
```

Process with:

```bash
pplx --input queries.json --format jsonl
```

### File Attachments

Supported file formats for analysis:

**Documents (max 50MB):**
- PDF, DOC, DOCX, TXT, RTF, MD

**Images (max 50MB):**
- PNG, JPEG, WebP, HEIF, HEIC, GIF

**Examples:**
```bash
# Document analysis
pplx --attach report.pdf "Summarize this document"

# Image analysis
pplx --attach-image screenshot.png "Analyze this interface"

# Multiple files
pplx --attach document.txt --attach-image chart.png "Analyze this data"
```

### Programmatic Usage

```typescript
import { PerplexitySearchTool } from 'pplx-zero';

const tool = new PerplexitySearchTool();

const result = await tool.runBatch({
  version: "1.0.0",
  requests: [{
    op: "search",
    args: { query: "TypeScript best practices", maxResults: 5 }
  }]
});

console.log(result);
```

## Configuration

### Simplified Options (Everyday Usage)

| Option | Short | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--file` | `-f` | string | - | Attach document (PDF, DOC, DOCX, TXT, RTF, MD) |
| `--image` | `-i` | string | - | Attach image (PNG, JPEG, WebP, HEIF, HEIC, GIF) |
| `--format` | `-o` | string | json | Output format: json|jsonl |
| `--model` | `-m` | string | sonar | AI model: sonar, sonar-pro, sonar-deep-research, sonar-reasoning |
| `--version` | `-v` | boolean | - | Show version |
| `--help` | `-h` | boolean | - | Show basic help |

### Advanced Options (Power Users)

| Option | Short | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--input` | `-I` | string | - | Read batch requests from JSON file |
| `--stdin` | `-s` | boolean | false | Read JSONL requests from stdin |
| `--concurrency` | `-c` | number | 5 | Max concurrent requests (1-20) |
| `--timeout` | `-t` | number | 30000 | Request timeout in ms (1000-300000) |
| `--workspace` | `-w` | string | - | Workspace directory for sandboxing |
| `--attach` | - | string[] | - | Attach document files (multiple) |
| `--attach-image` | - | string[] | - | Attach image files (multiple) |
| `--async` | - | boolean | false | Process requests asynchronously |
| `--webhook` | - | string | - | Webhook URL for async notifications |
| `--help-advanced` | - | boolean | - | Show advanced help with all options |

### Quick Reference

```bash
# Basic usage (simplified)
pplx -f doc.pdf -m sonar-pro "analyze this"

# Advanced usage (full control)
pplx -I batch.json -c 10 -t 60000 --format jsonl "process all"

# See all available options
pplx --help-advanced
```

### AI Models

- `sonar` - Fast, concise responses (default)
- `sonar-pro` - Detailed, comprehensive responses
- `sonar-deep-research` - In-depth research with web search
- `sonar-reasoning` - Step-by-step logical reasoning

## Output Formats

### JSON (Default)
```json
{
  "version": "1.0.0",
  "ok": true,
  "summary": {
    "total": 1,
    "successful": 1,
    "failed": 0,
    "totalDuration": 572
  },
  "results": [...]
}
```

### JSONL (Streaming)
```bash
pplx --format jsonl "AI trends"
```
Each result printed as a separate JSON line for real-time processing.

## Development

```bash
# Clone and build
git clone https://github.com/codewithkenzo/pplx-zero.git
cd pplx-zero
bun install && bun run build

# Development mode
bun run dev

# Type checking
bun run typecheck

# Build for production
bun run build

# Create binary
bun run build:binary
```

## Architecture

- **Bun Runtime** - Fast JavaScript runtime
- **Zod Validation** - Type-safe schema validation
- **Error Handling** - Resilient error recovery
- **Concurrency Control** - Semaphore pattern for rate limiting
- **Streaming Events** - Real-time progress updates

## Security Features

- Environment variable API key management
- Input validation and sanitization
- Request timeout protection
- Error information filtering
- No external dependencies beyond core runtime

## Error Handling

PPLX-Zero provides comprehensive error classification:

```typescript
enum ErrorCode {
  VALIDATION_ERROR = "VALIDATION_ERROR",
  API_KEY_MISSING = "API_KEY_MISSING",
  API_ERROR = "API_ERROR",
  TIMEOUT_ERROR = "TIMEOUT_ERROR",
  NETWORK_ERROR = "NETWORK_ERROR",
  RATE_LIMIT_ERROR = "RATE_LIMIT_ERROR",
  UNEXPECTED_ERROR = "UNEXPECTED_ERROR"
}
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - see [LICENSE](LICENSE) file for details.

---

**Built with [Bun](https://bun.sh) and [Perplexity AI](https://www.perplexity.ai)**
