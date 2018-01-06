# $Id: PKGBUILD 274825 2017-12-19 00:52:45Z anatolik $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=gcc-docs
pkgver=7.2.0
pkgrel=1
pkgdesc="Set of HTML documentation for GCC"
arch=('any')
url="http://gcc.gnu.org"
license=('GPL')
depends=()
options=('docs' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/gcc-html.tar.gz")
sha256sums=('4ec2de3228a62dd7f3fbb1d75e03d630afbee8059ae2691dc2bf6967d547a08d')

package() {
  cd "$srcdir/gcc"
  install -d "$pkgdir/usr/share/doc/gcc"
  cp -rf * "$pkgdir/usr/share/doc/gcc"
}
