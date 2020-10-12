1. edit `PKGBUILD` file
update the version number `pkgver=`

2. update integrity checksum
```
$ makepkg -g
```
copy the output and paste it in `PKGBUILD` file, eg.
```
md5sums=('output')
```
source: https://wiki.archlinux.org/index.php/PKGBUILD#Integrity

3. sanity check
```
$ namcap PKGBUILD
$ makepkg
$ namcap <package_name>.pkg.tar.xz
```
source: https://wiki.archlinux.org/index.php/Creating_packages#Checking_package_sanity

4. generate `.SRCINFO`
```
$ makepkg --printsrcinfo > .SRCINFO
```
source: https://wiki.archlinux.org/index.php/.SRCINFO
