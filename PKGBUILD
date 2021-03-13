# Maintainer: Tyjak <dev@tyjak.net>
pkgname=binance-deb
pkgver=1.13.1
pkgrel=1
pkgdesc="The Binance Desktop Application"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('unknown')
conflicts=('binance' 'binance-electron')
depends=()
optdepends=()
source=("https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb")
sha256sums=('100a13f9e3d89ee7af28e20adc6f1cab33d32752326fb96ca7e177837cb7db82')

package() {
    bsdtar -xJf data.tar.xz -C "$pkgdir"
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/Binance/binance $pkgdir/usr/bin/binance
}
