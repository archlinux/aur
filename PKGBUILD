# Maintainer: Cliveptr <clivedd@tuta.io>
pkgname=cordless-bin
pkgver=2020_10_24
pkgrel=1
pkgdesc='Discord TUI client'
url='https://github.com/Bios-Marcel/cordless'
source=("$pkgname-$pkgver::https://github.com/Bios-Marcel/cordless/releases/download/${pkgver//_/-}/cordless_linux_64")
noextract=("$pkgname-$pkgver")
arch=('x86_64')
license=('BSD')
conflicts=('cordless')
provides=('cordless')
sha256sums=('SKIP')

package() {
	install -Dm755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/cordless"
}
