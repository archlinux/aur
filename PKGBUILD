# Maintainer: thenamesnano <adri_howell@protonmail.com>
pkgname=dayz-linux-cli-launcher
pkgver=0.5.3
pkgrel=1
pkgdesc="Launcher script for modded DayZ Standalone via Steam+Proton"
arch=('x86_64')
url="https://github.com/bastimeyer/dayz-linux-cli-launcher"
license=('MIT')
depends=('steam')
install=.INSTALL
source=('https://github.com/bastimeyer/dayz-linux-cli-launcher/archive/refs/tags/0.5.3.tar.gz')
sha512sums=('b2acacb0f42e2ae948a10cdc9c8cfe48e21fd88a0e13035d611405c509e309caf0df65eee3bae9b5cff64efb42b7f23210f635b82f9584a008e251d4183a5e20')

package() {
        install -Dm755 "$srcdir/$pkgname-$pkgver/dayz-launcher.sh" "$pkgdir/usr/bin/dayz-launcher"
}
