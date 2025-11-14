# Maintainer: ALIBI Ghazi <123127137+GhaziAlibi@users.noreply.github.com>
pkgname=clean-history-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Clean multiline entries from shell history files (binary release)"
arch=('x86_64')
url="https://github.com/GhaziAlibi/clean-history"
license=('MIT')
provides=('clean-history')
conflicts=('clean-history')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GhaziAlibi/clean-history/releases/download/v$pkgver/clean-history-linux-x86_64.tar.gz")
sha256sums=('47c8cd7a98c843a861548c0befa2c32fb2d3b375bb031336026dc29446c01f6c')

package() {
    install -Dm755 "clean-history" "$pkgdir/usr/bin/clean-history"
}
