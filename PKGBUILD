# Maintainer: luxcem <a@luxcem.fr>

pkgname=otf-manrope
pkgver=4.5
pkgrel=2
pkgdesc="Manrope font – modern geometric sans-serif"
url="https://manropefont.com"
# Git repository: https://github.com/sharanda/manrope
license=("custom:OFL")
arch=("any")
source=("https://manropefont.com/manrope.zip"
       "OFL.txt")
sha256sums=('bf0ddf534df077c149c6c3af440a4f48e80e01b491f805b134b55da8081e425e'
            'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3')

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -m644 "${srcdir}"/fonts/otf/*.otf "${pkgdir}"/usr/share/fonts/OTF/
    
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"LICENCE
  
}
