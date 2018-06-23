# Maintainer: Ilya Oshchepkov 
pkgname=teqc
pkgver=2018Jun8
pkgrel=1
pkgdesc="The toolkit for GPS/GLONASS/Galileo/SBAS/Beidou/QZSS data "
arch=(x86_64)
url="http://www.unavco.org/software/data-processing/teqc/teqc.html"
source=("http://www.unavco.org/software/data-processing/teqc/development/teqc_Lx86_64d.zip")

md5sums=('5f7008d0eacafee349139e473eea91e9')

package() {
    install -dm755 "$pkgdir"/usr/bin/
    install -m755 teqc "$pkgdir"/usr/bin/
}
