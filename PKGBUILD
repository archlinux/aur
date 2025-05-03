# Maintainer: luxcem <a@luxcem.fr>

pkgname=otf-manrope
pkgver=4.5
pkgrel=5
pkgdesc="Manrope font – modern geometric sans-serif"
url="https://www.shimmer.cloud/manrope"
license=("custom:OFL")
arch=("any")
source=("https://www.shimmer.cloud/assets/manrope/manrope.zip"
       "OFL.txt")
sha256sums=('55df46e6c66a7dce193f234001327d94f4bc9e972b8499d11ba9c2eefcc9f4d9'
            'ce243fd4a62b1b76c959ffba6ec16a7a3146b2362d441ae4f9f7f32fc3750d6c')

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -m644 "${srcdir}"/fonts/otf/*.otf "${pkgdir}"/usr/share/fonts/OTF/
    
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"LICENCE
  
}
