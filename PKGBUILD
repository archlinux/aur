# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.25.0
pkgrel=1
pkgdesc='SCons-like build system that use python as a front-end language and Ninja as a building backend'
url='http://mesonbuild.com/'
arch=(any)
depends=(python ninja)
license=(Apache)
source=(https://github.com/jpakkane/meson/archive/$pkgver.zip)
sha1sums=('4439ebf44223204cf6a2fc4101a81cd20bc0dc81')

package() {
  cd meson-$pkgver
  ./install_meson.py --prefix /usr --destdir "$pkgdir"
}
