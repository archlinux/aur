# Original: malacology <guoyizhang at malacology.net>
# Maintainer: malacology <guoyizhang at malacology.net>
pkgname=paup-desktop
pkgver=1.0
pkgrel=1
pkgdesc="Desktop File For PAUP*"
arch=('i686' 'x86_64')
license=('GPL')
url="http://phylosolutions.com/paup-test/"
depends=('paup-cli')
source=("paup.desktop" "paup.png")
sha256sums=('15c4766a4db4c6999da5db0de673018c98ad0880f24aceb6d9f6558519328fcc'
            '9a8eb866d2ac29f0e249f048d61be74cffaa71d2602c34a8b15cbff083fd5b0f')

package() {
  mkdir ${pkgdir}/usr/
  mkdir ${pkgdir}/usr/share/
  mkdir ${pkgdir}/usr/share/applications/
  mkdir ${pkgdir}/usr/share/icons
  install ${srcdir}/paup.desktop ${pkgdir}/usr/share/applications/paup.desktop
  install ${srcdir}/paup.png ${pkgdir}/usr/share/icons/paup.png
}
