# Maintainer: allencch <allencch at hotmail dot com>
pkgname=sombrero
pkgver=1.1
pkgrel=3
pkgdesc="Self-Organizing Map for Biological Regulatory Element Recognition and Ordering"
arch=('i686' 'x86_64')
url="http://bioinf.nuigalway.ie/sombrero/download.html"
license=('custom')
makedepends=(dos2unix)
source=("http://bioinf.nuigalway.ie/sombrero/binaries/SOMBRERO_Linux.zip")
md5sums=('a2ee86c24bc8376adfabc983684ea856')

package() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/bin
	install -m 755 BackExtract.pl SOMBRERO SOMBREROView.pl ${pkgdir}/usr/bin/
	dos2unix ${pkgdir}/usr/bin/{BackExtract.pl,SOMBREROView.pl}
}

