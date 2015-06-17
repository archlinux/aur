# Maintainer: M0Rf30

pkgname=gtge
pkgver=0.2.3
pkgrel=1
pkgdesc="Golden T Game Engine is an advanced cross-platform game programming library written in Java language"
arch=("any")
url="http://goldenstudios.or.id/"
license=("LGPL3")
depends=("java-runtime" )
options=(!emptydirs)
source=("http://goldenstudios.or.id/products/GTGE/GTGE_0_2_3_complete.zip")

package() {
	cd ${srcdir}/GTGE	

	JAVA_DIR=${pkgdir}/usr/share/java/${pkgname}
	DOC_DIR=${pkgdir}/usr/share/doc/${pkgname}
	
	# Directories
	install -d ${JAVA_DIR} ${DOC_DIR} ${BIN_DIR}

	# jar
	install -D golden*.jar ${JAVA_DIR}/golden.jar
        cp -r docs ${JAVA_DIR}/

	# docs readme and copyright
	install -D README.txt ${DOC_DIR}

	# License
	install -D LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=('c6a433a72e134907766f0cada892f439')
