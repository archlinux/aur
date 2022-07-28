# Maintainer: BlackCatDev

pkgname=brcm4354-firmware
pkgver=main_2.0
pkgrel=3
pkgdesc='Firmware for AM7256/BRCM4354 WIFI/BT module'
arch=('any')
url="https://github.com/BlackCatDevel0per/${pkgname}"

gzdir="${pkgname}-${pkgver}"
gzfirm="${pkgver}.tar.gz"

source=(
"${url}/archive/refs/tags/${gzfirm}"
)
md5sums=(
'f10f6e1a65489cafe84cd71125240911'
)

package() {
	tar \
		--extract \
		--file ${gzfirm} \
		--directory "${pkgdir}" \
	&& mv ${gzdir}/* ${pkgdir} \
	&& rm -R ${gzdir}
} 
