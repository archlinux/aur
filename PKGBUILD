# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.27.0
pkgrel=1
pkgdesc='SCons-like build system that use python as a front-end language and Ninja as a building backend'
url='http://mesonbuild.com/'
arch=(any)
depends=(python ninja)
license=(Apache)
source=(meson-$pkgver.zip::https://github.com/jpakkane/meson/archive/$pkgver.zip)
sha1sums=('f862c28b60dae1ff2be0d33a6260540f03336aa9')

package() {
  cd meson-$pkgver
  ./install_meson.py --prefix /usr --destdir "$pkgdir"
}
