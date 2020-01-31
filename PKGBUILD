# Maintainer: Caio Novais <caionov08 at protonmail dot com>
pkgname=pfetch
pkgver=0.4.0
pkgrel=1
pkgdesc="A pretty system information tool written in POSIX sh."
arch=('any')
url="https://github.com/dylanaraps/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dylanaraps/$pkgname/archive/$pkgver.tar.gz")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/pfetch" "$pkgdir/usr/bin/pfetch"
}
