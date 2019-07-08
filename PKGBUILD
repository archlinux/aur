# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.18.0
pkgrel=2
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
sha512sums=('9a1e5cfaa52c62fee177c1aded9defd77a6926a24f40100f52d1c1d4f6402bb9864ef8b402416847a5889b652c52bfdaeebc817f236a495e39b08b95f0805177')
install="${pkgname}.install"

package() {
	install -Dpm755 "${_srcimage}" "${pkgdir}/opt/${pkgname}/${_destimage}"
	#install -d "${pkgdir}/usr/local/bin"
	#ln -s "../../../opt/${pkgname}/${_destimage}" "${pkgdir}/usr/local/bin/criptext"
}

