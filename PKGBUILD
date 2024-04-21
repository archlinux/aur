# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgbase=geist-font
pkgname=(otf-geist
         ttf-geist
         ttf-geist-variable
         otf-geist-mono
         ttf-geist-mono
         ttf-geist-mono-variable)
pkgver=1.3.0
pkgrel=2
pkgdesc="A new font family for Vercel, created by Vercel in collaboration with Basement Studio"
arch=('any')
url="https://vercel.com/font"
license=('OFL-1.1')
source=("https://github.com/vercel/geist-font/releases/download/${pkgver}/Geist-${pkgver}.zip"
        "https://github.com/vercel/geist-font/releases/download/${pkgver}/GeistMono-${pkgver}.zip")
sha256sums=('6a656e5efc991a0b465bc288b5455eebd7219e0668a936f8705a2e9d3a2a62c9'
            'd6d19b0fc600110cb1595152c803a1f08e258f76637d1509baf76e2e0b9708d5')

package_otf-geist() {
  cd "Geist-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF/" statics-otf/*.otf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.TXT
}

package_ttf-geist() {
  cd "Geist-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" statics-ttf/*.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.TXT
}

package_ttf-geist-variable() {
  cd "Geist-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" variable-ttf/*.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.TXT
}

package_otf-geist-mono() {
  cd "GeistMono-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF/" statics-otf/*.otf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.TXT
}

package_ttf-geist-mono() {
  cd "GeistMono-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" statics-ttf/*.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.TXT
}

package_ttf-geist-mono-variable() {
  cd "GeistMono-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" variable-ttf/*.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.TXT
}
