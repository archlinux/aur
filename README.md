# pcw-cli AUR package

This directory contains the Arch Linux AUR packaging files for `pcw-cli`.

## Git hook setup

The repository keeps its `pre-commit` hook in the repository root so it does
not need a hooks subdirectory. Configure Git to use the repository root for
hooks:

```sh
git config core.hooksPath .git/../
```

The hook regenerates and stages `.SRCINFO` before every commit:

```sh
./make-info
git add .SRCINFO
```

The Git configuration is local to each clone, so run the setup command once
after cloning the repository.