# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.26.0
pkgrel=1
pkgdesc='SCons-like build system that use python as a front-end language and Ninja as a building backend'
url='http://mesonbuild.com/'
arch=(any)
depends=(python ninja)
license=(Apache)
source=(https://github.com/jpakkane/meson/archive/$pkgver.zip)
sha1sums=('c6be2225f01ee50ba5fbfa81ff08e240c64838e2')

package() {
  cd meson-$pkgver
  ./install_meson.py --prefix /usr --destdir "$pkgdir"
}
