# Maintainer: goetzc
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: grimi

pkgname=xcursor-breeze
epoch=1
pkgver=5.22.5
pkgrel=1
pkgdesc="KDE Plasma 5 'Breeze' cursor theme. This package is for usage in non-KDE Plasma desktops."
arch=('any')
url="https://kde.org/plasma-desktop"
license=('GPL')
depends=('libxcursor')
conflicts=('breeze')
source=("http://download.kde.org/stable/plasma/${pkgver}/breeze-${pkgver}.tar.xz")

package() {
  install -dm755 "$pkgdir"/usr/share/icons/
  cp -r "$srcdir"/breeze-${pkgver}/cursors/Breeze/Breeze/           "$pkgdir"/usr/share/icons/
  cp -r "$srcdir"/breeze-${pkgver}/cursors/Breeze_Snow/Breeze_Snow/ "$pkgdir"/usr/share/icons/
}

sha256sums=('e3fc4ca04cc0df694ab90fa4f9e8ca72512adae2c0320ce3f9702dddda029426')
