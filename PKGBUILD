# Maintainer: M0Rf30
# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=makepkg-unreal
pkgver=0.2
pkgrel=1
pkgdesc="Some shell functions to ease the installation of various Unreal games."
arch=(any)
url="http://aur.archlinux.org/packages.php?ID=26545"
license=('custom') # Is a license applicable to this crap at all?
conflicts=(makepkg-lib-unreal)
depends=(xdelta)
source=(unreal.sh)

package() {
    cd "$srcdir"
    install --mode=644 -D -- unreal.sh \
            "$pkgdir/usr/lib/makepkg/unreal.sh"
}

md5sums=('e6e0b08d1981f2a8c0c254fc63a71e1e')
