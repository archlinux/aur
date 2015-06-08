pkgname=makepkg-asroot
pkgver=0
pkgrel=1
pkgdesc="Patch makepkg to allow --asroot"
license=('GPL')
arch=('any')
url="https://github.com/archlinuxfr/yaourt/issues/67"
depends=('pacman')
source=("makepkg-asroot.patch")
install=(makepkg-asroot.install)
md5sums=('SKIP')

package() {
  install -d "$pkgdir"/usr/share/makepkg-asroot
  install -m644 *.patch "$pkgdir"/usr/share/makepkg-asroot
}

