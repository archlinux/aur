# Maintainer: Ilya Oshchepkov 
pkgname=teqc
pkgver=2016Apr1
pkgrel=1
pkgdesc="The toolkit for GPS/GLONASS/Galileo/SBAS/Beidou/QZSS data "
arch=(x86_64)
url="http://www.unavco.org/software/data-processing/teqc/teqc.html"
source=("http://www.unavco.org/software/data-processing/teqc/development/teqc_Lx86_64d.zip")

md5sums=('9d0d15cf2bac4f4308d83e1533615936')

package() {
    install -dm755 "$pkgdir"/usr/bin/
    install -m755 teqc "$pkgdir"/usr/bin/
}
