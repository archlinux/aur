# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Caio Novais <caionov08 at gmail dot com>

pkgname=pfetch
pkgver=1.9.4
pkgrel=1
pkgdesc="A pretty system information tool written in POSIX sh."
arch=('any')
url="https://github.com/Un1q32/$pkgname"
license=('MIT')
provides=("$pkgname")
conflicts=('pfetch-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('204e18105a138f9133e7d21c80dd079dcfe226237bc7c224711ae7b86b272c5a')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/pfetch" "$pkgdir/usr/bin/pfetch"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
