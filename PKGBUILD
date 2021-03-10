# Maintainer: metaanon [at] mailbox dotorg  
pkgname=binance-electron
pkgver=1.13.0
pkgrel=2
pkgdesc="Binance Electron desktop application."
arch=('x86_64')
url="https://binance.com"
license=('MIT')
install=${pkgname}.install
source=("$pkgname-$pkgver.deb::https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb")
sha256sums=('6266981fc73a7b2b7b651af864403faa4d8cb85c8dd1e227a238fcc56e85c228')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}
