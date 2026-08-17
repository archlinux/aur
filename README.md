
## What does update-mirrorlist-archive do

1. get current repo list
2. find the last updated date for each repo
3. read the template string from /etc/pacman-archive.toml
4. modify the url with last update date
5. save to /var/lib/pacman-archive/repo.mirrorlist

## pacman-archive.toml

if the auto generated url is not exist you can

1. add correct url in /etc/pacman-archive.toml

```toml
[core]
Server = [
    "https://archive.archlinux.org/repos/$year/$month/$day/$repo/os/$arch",
    "https://archive.archlinux.org/repos/2026/08/17/$repo/os/$arch"
]
```

2. run

```sh
update-mirrorlist-archive
```
