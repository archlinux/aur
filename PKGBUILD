# Maintainer: mahkoh
# Contributor: goetzc
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: grimi

pkgname=xcursor-breeze5
epoch=1
pkgver=5.27.6
pkgrel=1
pkgdesc="KDE Plasma 5 'Breeze' cursor theme."
arch=('any')
url="https://kde.org/plasma-desktop"
license=('GPL')
source=("http://download.kde.org/stable/plasma/${pkgver}/breeze-${pkgver}.tar.xz")

package() {
  install -dm755 "$pkgdir"/usr/share/icons/
  cp -r "$srcdir"/breeze-${pkgver}/cursors/Breeze/Breeze/           "$pkgdir"/usr/share/icons/Breeze5
  cp -r "$srcdir"/breeze-${pkgver}/cursors/Breeze_Snow/Breeze_Snow/ "$pkgdir"/usr/share/icons/Breeze5_Snow
}

sha256sums=('5d9a8d7e5b061ce4183c4f842b0e82e6132b6c8e7ebc2c1d579baa066ffa6c6c')
