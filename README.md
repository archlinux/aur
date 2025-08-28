# zedless-git

An AUR package for [Zedless](https://github.com/zedless-editor/zedless) using the latest commit to the default branch (`main`).

## Install package

```sh
make install
```

## Update package

1. Make changes
1. Update `pkgrel` if needed
1. `make srcinfo` to update `.SRCINFO`
1. `make clean` to remove all source and built files
1. `make fetch` to fetch new source files
1. `make test` to build and test, with both `cargo` and `namcap`
1. `make clean` to remove all source and built files again
1. `git add`, `commit` and `push` your changes
