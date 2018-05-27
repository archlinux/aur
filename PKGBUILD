# $Id: PKGBUILD 274825 2017-12-19 00:52:45Z anatolik $
# Maintainer: Tim Liou <wheatdog at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=gcc-docs
pkgver=8.1.0
pkgrel=1
pkgdesc="Set of HTML documentation for GCC"
arch=('any')
url="http://gcc.gnu.org"
license=('GPL')
depends=()
options=('docs' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/gcc-html.tar.gz")
sha256sums=('91a501d95e548a97b774508f67d89463b68c12c15ca2049bbb2a6fc717b9748f')

package() {
  cd "$srcdir/gcc"
  install -d "$pkgdir/usr/share/doc/gcc"
  cp -rf * "$pkgdir/usr/share/doc/gcc"
}
