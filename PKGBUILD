# Maintainer: metaanon [at] mailbox dotorg  
# Maintainer: strahe
# Maintainer: tyjak

pkgname=binance
pkgver=1.13.1
pkgrel=1
pkgdesc="The Binance desktop application"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('unknown')
depends=('electron')
source=('https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb')
sha256sums=('100a13f9e3d89ee7af28e20adc6f1cab33d32752326fb96ca7e177837cb7db82')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir "${pkgdir}/usr/bin"
    ln -s /opt/Binance/binance "${pkgdir}/usr/bin/binance"
}
