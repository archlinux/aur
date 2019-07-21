# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.20.1
pkgrel=1
pkgdesc='Official Criptext encrypted email client'
arch=('x86_64')
url='https://criptext.com/'
license=('GPL2')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
_destimage="Criptext-latest.AppImage"
_srcimage="Criptext-${pkgver}.AppImage"
source=("https://cdn.criptext.com/Criptext-Email-Desktop/linux/${_srcimage}")
noextract=("${_srcimage}")
sha512sums=('2299d002761320323b9cad5b0bf979be4f5459716170803b7d46c9fd457126673d7e4eb433339d3db78c3bb38aa5d9cbe6ab3f39030abc0749b78b667505b07b')
install="${pkgname}.install"

package() {
	install -Dpm755 "${_srcimage}" "${pkgdir}/opt/${pkgname}/${_destimage}"
	#install -d "${pkgdir}/usr/local/bin"
	#ln -s "../../../opt/${pkgname}/${_destimage}" "${pkgdir}/usr/local/bin/criptext"
}

