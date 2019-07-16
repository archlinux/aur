# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.19.1
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
sha512sums=('9c62072aed2d795fec48f717dc2305a3b69da1a5100930a3d28d52b41baf5e8ab0b98db2d8750a2c5383523e7e1867c2f62dc24042efc2d6047382612472ee5b')
install="${pkgname}.install"

package() {
	install -Dpm755 "${_srcimage}" "${pkgdir}/opt/${pkgname}/${_destimage}"
	#install -d "${pkgdir}/usr/local/bin"
	#ln -s "../../../opt/${pkgname}/${_destimage}" "${pkgdir}/usr/local/bin/criptext"
}

