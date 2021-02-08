# Maintainer: Amr Okasha <amradel55 at gmail dot com>
# Contributer: Knight <anonymousknight96 at gmail dot com>
pkgname=digilent.adept.utilities
pkgver=2.4.1
pkgrel=1
pkgdesc="Digilent Adept Utilities."
arch=('i686' 'x86_64')
url="https://reference.digilentinc.com/digilent_adept_2"
license=('custom')
depends=('digilent.adept.runtime>=2.21.2')
options=('!strip' '!emptydirs')
source_x86_64=("https://digilent.s3.amazonaws.com/Software/AdeptUtilities/${pkgver}/${pkgname}_${pkgver}-amd64.deb")
source_i686=("https://digilent.s3.amazonaws.com/Software/AdeptUtilities/${pkgver}/${pkgname}_${pkgver}-i386.deb")
sha256sums_i686=('fa4b2f7c9c08c302e177142162497487d3b27cbc7136010f012cb3e3e9c1edc3')
sha256sums_x86_64=('a05d2c13df1639e92aa96f4532b1990ef1166059bd361da0259d5b0cca3c7be6')

package(){

	# Extract package data
	tar -xJf data.tar.xz -C "${pkgdir}"/

	install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    	ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
    	ln -s "/usr/share/doc/${pkgname}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"

}
