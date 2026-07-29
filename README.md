
# yay-llm-review

`yay-llm-review` adds an opt-in `AURPreInstall` Lua hook to yay 13. The hook
sends the checked-out AUR recipe to an OpenAI-compatible `llama.cpp` server
before source downloads and builds begin.

It reviews:

- the full tracked AUR repository (`PKGBUILD`, `.install`, patches and scripts);
- the Git diff from `AUR_SEEN` when available, otherwise from the previous commit;
- deterministic warning signals such as pipe-to-shell downloads, obfuscated
  execution, setuid creation, credential paths and disabled checksums.

Package contents are explicitly framed as untrusted data in the model prompt.
This reduces, but cannot eliminate, prompt-injection and model errors. Keep
`yay`'s normal diff review enabled.

## Build and install

```sh
makepkg -si
```

The package does not modify any user's home directory. Initialize it as the
user who runs yay:

```sh
yay-llm-review init
```

This creates:

```text
~/.config/yay/init.lua
~/.config/yay-llm-review/config.toml
```

The generated configuration contains `enabled = false`. Edit it, set the
llama.cpp endpoint and model, then enable it:

```toml
enabled = true
endpoint = "http://kicer.lan:3030/v1"
model = "local-model"
```

Check the effective setup:

```sh
yay-llm-review status
```

Manual test against an existing AUR checkout:

```sh
yay-llm-review scan ~/.cache/yay/some-package
```

Exit statuses are `0` for allow, `10` for warning, `20` for block and `30` for
scanner failure.

## Policy

The model returns one of `safe`, `low`, `medium`, `high`, `critical`, or
`uncertain`. Every non-safe result is displayed. `block_threshold` controls
which risk level aborts yay; the default is `critical`. `uncertain` always
warns. `on_error` controls whether transport and response errors warn or block.

A conservative starting point is:

```toml
block_threshold = "critical"
on_error = "warn"
```

After observing the selected model's false-positive rate, changing the block
threshold to `high` is reasonable.

## Disable or remove the loader

Set `enabled = false`, or remove only the managed loader block:

```sh
yay-llm-review deinit
```

The user configuration is deliberately retained.

## Security boundaries

This is an advisory layer, not a sandbox or proof of safety. It does not inspect
source archives before `AURPreInstall`, execute shell code safely, or guarantee
that a model notices obfuscated behavior. A malicious AUR recipe may also target
bugs in `makepkg`, compilers, archive tools, or upstream source code. Review the
normal yay diff and build untrusted packages in an appropriately isolated
environment.
