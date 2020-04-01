# Maintainer: Caio Novais <caionov08 at gmail dot com>
pkgname=pfetch
pkgver=0.6.0
pkgrel=1
pkgdesc="A pretty system information tool written in POSIX sh."
arch=('any')
url="https://github.com/dylanaraps/$pkgname"
license=('MIT')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dylanaraps/$pkgname/archive/$pkgver.tar.gz")
md5sums=('934e54f1bad59bc53cd97bd799ed830c')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/pfetch" "$pkgdir/usr/bin/pfetch"
}
