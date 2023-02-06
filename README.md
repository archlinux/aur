# aur sentences-bin

## update package

- edit `PKGBUILD`
- download latest binary from
  [github](https://github.com/neurosnap/sentences/releases)

```
sha512sum sentences_linux-amd64.tar.gz
makepkg --printsrcinfo > .SRCINFO
```

Push to remotes
