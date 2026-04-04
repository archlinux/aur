# bitnet-git

This repository contains the PKGBUILD for installing bitnet.cpp (the official inference framework for 1-bit LLMs by Microsoft) on Arch Linux. The package bitnet-git tracks the main branch of the upstream Git repository.

## Installation

### Prerequisites

Ensure you have the Arch Linux `base-devel` package group installed, which provides necessary build tools like `makepkg`.

```bash
sudo pacman -S base-devel git
```

### Build and Install with makepkg

1.  Clone this repository containing the PKGBUILD:
    ```bash
    git clone <your_aur_repo_url>/bitnet-git.git
    cd bitnet-git
    ```

2.  Build the package. The `-s` flag automatically resolves and installs dependencies (like `cmake` and `clang`) using pacman:
    ```bash
    makepkg -si
    ```

### Using an AUR Helper (Recommended)

If this package is published to the AUR, you can install it using your preferred AUR helper (e.g., `yay` or `paru`):

```bash
yay -S bitnet-git
```

## Features

This package ensures you receive the latest improvements from the upstream bitnet.cpp framework, optimized for local execution of 1.58-bit models with minimal energy consumption and memory footprint.
