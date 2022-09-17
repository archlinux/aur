# Maintainer: mib <mib@mib.dev>
pkgname=lightburn-bin
pkgver=1.2.01
pkgrel=1
pkgdesc="A layout, editing, and control software for lastercutters."
arch=('x86_64')
url="https://lightburnsoftware.com"
license=('unknown')
depends=('qt5-multimedia' 'qt5-serialport')
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/LightBurnSoftware/deployment/releases/download/$pkgver/LightBurn-Linux64-v$pkgver.7z")
sha256sums=('57886cc328fa2f2ea29da2251e5c69bc447c6abd3dc19e7901dfb11f819b1dfb')

package() {
    install -Dm 755 "$srcdir/LightBurn/LightBurn" "$pkgdir/usr/bin/lightburn"
}
