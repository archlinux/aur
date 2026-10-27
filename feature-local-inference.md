# Local STT, TTS & Image Description Configuration Guide for LibreFang

This document describes how to configure LibreFang with local Speech-to-Text (STT), Text-to-Speech (TTS), and Image Description (vision) services using LibreFang's native custom-endpoint support (no patches or dummy API keys required).

---

## 1. Local Speech-to-Text (STT)

LibreFang natively supports routing Whisper-compatible transcription requests to any self-hosted service (e.g. `faster-whisper-server`, `whisper.cpp` server, or custom Whisper HTTP daemon) running locally (e.g. on port `20090`).

### Configuration

Add the following to your `~/.librefang/config.toml` file:

```toml
[media]
audio_transcription = true
audio_provider = "local-whisper"           # Any name other than built-in cloud providers

[media.custom_stt]
base_url = "http://localhost:20090/v1/audio/transcriptions"
model = "whisper-1"                        # Target model ID
key_required = false                       # Suppresses Authorization header for keyless servers
# api_key_env = "MY_STT_KEY"              # Optional: env var name if endpoint requires auth
```

---

## 2. Local Text-to-Speech (TTS)

LibreFang natively supports routing OpenAI-compatible text-to-speech requests to any self-hosted service (e.g. `openedai-speech`, Piper HTTP wrapper, Kokoro-FastAPI, or F5-TTS) running locally (e.g. on port `20095`).

### Configuration

Add the following to your `~/.librefang/config.toml` file:

```toml
[tts]
enabled = true
provider = "local-piper"                   # Any name other than built-ins ("openai", "elevenlabs", "google_tts")

[tts.custom]
base_url = "http://localhost:20095/v1/audio/speech"
model = "tts-1"
voice = "alloy"
format = "mp3"
key_required = false                       # Suppresses Authorization header for keyless servers
# api_key_env = "MY_TTS_KEY"              # Optional: env var name if endpoint requires auth
```

---

## 3. Local Image Description (Vision)

LibreFang natively supports routing image description (multimodal chat completions) to any self-hosted service (e.g. `llama.cpp` `llama-server` with a vision/LLaVA model, `ollama`, or `vLLM`) running locally (e.g. on port `20100`).

### Configuration

Add the following to your `~/.librefang/config.toml` file:

```toml
[media]
image_description = true
image_provider = "local-vision"            # Any name other than built-ins ("anthropic", "openai", "groq", "gemini")
video_description = false

[media.custom_image]
base_url = "http://localhost:20100/v1/chat/completions"
model = "llava"                            # Vision model ID
key_required = false                       # Suppresses Authorization header for keyless servers
# api_key_env = "MY_VISION_KEY"           # Optional: env var name if endpoint requires auth
```

---

## 4. Local-Only `config.toml` Examples

Below are complete configuration templates for fully local inference pipelines (chat, embeddings, STT, TTS, and Vision).

### Scenario A: Single-Port Setup (Both LLM and Embeddings on the same port)
This configuration targets a unified local inference server (such as `llama-server` from `llama.cpp`) running on port `20080` that exposes both LLM and embeddings endpoints.

```toml
# API Listen Address
api_listen = "127.0.0.1:4545"
api_key = "my-secure-api-key"

# 1. Chat (LLM) configuration targeting local unified server
[default_model]
provider = "openai"
model = "qwen3"
api_key_env = "UNUSED_API_KEY"
base_url = "http://localhost:20080/v1"

# 2. Vector Memory & Embeddings targeting the same unified server
[memory]
embedding_provider = "openai"
embedding_model = "qwen3-embedding"
embedding_dimensions = 1536

# 3. Speech-to-Text & Image Description
[media]
audio_transcription = true
audio_provider = "local-whisper"
image_description = true
image_provider = "local-vision"
video_description = false

[media.custom_stt]
base_url = "http://localhost:20090/v1/audio/transcriptions"
model = "whisper-1"
key_required = false

[media.custom_image]
base_url = "http://localhost:20100/v1/chat/completions"
model = "llava"
key_required = false

# 4. Text-to-Speech (e.g. kokoro-tts / piper on port 20095)
[tts]
enabled = true
provider = "local-piper"

[tts.custom]
base_url = "http://localhost:20095/v1/audio/speech"
model = "tts-1"
voice = "alloy"
format = "mp3"
key_required = false

# 5. Base URL Overrides mapping built-in "openai" requests to the local LLM port
[provider_urls]
openai = "http://localhost:20080/v1"
```

### Scenario B: Multi-Port Setup (vLLM for Chat, llama-server for Embeddings)
This configuration applies when routing chat requests to a local `vLLM` server on port `20080`, while keeping vector embeddings separated on `llama-server` on port `50085`.

```toml
# API Listen Address
api_listen = "127.0.0.1:4545"
api_key = "my-secure-api-key"

# 1. Chat (LLM) configuration targeting vLLM on port 20080
[default_model]
provider = "vllm"
model = "qwen3"
api_key_env = "UNUSED_API_KEY"
base_url = "http://localhost:20080/v1"

# 2. Vector Memory & Embeddings targeting llama-server on port 50085
[memory]
embedding_provider = "openai"
embedding_model = "qwen3-embedding"
embedding_dimensions = 1536

# 3. Speech-to-Text & Image Description
[media]
audio_transcription = true
audio_provider = "local-whisper"
image_description = true
image_provider = "local-vision"
video_description = false

[media.custom_stt]
base_url = "http://localhost:20090/v1/audio/transcriptions"
model = "whisper-1"
key_required = false

[media.custom_image]
base_url = "http://localhost:20100/v1/chat/completions"
model = "llava"
key_required = false

# 4. Text-to-Speech
[tts]
enabled = true
provider = "local-piper"

[tts.custom]
base_url = "http://localhost:20095/v1/audio/speech"
model = "tts-1"
voice = "alloy"
format = "mp3"
key_required = false

# 5. Base URL Overrides mapping (targets embedding port 50085 for "openai")
[provider_urls]
openai = "http://localhost:50085/v1"
```
