# Original: malacology <guoyizhang at malacology.net>
# Maintainer: malacology <guoyizhang at malacology.net>
pkgname=mrbayes-mpi-desktop
pkgver=1.0
pkgrel=1
pkgdesc="Desktop File For MrBayes MPI"
arch=('i686' 'x86_64')
license=('GPL')
url="http://nbisweden.github.io/MrBayes/"
depends=('mrbayes-mpi')
source=("mrbayes.desktop" "mrbayes.gif")
sha256sums=('eafa76be4d993fcc4a33212d042f55637caefd37158232a16ae50332d2465d7c'
            'fea0042f09cad5c56236c47ce6fa61268bc7fbd699f1ea17678aecc22438db94')

package() {
  mkdir ${pkgdir}/usr/
  mkdir ${pkgdir}/usr/share/
  mkdir ${pkgdir}/usr/share/applications/
  mkdir ${pkgdir}/usr/share/icons
  install ${srcdir}/mrbayes.desktop ${pkgdir}/usr/share/applications/mrbayes.desktop
  install ${srcdir}/mrbayes.gif ${pkgdir}/usr/share/icons/mrbayes.gif
}
