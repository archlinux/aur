# AccuralAI Meta-Package

This is the meta-package for the complete AccuralAI ecosystem. It provides convenient installation options for all AccuralAI components.

## Installation

```bash
# Install complete ecosystem
pip install accuralai[all]

# Install core components only
pip install accuralai

# Install with specific backends
pip install accuralai[backends]

# Install minimal setup
pip install accuralai[minimal]
```

## What's Included

### Core Components (installed by default)
- `accuralai-core` - Orchestration nucleus
- `accuralai-canonicalize` - Canonicalization utilities
- `accuralai-cache` - Caching providers
- `accuralai-router` - Routing strategies
- `accuralai-validator` - Validation plugins

### Optional Components
- `accuralai-ollama` - Ollama backend adapter
- `accuralai-google` - Google GenAI backend adapter

## Individual Package Installation

You can also install individual packages directly:

```bash
pip install accuralai-core
pip install accuralai-cache
pip install accuralai-canonicalize
# etc.
```

## Development

For development, install with dev dependencies:

```bash
pip install accuralai[dev]
```

## Links

- [Documentation](https://github.com/AccuralAI/AccuralAI)
- [Individual Packages](https://github.com/AccuralAI)
- [Issues](https://github.com/AccuralAI/AccuralAI/issues)
