# Maintainer: ALIBI Ghazi <123127137+GhaziAlibi@users.noreply.github.com>
pkgname=clean-history-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="Clean multiline entries from shell history files (binary release)"
arch=('x86_64')
url="https://github.com/GhaziAlibi/clean-history"
license=('MIT')
provides=('clean-history')
conflicts=('clean-history')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GhaziAlibi/clean-history/releases/download/v$pkgver/clean-history-linux-x86_64.tar.gz")
sha256sums=('c13e498406e554432dfd129834e23475fc74ac3df459e536449daf37dda30a86')

package() {
    install -Dm755 "clean-history" "$pkgdir/usr/bin/clean-history"
}
