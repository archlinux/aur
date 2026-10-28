# gemini-api-mcp

Model Context Protocol (MCP) server helper for [`gemini-api`](https://github.com/google-gemini/gemini-api-cli) (the official Google Gemini API CLI).

Exposes typed MCP tools for text & multimodal generation, media synthesis (images, audio TTS), audio/video transcription, document analysis, offline/online model catalog inspection, and Files API management.

## Available Tools

| Tool | Description |
|------|-------------|
| `gemini_generate` | Text & multimodal reasoning and generation using Gemini models (supports `gemini-3.8-flash`, `gemini-pro-latest`, etc.). |
| `gemini_image` | Image generation and conversational editing via Gemini image models (`gemini-nano-banana-2.1`, `gemini-3.1-flash-image`). |
| `gemini_analyze` | Ask questions about media (images, audio, video, PDFs, CSV, code, YouTube URLs). |
| `gemini_tts` | Text-to-speech generation into high quality 24kHz mono WAV files (single voice or multi-speaker). |
| `gemini_transcribe` | Transcribe audio/video with speaker diarization and timestamps into markdown, text, json, or srt. |
| `gemini_models` | Query offline curated model catalog or live API model metadata. |
| `gemini_whoami` | Check current authentication status and active credential sources. |
| `gemini_files` | Upload, list, inspect, and delete files on the Google Gemini Files API (48h retention). |
| `gemini_command` | Execute any other `gemini-api` subcommands safely with dry-run support. |

## Prerequisites

Ensure `gemini-api` is installed and in your `PATH`:
- AUR package: `yay -S gemini-api-cli-bin`
- Or from GitHub Releases / install script.

Ensure your `GEMINI_API_KEY` is configured:
```bash
export GEMINI_API_KEY="your-api-key"
# or
gemini-api configure
```

## Setup & Execution

### Direct Execution
```bash
python3 /home/twilight/Projects/gemini-api-mcp/gemini_api_mcp/server.py
```

### Installation with `uv` or `pip`
```bash
cd /home/twilight/Projects/gemini-api-mcp
pip install -e .
# or
uv pip install -e .
```

### Antigravity & Claude Desktop Configuration (`mcp_config.json`)
```json
{
  "mcpServers": {
    "gemini-api-mcp": {
      "command": "/usr/bin/python3",
      "args": [
        "/home/twilight/Projects/gemini-api-mcp/gemini_api_mcp/server.py"
      ],
      "timeoutSeconds": -1
    }
  }
}
```
