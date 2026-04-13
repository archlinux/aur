# wiksr

Terminal instant answer browser. Ask questions or type terms into your terminal and get a brief answer from a local AI model, falling back to Wikipedia if ollama isn't running.

## Usage

```
wiksr [--model MODEL] [--timeout SECONDS] [--source auto|ai|wiki]
```

Then type any question at the `?` prompt. Type `q` to quit.

## Examples

```
? capital of France
? who is Ada Lovelace
? speed of light
```

## Configuration

All options can be set with a flag or a persistent env var in your shell rc (`~/.bashrc`, `~/.zshrc`, etc.). Flags take priority over env vars.

### Model (`--model` / `-m` · `WIKSR_MODEL`)

Pick any model you have pulled in ollama (`ollama list`). Default: `deepseek-r1:1.5b`.

```
wiksr --model deepseek-r1:8b
wiksr -m llama3.1:70b
```
```
export WIKSR_MODEL=deepseek-r1:8b
```

### Timeout (`--timeout` / `-t` · `WIKSR_TIMEOUT`)

Max seconds to wait for ollama before falling back to Wikipedia. Default: `60`.

```
wiksr --timeout 10
wiksr -t 30
```
```
export WIKSR_TIMEOUT=10
```

### Source (`--source` / `-s` · `WIKSR_SOURCE`)

Control which backend is used. Default: `auto`.

| Value  | Behaviour                              |
|--------|----------------------------------------|
| `auto` | Try ollama first, fall back to Wikipedia if it times out or isn't running |
| `ai`   | ollama only — no Wikipedia fallback    |
| `wiki` | Wikipedia only — never contacts ollama |

```
wiksr --source wiki
wiksr -s ai
```
```
export WIKSR_SOURCE=wiki
```

## Dependencies

- Python
- [python-rich](https://archlinux.org/packages/extra/any/python-rich/)
- [ollama](https://aur.archlinux.org/packages/ollama) *(optional — Wikipedia used as fallback if not running)*

## Install

```
yay -S wiksr
```
