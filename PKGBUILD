# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.28.0
pkgrel=1
pkgdesc='SCons-like build system that use python as a front-end language and Ninja as a building backend'
url='http://mesonbuild.com/'
arch=(any)
depends=(python ninja)
license=(Apache)
source=(meson-$pkgver.zip::https://github.com/jpakkane/meson/archive/$pkgver.zip)
sha1sums=('97e200ecfd94d69920759d7673c39b90cb9d7107')

package() {
  cd meson-$pkgver
  ./install_meson.py --prefix /usr --destdir "$pkgdir"
}
