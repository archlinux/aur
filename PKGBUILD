# Maintainer: Shisones <shisones745@proton.me>

pkgname=waka-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A front-end for libalpm, inspired by nala (prebuilt binary)"
url="https://github.com/Shisones/Waka"
license=('GPL-3.0-only')
arch=('x86_64')
provides=('waka')
conflicts=('waka')
depends=('glibc' 'gcc-libs' 'pacman')
optdepends=('curl: for waka fetch')
source=("waka-$pkgver-x86_64.tar.gz::https://github.com/Shisones/Waka/releases/download/v$pkgver/waka-$pkgver-x86_64.tar.gz")
sha256sums=('0d7f5917e215e71fb1b9053379b44c4cb36a4634a000ea305606c1d21bcbf780')

package() {
    install -Dm755 "$srcdir/waka" "$pkgdir/usr/bin/waka"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
