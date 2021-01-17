# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=xfce4-composite-editor
_pkgname=Xfwm4CompositeEditor
pkgver=0.2.2
pkgrel=1
pkgdesc="A simple composite manager for xfce4"
arch=(i686 x86_64)
url=https://github.com/KeithDHedger/Xfwm4CompositeEditor
license=(GPL3)
depends=(gtk2 xfwm4)
source=(https://github.com/KeithDHedger/Xfwm4CompositeEditor/archive/$pkgname-$pkgver.tar.gz)
sha256sums=('9b58096ae5c0ce2c66e7b6fad1781824421ce0e5f65012117231c308c801f93a')

build() {
  cd $_pkgname-$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
