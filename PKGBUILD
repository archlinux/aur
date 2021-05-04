# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=morphoj
pkgver=1.07a
pkgrel=1
pkgdesc="MorphoJ is an integrated program package for doing geometric morphometrics"
arch=('x86_64')
url="https://morphometrics.uk/MorphoJ_page.html"
license=('Apache License version 2')
source=("https://morphometrics.uk/MorphoJ_stuff/download.php?get=MorphoJ-installer_Unix_Linux.jar")
sha256sums=('SKIP')


package() {
  cd "${srcdir}"
  chmod +x download.php?get=MorphoJ-installer_Unix_Linux.jar
  java -jar download.php?get=MorphoJ-installer_Unix_Linux.jar
  mkdir ${pkgdir}/usr/share/morphoj
}
