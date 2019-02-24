# $Id: PKGBUILD 274825 2017-12-19 00:52:45Z anatolik $
# Maintainer: Tim Liou <wheatdog at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=gcc-docs
pkgver=8.3.0
pkgrel=1
pkgdesc="Set of HTML documentation for GCC"
arch=('any')
url="http://gcc.gnu.org"
license=('GPL')
depends=()
options=('docs' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/gcc-html.tar.gz")
sha256sums=('db8bcc0594d92917e2110d2dea8d7d6639559943f07fa160bb03b1fe8081e9d7')

package() {
  cd "$srcdir/gcc"
  install -d "$pkgdir/usr/share/doc/gcc"
  cp -rf * "$pkgdir/usr/share/doc/gcc"
}
