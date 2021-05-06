# Original: Abhishek Dasgupta <abhidg@gmail.com>
# Maintainer: Stunts <f.pinamartins@gmail.com>
pkgname=mafft-desktop
pkgver=1.0
pkgrel=1
pkgdesc="Desktop File For MAFFT"
arch=('i686' 'x86_64')
license=('GPL')
url="https://mafft.cbrc.jp/alignment/software/"
depends=('mafft')
source=("mafft.desktop")
sha256sums=('aba7ed898aaac482385a53c0fda11e7a62c836f5f84ba1767ee083f7f0f913e2')

package() {
  mkdir ${pkgdir}/usr/
  mkdir ${pkgdir}/usr/share/
  mkdir ${pkgdir}/usr/share/applications/
  install ${srcdir}/mafft.desktop ${pkgdir}/usr/share/applications/mafft.desktop
}
