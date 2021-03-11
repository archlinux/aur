# Maintainer: metaanon [at] mailbox dotorg  
pkgname=binance-electron
pkgver=1.13.1
pkgrel=1
pkgdesc="Binance Electron desktop application."
arch=('x86_64')
url="https://binance.com"
license=('MIT')
install=${pkgname}.install
source=("$pkgname-$pkgver.deb::https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb")
sha256sums=('100a13f9e3d89ee7af28e20adc6f1cab33d32752326fb96ca7e177837cb7db82')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}
