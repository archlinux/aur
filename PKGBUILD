# Maintainer: BlackCatDev

pkgname=brcm43xx-firmware
pkgver=latest
pkgrel=1
pkgdesc='Firmware for brcm43xx modules'
arch=('any')
url="https://github.com/BlackCatDevel0per/${pkgname}"

gzdir="${pkgname}-${pkgver}"
gzfirm="${pkgver}.tar.gz"

source=(
"${url}/archive/refs/tags/${gzfirm}"
)
md5sums=(
'c8cc62696849de8028f0ef81c9bec26d'
)

package() {
	tar \
		--extract \
		--file ${gzfirm} \
		--directory "${pkgdir}" \
	&& mv ${gzdir}/* ${pkgdir} \
	&& rm -R ${gzdir}
} 
