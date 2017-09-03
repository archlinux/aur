# Maintainer: deadhead <deadhead3492@gmail.com>
pkgname=fetchpkg
pkgver=0.3
pkgrel=7
pkgdesc="CLI frontend for pacman / AUR"
arch=('any')
url="https://github.com/deadhead420/fetchpkg"
license=('GPL')
depends=('curl')
optdepends=('fetchmirrors: update and rank pacman mirrorlist')
source=(git+https://github.com/deadhead420/fetchpkg.git)
md5sums=('SKIP')

package() {
  cd "${srcdir}"/fetchpkg
  install -Dm755 fetchpkg "$pkgdir"/usr/bin/fetchpkg
  install -Dm644 fetchpkg.conf "$pkgdir"/etc/fetchpkg.conf
  install -Dm644 fetchpkg.png "$pkgdir"/usr/share/pixmaps/fetchpkg.png
  install -Dm644 fetchpkg.desktop "$pkgdir"/usr/share/applications/fetchpkg.desktop
}

# vim:set ts=2 sw=2 et:
