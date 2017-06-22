#Maintainer: allencch <allencch at hotmail dot com>
pkgname=alignace
pkgver=1.0
pkgrel=6
pkgdesc="Program that finds sequence elements conserved in a set of DNA sequences"
arch=('i686' 'x86_64')
url="http://arep.med.harvard.edu/mrnadata/mrnasoft.html"
license=('custom')
depends=("sh")
source=("http://arep.med.harvard.edu/mrnadata/software/${pkgname}.tar.gz" "http://archive.download.redhat.com/pub/redhat/linux/6.2/it/os/i386/RedHat/RPMS/libstdc++-2.9.0-30.i386.rpm")
md5sums=('6d2d9fb0929ce03974dca874b516cd07'
         '29ca50829f6d43c63d8fcc827b3daceb')

package() {
	cd "${srcdir}/${pkgname}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib"
	install -m755 AlignACE "${pkgdir}/usr/bin"
	install -m755 ScanACE "${pkgdir}/usr/bin"
	install -m755 ../usr/lib/libstdc++-2-libc6.1-1-2.9.0.so "${pkgdir}/usr/lib"
}
