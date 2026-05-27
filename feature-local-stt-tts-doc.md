# Local STT & TTS Configuration Guide for LibreFang

This document describes how to configure and run the patched LibreFang package with local Speech-to-Text (STT) and Text-to-Speech (TTS) split services.

---

## 1. Local Speech-to-Text (STT)

With the `feature-local-stt` patch, you can point Whisper-compatible transcription requests to a local service (like a custom python whisper-server or `llama.cpp` whisper server running on port `50090`).

### Configuration

Add the following to your `~/.librefang/config.toml` file:

```toml
[media]
audio_transcription = true
audio_provider = "openai"           # Use OpenAI-compatible Whisper protocol
audio_model = "whisper-1"           # Target model ID
audio_base_url = "http://localhost:50090/v1"  # Local STT server base URL
```

And define `OPENAI_API_KEY` (even a dummy value like `"unused"`) in your `librefang.env` environment file:
```shell
OPENAI_API_KEY="unused"
```

---

## 2. Local Text-to-Speech (TTS)

With the `feature-local-tts` patch, you can point OpenAI-compatible text-to-speech requests to a local service (like Kokoro-FastAPI, F5-TTS, or other OpenAI-compatible TTS servers running on port `50095`).

### Configuration

Add the following to your `~/.librefang/config.toml` file:

```toml
[tts]
enabled = true
provider = "openai"                 # Use OpenAI-compatible protocol

[tts.openai]
model = "tts-1"
voice = "alloy"
format = "mp3"
speed = 1.0
base_url = "http://localhost:50095/v1"  # Local TTS server base URL
```

Ensure standard credentials are set in `librefang.env` if the server requires them.

---

## 3. Local-Only `config.toml` Examples

Below are two configuration templates for a fully local-only inference pipeline (chat, embeddings, STT, and TTS).

### Scenario A: Single-Port Setup (Both LLM and Embeddings on the same port)
This configuration targets a unified local inference server (such as `llama-server` from `llama.cpp`) running on port `50080` that exposes both LLM and embeddings endpoints. This avoids using a separate placeholder provider (the "vllm hack").

```toml
# API Listen Address
api_listen = "127.0.0.1:4545"
api_key = "my-secure-api-key"

# 1. Chat (LLM) configuration targeting local unified server
[default_model]
provider = "openai"
model = "qwen3"
api_key_env = "UNUSED_API_KEY"
base_url = "http://localhost:50080/v1"

# 2. Vector Memory & Embeddings targeting the same unified server
[memory]
embedding_provider = "openai"
embedding_model = "qwen3-embedding"
embedding_dimensions = 1536

# 3. Speech-to-Text (e.g. whisper-server on port 50090)
[media]
audio_transcription = true
audio_provider = "openai"
audio_model = "whisper-1"
audio_base_url = "http://localhost:50090/v1"

# 4. Text-to-Speech (e.g. kokoro-tts-server on port 50095)
[tts]
enabled = true
provider = "openai"

[tts.openai]
model = "tts-1"
voice = "alloy"
base_url = "http://localhost:50095/v1"

# 5. Base URL Overrides mapping all "openai" requests to the local port
[provider_urls]
openai = "http://localhost:50080/v1"
```

### Scenario B: Multi-Port Setup with vLLM (vLLM for Chat, llama-server for Embeddings)
This configuration applies when transitioning the chat model to a local `vLLM` server running on port `50080`, while keeping vector embeddings separated on `llama-server` (or another embedding server) on port `50085`.

```toml
# API Listen Address
api_listen = "127.0.0.1:4545"
api_key = "my-secure-api-key"

# 1. Chat (LLM) configuration targeting vLLM on port 50080
[default_model]
provider = "vllm"
model = "qwen3"
api_key_env = "UNUSED_API_KEY"
base_url = "http://localhost:50080/v1"

# 2. Vector Memory & Embeddings targeting llama-server on port 50085
[memory]
embedding_provider = "openai"
embedding_model = "qwen3-embedding"
embedding_dimensions = 1536

# 3. Speech-to-Text (e.g. whisper-server on port 50090)
[media]
audio_transcription = true
audio_provider = "openai"
audio_model = "whisper-1"
audio_base_url = "http://localhost:50090/v1"

# 4. Text-to-Speech (e.g. kokoro-tts-server on port 50095)
[tts]
enabled = true
provider = "openai"

[tts.openai]
model = "tts-1"
voice = "alloy"
base_url = "http://localhost:50095/v1"

# 5. Base URL Overrides mapping (targets the embedding port 50085 for "openai")
[provider_urls]
openai = "http://localhost:50085/v1"
```
