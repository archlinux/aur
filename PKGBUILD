# Maintainer: luxcem <a@luxcem.fr>

pkgname=otf-manrope
pkgver=4.5
pkgrel=1
pkgdesc="Manrope font – modern geometric sans-serif"
url="https://manropefont.com"
# Git repository: https://github.com/sharanda/manrope
license=("custom:OFL")
arch=("any")
source=("https://manropefont.com/manrope.zip")
sha256sums=("c924c8b3574cb3aeb0c617a61d05c632aee42fee958f487f3df7ffc6af67cbb6")

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -m644 "${srcdir}"/fonts/otf/*.otf "${pkgdir}"/usr/share/fonts/OTF/
    
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"LICENCE
}
