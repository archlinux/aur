# ST Opinionated

[Simple Terminal](https://st.suckless.org/) with some Opinionated picked
patches.

## Quickstart

The easiest way to try st is get it from
[AUR](https://aur.archlinux.org/packages/st-opinionated/). If you use `yay`:

```
yay -S st-opinionated
```

## Usage

### Installation

You probably will not eventually get st through AUR, because to configurate st
requires you to modify the source code and re-compile it. The recommended way
is cloning this repository and run `make install`:

```bash
git clone https://github.com/fenprace/st-opinionated.git
cd st-opinionated
make install # Identical to run: makepkg -si
```

### Configuration

Almost all configurations of st are done in the `config.h`. I provide a general
`config.h` at the top-level folder, which will be used in compilation. Configure
it with your favourite text editor and run:

```bash
make clean install
```

## Picked Patches

| Patch | Version | Source |
|-------|---------|--------|
| [alpha](https://st.suckless.org/patches/alpha/) | 0.8.2 | https://st.suckless.org/patches/alpha/st-alpha-0.8.2.diff |
| [anysize](https://st.suckless.org/patches/anysize/) | 0.8.4 | https://st.suckless.org/patches/anysize/st-anysize-0.8.4.diff |
| [bold is not bright](https://st.suckless.org/patches/bold-is-not-bright/) | 20190127 | https://st.suckless.org/patches/bold-is-not-bright/st-bold-is-not-bright-20190127-3be4cf1.diff |
| [csi 22 23](https://st.suckless.org/patches/csi_22_23/) | 0.8.4 | https://st.suckless.org/patches/csi_22_23/st-csi_22_23-0.8.4.diff |
| [desktopentry](https://st.suckless.org/patches/desktopentry/) | 0.8.4 | https://st.suckless.org/patches/desktopentry/st-desktopentry-0.8.4.diff |
| [font2](https://st.suckless.org/patches/font2/) | 20190416 | https://st.suckless.org/patches/font2/st-font2-20190416-ba72400.diff |
| [ligatures](https://github.com/cog1to/st-ligatures) | alpha-20210824-0.8.4 | https://raw.githubusercontent.com/cog1to/st-ligatures/e31975933b5495e5ed031c54c7e331eae70d4f8e/0.8.4/st-ligatures-alpha-20210824-0.8.4.diff |

