# git-pair
Pair Programming git Management Tool

# Installation

## Arch Linux based

[Install from the AUR](https://aur.archlinux.org/packages/git-pair/)

## Build from source

```sh
$ gcc pair.c -o git-pair
```

# Usage

Run `./git-pair help` to see available commands.

<hr>

## Initialize your workspace by adding and selecting git authors

```sh
$ ./git-pair init
``` 

## To select or change the current author/co-author, execute without parameters

```sh
$ ./git-pair
```

## Add new authors

```sh
$ ./git-pair add
```

