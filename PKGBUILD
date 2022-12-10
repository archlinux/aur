# Maintainer: Conner Will (ConnerWill) <conner.will@connerwill.com>

pkgname=yayfzf
pkgver=1.0.0
pkgrel=0
pkgdesc="AUR package fzf finder to search, install, remove, and manage packages using yay"
arch=("any")
url="https://github.com/ConnerWill/$pkgname"
license=("GPL")
depends=('bash' 'fzf' 'yay')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
# sha256sums=('')

package() {
  install -Dm775 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
