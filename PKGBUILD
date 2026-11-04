# Maintainer: Shisones <shisones745@proton.me>

pkgname=waka-bin
pkgver=0.1.3
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
sha256sums=('974f5c98eb76abd78032847b9978a195340cc1df8233716447f2b342c93b214d')

package() {
    install -Dm755 "$srcdir/waka" "$pkgdir/usr/bin/waka"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
