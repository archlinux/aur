# AURMOR

An AUR helper written in C.

## MANUAL INSTALLATION

```
$ git clone https://github.com/carlyle-felix/aurmor.git
$ cd aurmor
$ make
# make install
```

## USAGE

| OPERATION | DESCRIPTION |
| ------- | ----------- |
| `aurmor -u` | update all packages. |
| `aurmor -U [package(s)]`| force update package(s)|
| `aurmor -i [package(s)]` | install from [AUR](https://aur.archlinux.org/). |
| `aurmor -x [git clone URL]` | clone and install from a specified git repo.|
| `aumor -r [package(s)]` | uninstall package(s). |
| `aurmor -c` | delete directories found in ~/.aur directory but not found in pacman's list of installed AUR packages. |
| `aurmor -r [package(s)]` | uninstall specified packages. caveat: name must match the one found in `aurmor -q` |
| `aurmor -q` | list installed AUR packages |
| `aurmor -h` | help |
| `aurmor -s` | search package on [AUR](https://aur.archlinux.org/) |

## NOTES

- The uninstall function requires the name of the target package as it is found in the output of `aurmor -q`
- Packages are built with `OPTIONS=-debug`.