# Maintainer: BlackCatDev

pkgname=brcm4354-firmware
pkgver=latest
pkgrel=5
pkgdesc='Firmware for AM7256/BRCM4354 WIFI/BT module'
arch=('any')
url="https://github.com/BlackCatDevel0per/${pkgname}"

gzdir="${pkgname}-${pkgver}"
gzfirm="${pkgver}.tar.gz"

source=(
"${url}/archive/refs/tags/${gzfirm}"
)
md5sums=(
'd8cd7bf6268993311a79837efe75e4ab'
)

package() {
	tar \
		--extract \
		--file $gzfirm \
		--directory $srcdir \
	&& cp -R $gzdir/* $pkgdir
	}
