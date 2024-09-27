# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgbase=geist-font
pkgname=(otf-geist
         ttf-geist
         ttf-geist-variable
         otf-geist-mono
         ttf-geist-mono
         ttf-geist-mono-variable)
pkgver=1.4.0
pkgrel=1
pkgdesc="A new font family for Vercel, created by Vercel in collaboration with Basement Studio"
arch=('any')
url="https://vercel.com/font"
license=('OFL-1.1')
source=("https://github.com/vercel/geist-font/releases/download/${pkgver}/Geist-${pkgver}.zip"
        "https://github.com/vercel/geist-font/releases/download/${pkgver}/GeistMono-${pkgver}.zip"
        "${pkgbase}-LICENSE::https://github.com/vercel/geist-font/raw/refs/tags/${pkgver}/LICENSE.txt")
sha256sums=('1bd906111a8853f0720831d08a363077358afc755acf893c6d4ed29529bef139'
            '91721f29a42d7e9e87348cd2db49a8f41c9363e43665be8c3aa44564c3e0cd3d'
            '930853ee1daa68554d9e35c8a9175affb74f699fad9a5da6ee5ebe76379d9137')

package_otf-geist() {
  install -Dm644 Geist/otf/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 "${pkgbase}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-geist() {
  install -Dm644 Geist/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${pkgbase}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-geist-variable() {
  install -Dm644 Geist/variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${pkgbase}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_otf-geist-mono() {
  install -Dm644 GeistMono/otf/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 "${pkgbase}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-geist-mono() {
  install -Dm644 GeistMono/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${pkgbase}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-geist-mono-variable() {
  install -Dm644 GeistMono/variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${pkgbase}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
