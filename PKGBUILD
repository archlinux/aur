# Maintainer: BlackCatDev

pkgname=brcm4354-firmware
pkgver=1.0
pkgrel=2
pkgdesc='Firmware for AM7256/BRCM4354 WIFI/BT module'
arch=('any')
url="https://github.com/BlackCatDevel0per/${pkgname}"

gzdir="${pkgname}-${pkgver}"

source=(
"${url}/archive/refs/tags/${pkgver}.tar.gz"
)
md5sums=(
'b77e4b639374339f961b9755cf799bfe'
)

package() {
	tar \
		--extract \
		--file ${pkgver}.tar.gz \
		--directory "${pkgdir}" \
	&& mv ${gzdir}/* ${pkgdir} \
	&& rm -R ${gzdir}
} 
