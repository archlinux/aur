# Maintainer: Ilya Oshchepkov 
pkgname=teqc
pkgver=2017Sep15
pkgrel=1
pkgdesc="The toolkit for GPS/GLONASS/Galileo/SBAS/Beidou/QZSS data "
arch=(x86_64)
url="http://www.unavco.org/software/data-processing/teqc/teqc.html"
source=("http://www.unavco.org/software/data-processing/teqc/development/teqc_Lx86_64d.zip")

md5sums=('88ef832731867871ef500c70745b382e')

package() {
    install -dm755 "$pkgdir"/usr/bin/
    install -m755 teqc "$pkgdir"/usr/bin/
}
