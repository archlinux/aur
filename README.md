# !!! VIBE CODED WITH GPT4.1 !!!

# CodeLLM Arch Linux PKGBUILD

This repository maintains the PKGBUILD and automation for the [CodeLLM](https://codellm.abacus.ai) AUR package.

## Automatic Updates

A GitHub Actions workflow checks for new releases and updates the AUR package automatically.

## Maintainer Setup

- Add your AUR SSH private key as a secret named `AUR_SSH_PRIVATE_KEY`.
- The workflow will push changes to the AUR when a new release is detected.

## Manual Update

You can also trigger the workflow manually from the Actions tab.