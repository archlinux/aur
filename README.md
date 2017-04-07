# Update package

* Update packge version in PKGBUILD 
* Generate new checksums with  

```$ updpkgsums```

* Test install

```makepkg --install```

* Update .SRCINFO 

```makepkg --printsrcinfo > .SRCINFO```
