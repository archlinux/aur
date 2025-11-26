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
pacman -Ql saveoursecrets-bin
```

And then to uninstall:

```
sudo pacman -R saveoursecrets-bin
```

To publish, update `.SRCINFO`:

```
makepkg --printsrcinfo > .SRCINFO
```

And then commit your changes and run `./aur-push.sh`.

If ssh fails due to public key denied run: `ssh aur-sos` and enter the private key password and try again.
