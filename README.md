# git-octopus for Archlinux

## Installation

### Manual

```shell
git clone <git repo> git-octopus
cd git-octopus
makepkg $i
pacman -U <package>
```

### Via AUR

With your favorite package manager integrating AUR, like [yay](https://github.com/Jguer/yay) :

```shell
yay -S git-octopus
```

## Gotchas

Some binaries like `git-merge-index`, `git-merge-onefile` and `git-sh-setup` are located in `/usr/lib/git-core`. You may need to add this path to your `PATH` to make git-octopus work as expected. Alternative is to make symlinks to `/usr/local/bin` for example.
