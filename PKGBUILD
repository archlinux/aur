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
sha256sums=('55cd8247a7a91af9dc0452ca3271c0cf3e19c4bc75889b63e40b6f9bc63c0f65'
            '9a8eb866d2ac29f0e249f048d61be74cffaa71d2602c34a8b15cbff083fd5b0f')

package() {
  mkdir ${pkgdir}/usr/
  mkdir ${pkgdir}/usr/share/
  mkdir ${pkgdir}/usr/share/applications/
  mkdir ${pkgdir}/usr/share/icons
  install ${srcdir}/paup.desktop ${pkgdir}/usr/share/applications/paup.desktop
  install ${srcdir}/paup.png ${pkgdir}/usr/share/icons/paup.png
}
