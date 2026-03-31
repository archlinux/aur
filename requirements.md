# Hermes Agent Dependencies

This document consolidates the dependency declarations from `hermes-agent/requirements.txt`, `hermes-agent/pyproject.toml`, and `hermes-agent/tinker-atropos/pyproject.toml`.

## 1. Core Dependencies (`pyproject.toml`)
These are the strict runtime requirements for `hermes-agent`.
- `openai>=2.21.0,<3`
- `anthropic>=0.39.0,<1`
- `python-dotenv>=1.2.1,<2`
- `fire>=0.7.1,<1`
- `httpx>=0.28.1,<1`
- `rich>=14.3.3,<15`
- `tenacity>=9.1.4,<10`
- `pyyaml>=6.0.2,<7`
- `requests>=2.33.0,<3`
- `jinja2>=3.1.5,<4`
- `pydantic>=2.12.5,<3`
- `prompt_toolkit>=3.0.52,<4`
- `exa-py>=2.9.0,<3`
- `firecrawl-py>=4.16.0,<5`
- `parallel-web>=0.4.2,<1`
- `fal-client>=0.13.1,<1`
- `edge-tts>=7.2.7,<8`
- `PyJWT[crypto]>=2.12.0,<3`

## 2. Optional / Feature Groups (`pyproject.toml`)
Optional dependencies enabled via pip extras (e.g., `pip install .[messaging]`).

- **modal**: `modal>=1.0.0,<2`
- **daytona**: `daytona>=0.148.0,<1`
- **dev**: `pytest>=9.0.2,<10`, `pytest-asyncio>=1.3.0,<2`, `pytest-xdist>=3.0,<4`, `mcp>=1.2.0,<2`
- **messaging**: `python-telegram-bot>=22.6,<23`, `discord.py[voice]>=2.7.1,<3`, `aiohttp>=3.13.3,<4`, `slack-bolt>=1.18.0,<2`, `slack-sdk>=3.27.0,<4`
- **cron**: `croniter>=6.0.0,<7`
- **slack**: `slack-bolt>=1.18.0,<2`, `slack-sdk>=3.27.0,<4`
- **matrix**: `matrix-nio[e2e]>=0.24.0,<1`
- **cli**: `simple-term-menu>=1.0,<2`
- **tts-premium**: `elevenlabs>=1.0,<2`
- **voice**: `faster-whisper>=1.0.0,<2`, `sounddevice>=0.4.6,<1`, `numpy>=1.24.0,<3`
- **pty**: `ptyprocess>=0.7.0,<1`, `pywinpty>=2.0.0,<3`
- **honcho**: `honcho-ai>=2.0.1,<3`
- **mcp**: `mcp>=1.2.0,<2`
- **homeassistant**: `aiohttp>=3.9.0,<4`
- **sms**: `aiohttp>=3.9.0,<4`
- **acp**: `agent-client-protocol>=0.8.1,<0.9`
- **dingtalk**: `dingtalk-stream>=0.1.0,<1`
- **feishu**: `lark-oapi>=1.5.3,<2`
- **rl**: `atroposlib @ git+...`, `tinker @ git+...`, `fastapi>=0.104.0,<1`, `uvicorn[standard]>=0.24.0,<1`, `wandb>=0.15.0,<1`

## 3. Tinker-Atropos Integration
Dependencies specific to the `tinker-atropos` submodule.
- `atroposlib @ git+https://github.com/NousResearch/atropos.git`
- `tinker @ git+https://github.com/thinking-machines-lab/tinker.git`
- `fastapi>=0.104.0`
- `uvicorn[standard]>=0.24.0`
- `pydantic>=2.0.0`
- `requests>=2.31.0`
- `aiohttp>=3.9.0`
- `wandb>=0.15.0`
- `python-dotenv>=1.0.0`

## 4. Legacy / Convenience List (`requirements.txt`)
A subset of the canonical dependencies maintained for convenience.
- `openai`, `python-dotenv`, `fire`, `httpx`, `rich`, `tenacity`, `prompt_toolkit`, `pyyaml`, `requests`, `jinja2`, `pydantic>=2.0`, `PyJWT[crypto]`
- `firecrawl-py`, `parallel-web>=0.4.2`
- `fal-client`
- `edge-tts`
- `croniter`, `python-telegram-bot>=20.0`, `discord.py>=2.0`, `aiohttp>=3.9.0`
