# Maintainer: luxcem <a@luxcem.fr>

pkgname=otf-manrope
pkgver=4
pkgrel=1
pkgdesc="Manrope font – modern geometric sans-serif"
url="https://manropefont.com"
# Git repository: https://github.com/sharanda/manrope
license=("custom:OFL")
arch=("any")
source=("https://manropefont.com/manrope.zip")
sha256sums=("2c6f0bd2f77bc68f4dcbe32e56e0667c5e8a85eb867efb6a611546e6166611bf")

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -m644 "${srcdir}"/fonts/otf/*.otf "${pkgdir}"/usr/share/fonts/OTF/
    
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/fonts/Open Font License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"LICENCE
}
