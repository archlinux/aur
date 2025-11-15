# Maintainer: ALIBI Ghazi <123127137+GhaziAlibi@users.noreply.github.com>
pkgname=clean-history-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Clean multiline entries from shell history files (binary release)"
arch=('x86_64')
url="https://github.com/GhaziAlibi/clean-history"
license=('MIT')
provides=('clean-history')
conflicts=('clean-history')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GhaziAlibi/clean-history/releases/download/v$pkgver/clean-history-linux-x86_64.tar.gz")
sha256sums=('e4efd68ad915839c1cdca8cdec538ff68d68e9b1ca85bd1bc9dab6497e292966')

package() {
    install -Dm755 "clean-history" "$pkgdir/usr/bin/clean-history"
}
