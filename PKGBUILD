# Maintainer: ALIBI Ghazi <123127137+GhaziAlibi@users.noreply.github.com>
pkgname=clean-history-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Clean multiline entries from shell history files (binary release)"
arch=('x86_64')
url="https://github.com/GhaziAlibi/clean-history"
license=('MIT')
provides=('clean-history')
conflicts=('clean-history')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GhaziAlibi/clean-history/releases/download/v$pkgver/clean-history-linux-x86_64.tar.gz")
sha256sums=('7ba4b9d9fa7c3c2ac00d9ce27390cdfe5a4681b279677c75ebb0f6a7dfcf105e')

package() {
    install -Dm755 "clean-history" "$pkgdir/usr/bin/clean-history"
}
