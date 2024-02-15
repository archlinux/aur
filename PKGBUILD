# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Ilya Oshchepkov (https://aur.archlinux.org/account/elijahss)

pkgname=teqc-bin
pkgver=2019Feb25
pkgrel=1
pkgdesc="The toolkit for GPS/GLONASS/Galileo/SBAS/Beidou/QZSS data "
arch=("x86_64")
url="http://www.unavco.org/software/data-processing/teqc/teqc.html"
license=("LicenseRef-Unknown")
depends=("glibc")
provides=("teqc=${pkgver}")
conflicts=("teqc")
replaces=("teqc=2018Jun8")
source=(
  "http://www.unavco.org/software/data-processing/teqc/development/teqc_Lx86_64d.zip"
  "license-dummy.txt"
)

md5sums=(
  'c7c1633e86e680457a7dc315ac7cfb0e'
  '425bd09e1757be90e65a28fb121b3276'
)
sha256sums=(
  '88d65a17e3c73f4415647e62e8df75a9d3274d703e3d14ba4a8973f2ae7a7af3'
  '6b9042484accd63cc59120561b33707dcc90447659700ebb08044c38756fba56'
)

package() {
    install -Dvm755 teqc "$pkgdir"/usr/bin/teqc
    install -Dvm755 license-dummy.txt "${pkgdir}/usr/share/licenses/${pkgname}/license-dummy.txt"
}
