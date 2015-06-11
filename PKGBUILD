# $Id: PKGBUILD,v 1.6 2006/05/22 17:38:11 uid1014 Exp $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=gkrellm-xkb
pkgver=1.05
pkgrel=2
pkgdesc="A gkrellm2 plugin which displays a small flag based on active keyboard layout."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gkrellm')
url="http://sweb.cz/tripie/gkrellm/xkb"
source=("http://sweb.cz/tripie/gkrellm/xkb/dist/$pkgname-$pkgver.tar.gz")
md5sums=('4342cee10c839179f6126658a7b29321')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 xkb.so "$pkgdir/usr/lib/gkrellm2/plugins/xkb.so"
}
# vim: ts=2: ft=sh
