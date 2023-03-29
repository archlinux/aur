# Maintainer: Conner Will (DampSock) <conner.will@connerwill.com>

pkgname=yayfzf
pkgver=1.0.2
pkgrel=0
pkgdesc="AUR package fzf finder to search, install, remove, and manage packages using yay"
arch=("any")
url="https://github.com/ConnerWill/$pkgname"
license=("GPL")
depends=('bash' 'fzf' 'yay')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm775 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
