# Maintainer: ALIBI Ghazi <123127137+GhaziAlibi@users.noreply.github.com>
pkgname=clean-history-bin
pkgver=1.0
pkgrel=1
pkgdesc="Clean multiline entries from shell history files (binary release)"
arch=('x86_64')
url="https://github.com/GhaziAlibi/clean-history"
license=('MIT')
provides=('clean-history')
conflicts=('clean-history')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GhaziAlibi/clean-history/releases/download/v$pkgver/clean-history-linux-x86_64.tar.gz")
sha256sums=('2c9bf98be43dd4d548e98c4b536b0be8585d64c8b213400a6b82f3f358a7ce70')

package() {
    install -Dm755 "clean-history" "$pkgdir/usr/bin/clean-history"
}
