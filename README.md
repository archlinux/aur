# Arch AUR (binary release)

AUR arch installer for the [saveoursecrets](https://saveoursecrets.com) secure password manager and wallet.

## Developer

```
rm -f saveoursecrets.tgz && makepkg --check -f
```

If that works you can install with:

```
makepkg -si
```

Verify the installation:

```
pacman -Ql saveoursecrets
```

And then to unsinstall:

```
sudo pacman -R saveoursecrets
```

To publish, update `.SRCINFO`:

```
makepkg --printsrcinfo > .SRCINFO
```

And then run `./aur-push.sh`.
