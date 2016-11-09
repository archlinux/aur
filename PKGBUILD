# Maintainer: Pablo Lezaeta <prflr88 (arroba) gmail (dot) com>

pkgname=mint-backgrounds-xfce
pkgver=2016.11.05
pkgrel=1
pkgdesc="Linux Mint Xfce background"
arch=("any")
url="http://www.linuxmint.com"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.gz")

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/share/backgrounds/xfce/"
	cp -dpr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/usr/share/xfce4/backdrops/"*.png "${pkgdir}/usr/share/backgrounds/xfce/"
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"
	cp -dpr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/debian/changelog" "${pkgdir}/usr/share/doc/${pkgname}/"
	cp -dpr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/debian/copyright" "${pkgdir}/usr/share/doc/${pkgname}/"
}
md5sums=('144b64d0c526b9d75a284b469de37b25')
