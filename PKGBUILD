# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Caio Novais <caionov08 at gmail dot com>

pkgname=pfetch
pkgver=0.6.0
pkgrel=3
pkgdesc="A pretty system information tool written in POSIX sh."
arch=('any')
url="https://github.com/dylanaraps/$pkgname"
license=('MIT')
provides=("$pkgname")
conflicts=('pfetch-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('300f6f44f9306df4f438227a6f35bd54f50e477b950a45d63656f7c460cfc30a8b44ebdb3d5fdcf1e808e3b8e8e69e14088ff73a5da4485abf694893f2cc53f3')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/pfetch" "$pkgdir/usr/bin/pfetch"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
