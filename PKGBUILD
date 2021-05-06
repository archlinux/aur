# Original: malacology <guoyizhang at malacology.net>
# Maintainer: malacology <guoyizhang at malacology.net>
pkgname=mrbayes-desktop
pkgver=1.0
pkgrel=1
pkgdesc="Desktop File For MrBayes"
arch=('i686' 'x86_64')
license=('GPL')
url="http://nbisweden.github.io/MrBayes/"
depends=('mrbayes')
source=("mrbayes.desktop" "mrbayes.gif")
sha256sums=('f49e6070e997905b92663b4e66ddd2a310f8aa3f9f64d8b2f46ddc86407a0130'
            'fea0042f09cad5c56236c47ce6fa61268bc7fbd699f1ea17678aecc22438db94')

package() {
  mkdir ${pkgdir}/usr/
  mkdir ${pkgdir}/usr/share/
  mkdir ${pkgdir}/usr/share/applications/
  mkdir ${pkgdir}/usr/share/icons
  install ${srcdir}/mrbayes.desktop ${pkgdir}/usr/share/applications/mrbayes.desktop
  install ${srcdir}/mrbayes.gif ${pkgdir}/usr/share/icons/mrbayes.gif
}
