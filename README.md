# Cheatsheet for myself

Generate checksums:
```
makepkg -g
```

Build: 
```
makepkg
```

Generate .SRCINFO:
```
makepkg --printsrcinfo > .SRCINFO
```

To check if the generated package is correct: 
```
namcap PKGBUILD
namcap radioboat-0.1.0-1-x86_64.pkg.tar.zst
```