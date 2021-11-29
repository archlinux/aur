# Maintainer: luxcem <a@luxcem.fr>

pkgname=otf-manrope
pkgver=4.5
pkgrel=3
pkgdesc="Manrope font – modern geometric sans-serif"
url="https://manropefont.com"
# Git repository: https://github.com/sharanda/manrope
license=("custom:OFL")
arch=("any")
source=("https://manropefont.com/manrope.zip"
       "OFL.txt")
sha256sums=('bf0ddf534df077c149c6c3af440a4f48e80e01b491f805b134b55da8081e425e'
            'ce243fd4a62b1b76c959ffba6ec16a7a3146b2362d441ae4f9f7f32fc3750d6c')

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -m644 "${srcdir}"/fonts/otf/*.otf "${pkgdir}"/usr/share/fonts/OTF/
    
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"LICENCE
  
}
