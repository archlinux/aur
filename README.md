# wiksr

Terminal instant answer browser. Ask questions or type terms into your terminal and get a brief answer from a local AI model, falling back to Wikipedia if ollama isn't running.

## Usage

```
wiksr
```

Then type any question at the `?` prompt. Type `q` to quit.

## Examples

```
? capital of France
? who is Ada Lovelace
? speed of light
```

## Changing the AI model

By default wiksr uses `deepseek-r1:1.5b`. You can use any model you have pulled in ollama.

**Per-session flag:**
```
wiksr --model deepseek-r1:8b
wiksr -m llama3.1:70b
```

**Persistent — env var in your shell rc (`~/.bashrc`, `~/.zshrc`, etc.):**
```
export WIKSR_MODEL=deepseek-r1:8b
```

**Persistent — env var in a systemd user service or session:**
```
systemctl --user set-environment WIKSR_MODEL=deepseek-r1:70b
```

The flag takes priority over the env var. To see available models run `ollama list`.

## Dependencies

- Python
- [python-rich](https://archlinux.org/packages/extra/any/python-rich/)
- [ollama](https://aur.archlinux.org/packages/ollama) *(optional — Wikipedia used as fallback if not running)*

## Install

```
yay -S wiksr
```
