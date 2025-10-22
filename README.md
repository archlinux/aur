= Caelestia GIF Manager (`caelestia-gif`)
A terminal user interface (TUI) written in C for managing GIFs (sessionGif and mediaGif) in the Caelestia shell environment.

== Introduction
Caelestia GIF Manager is a lightweight TUI tool designed to easily browse, preview and set GIF for your Caelestia shell session menu and media player. It supports thumbnail generation (using ImageMagick) and display previews directly in the Kitty terminal emulator. Use the `session` subcommand to select a session GIF quickly.

== Installation
=== Commands
There are many different ways to install Caelestia GIF Manager:
1. From AUR (Arch Linux)
```bash
yay -S caelestia-gif
# or
paru -S caelestia-gif
```
2. With the built-in Bash install script:
   - Using a single command (`curl`+`sh`): 
      - NOT IMPLEMENTED YET
      ```bash
       curl -sSL https://gitlab.com/gnoooo/caelestia-gif/-/raw/master/install.sh?ref_type=heads | sh
      ```

3. From source (manual compilation):
```bash
git clone https://gitlab.com/gnoooo/caelestia-gif.git
cd caelestia-gif
make
make install
```
=== (NOT IMPLEMENTED YET) What is `install.sh`?
The repository will soon contain an `install.sh` file. This file is a simple Bash script that automates the installation of Caelestia GIF Manager. It will:
- Clone the repository from GitLab
- And compile the source code using `make` and `make install`

=== What is `install.c`?
As you may have noticed, the repository contains an `install.c` file. This file is a simple C program that automates the configuration of Caelestia GIF Manager so the script runs perfectly. 

It will:
- Create the environment variable `CAELESTIA_GIF_DIR` if it does not exist. (which is useless because it is run in a subprocess, so it won't affect the parent shell...)
- Create a backup of your existing Caelestia shell configuration file (`~/.config/caelestia/shell.json`) if it exists. If not, it will create a default configuration file. And if the backup file already exists, it will not overwrite it.
- It will then modify the shell configuration file to include (or edit) the `sessionGif` (and after an update, the `mediaGif`) field to point to the current GIF (so, by default `~/Pictures/CaelestiaGifs/sessionGif/current/current.gif`).

== Usage
To run Caelestia GIF Manager, simply execute the following command in your terminal:

```bash
caelestia-gif [subcommand]
```

Where `[subcommand]` can be:
- `session`: Opens the TUI to manage session GIFs.
- `media`: Opens the TUI to manage media GIFs. (NOT IMPLEMENTED YET)
- `cli`: Command-line interface to set GIF directly without TUI. (NOT IMPLEMENTED YET)

For each subcommand, you can show help by adding the `-h` or `--help` and `-r` or `--regenerate` flags:

```bash
caelestia-gif session -h
```

`-r`, `--regenerate` flag forces the regeneration of thumbnails for all GIFs in the directory.

When in the TUI, you can navigate using the arrow keys, select a GIF with `Enter`, `o` to open the GIF file (useful if you are not using Kitty) and exit with `q`.

== Image directory placement
By default, Caelestia GIF Manager uses the following directory structure to store and manage GIFs:

```~/
└── Pictures/
    └── CaelestiaGifs/
        ├── sessionGif/
        │   ├── current/
        │   │   └── current.gif
        │   ├── thumbnails/
        │   └── [your_gif_folders]/
        └── mediaGif/
            ├── current/
            │   └── current.gif
            ├── thumbnails/
            └── [your_gif_folders]/
```

If you wish to change the default directory, don't use the env variable, it's not well implemented (yet?). Instead, you'll have to modify the source code and recompile it. (i'm sorry, i'll fix that later...)

If you're using Kitty (which is recommended), the Graphics Protocol will be used to display GIF preview. For this functionality, we have to generate thumbnails for each GIF using ImageMagick, because if not, the GIFs would be too large or too small to be displayed in the terminal. These images are stored in `$HOME/.cache/caelestia_gifs_thumb/sessionGif/` and `$HOME/.cache/caelestia_gifs_thumb/mediaGif/`.

These images are not generated each time, only when a new GIF is added to the directory.

== Incoming
- Media GIF management (`caelestia-gif media` subcommand)
- Command-line interface (`caelestia-gif cli` subcommand)
- Better environment variable support for custom directories
- Improved installation script
- Memory optimizations
- Segmentation of code into multiple files for better maintainability (because right now it's a mess)
