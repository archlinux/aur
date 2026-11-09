# Maintainer: Shisones <shisones745@proton.me>

pkgname=waka-bin
pkgver=0.1.6
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
sha256sums=('84e15d0148591a1b156e1ced8ff480eaac33297a20f20cb2ba1f53d71130df0a')

package() {
    install -Dm755 "$srcdir/waka" "$pkgdir/usr/bin/waka"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
