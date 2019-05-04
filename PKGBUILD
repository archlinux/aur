# $Id: PKGBUILD 274825 2017-12-19 00:52:45Z anatolik $
# Maintainer: Tim Liou <wheatdog at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=gcc-docs
pkgver=9.1.0
pkgrel=1
pkgdesc="Set of HTML documentation for GCC"
arch=('any')
url="http://gcc.gnu.org"
license=('GPL')
depends=()
options=('docs' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/gcc-html.tar.gz")
sha256sums=('3558b4ba414b7c20e73e3a56a1d38837da06b28665e3264e0721f3a7d150dec8')

package() {
  cd "$srcdir/gcc"
  install -d "$pkgdir/usr/share/doc/gcc"
  cp -rf * "$pkgdir/usr/share/doc/gcc"
}
