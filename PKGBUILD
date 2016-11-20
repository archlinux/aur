# Maintainer: goetzc
# Contributor: grimi

pkgname=xcursor-breeze
epoch=1
pkgver=5.8
_pkgver=5.8.0
pkgrel=1
pkgdesc="Breeze cursor theme (KDE Plasma 5). This package is for usage in non-KDE Plasma desktops."
arch=('any')
url="https://www.kde.org"
license=('GPL')
depends=('libxcursor')
conflicts=('breeze')
source=("breeze-cursors-${pkgver}.tgz::http://download.kde.org/stable/plasma/${_pkgver}/breeze-${_pkgver}.tar.xz")
sha1sums=('cd18191efc2059760eb04e95c874d58ecb97d599')

package() {
  install -dm755 "$pkgdir"/usr/share/icons/
  cp -r "$srcdir"/breeze-${_pkgver}/cursors/Breeze/Breeze/           "$pkgdir"/usr/share/icons/
  cp -r "$srcdir"/breeze-${_pkgver}/cursors/Breeze_Snow/Breeze_Snow/ "$pkgdir"/usr/share/icons/
}
