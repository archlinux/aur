# Maintainer: Shisones <shisones745@proton.me>

pkgname=waka-bin
pkgver=0.1.2
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
sha256sums=('59a0f54473236d374e593cc426bbf1fd9709a883929c7d59b50f65248357a429')

package() {
    install -Dm755 "$srcdir/waka" "$pkgdir/usr/bin/waka"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
