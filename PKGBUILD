# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.24.0
pkgrel=1
pkgdesc='SCons-like build system that use python as a front-end language and Ninja as a building backend'
url='https://jpakkane.github.io/meson/'
arch=(any)
depends=(python ninja)
license=(Apache)
source=(https://github.com/jpakkane/meson/archive/$pkgver.zip)
sha1sums=('858522b19693abc3dda7d403407e8b3c050397ac')

package() {
  cd meson-$pkgver
  ./install_meson.py --prefix /usr --destdir "$pkgdir"
}
