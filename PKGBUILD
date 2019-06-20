# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.17.19
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
sha512sums=('a21c4c55480f4318542d15b674f8fb0976238b2d3a23096e125e247068cc04a3ae03aa525c0373dbde112e632a2527f4d7705670745c6bd9cdf0c025d9337eb8')
install="${pkgname}.install"

package() {
	install -Dpm755 "${_srcimage}" "${pkgdir}/opt/${pkgname}/${_destimage}"
	#install -d "${pkgdir}/usr/local/bin"
	#ln -s "../../../opt/${pkgname}/${_destimage}" "${pkgdir}/usr/local/bin/criptext"
}

