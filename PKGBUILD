# Maintainer: goetzc
# Contributor: AsGreyWolf
# Generated: debtap
pkgname=libdicomscope-jni
pkgver=3.6.0
pkgrel=18
pkgdesc="OFFIS DICOM viewer (JNI files)."
arch=('i686' 'x86_64')
url="https://dicom.offis.de/dscope.php.en"
license=('')
groups=('')
depends=('libdcmtk12')
replaces=('dicomscope<3.6.0')
options=('!strip' '!emptydirs')
source_i686=("http://mirrors.kernel.org/ubuntu/pool/universe/d/dicomscope/libdicomscope-jni_${pkgver}-${pkgrel}_i386.deb") # Ubuntu Bionic
source_x86_64=("http://mirrors.kernel.org/ubuntu/pool/universe/d/dicomscope/libdicomscope-jni_${pkgver}-${pkgrel}_amd64.deb")

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums_i686=('2c46ef2e156c28ee81d94758f0def916974406ad07208a981aaa4446c10cc3ff6bc633458bceaaad016383775005e86e397dfc2553cbab73366a48a2069b2850')
sha512sums_x86_64=('f83dad7386eba4038493645ff648dde94e5474e5c858c0891ef3045b6738ea58f2e743e2df58cdcda25bdd244181cec187a149034b450cd0323ad363d83da453')
