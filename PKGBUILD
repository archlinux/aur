# Maintainer: goetzc
# Contributor: AsGreyWolf
# Generated: debtap
pkgname=libdicomscope-jni-bin
_pkgname=libdicomscope-jni
pkgver=3.6.0
pkgrel=20
_pkgrel=${pkgrel}build1
pkgdesc="OFFIS DICOM viewer (JNI files)."
arch=('i686' 'x86_64')
url="https://dicom.offis.de/dscope.php.en"
_url="https://packages.ubuntu.com/focal/libdicomscope-jni"
license=('OFFIS')
groups=('')
depends=('libdcmtk14')
replaces=("${_pkgname}" 'dicomscope<3.6.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!emptydirs')

source_x86_64=("http://mirrors.kernel.org/ubuntu/pool/universe/d/dicomscope/${_pkgname}_${pkgver}-${_pkgrel}_amd64.deb")

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

sha256sums_x86_64=('80824e47379de237f5a5c4a118ef960cc2280f870544ccab0c2543e1b10dbc36')
