# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgbase=geist-font
pkgname=(otf-geist
         ttf-geist
         ttf-geist-variable
         otf-geist-mono
         ttf-geist-mono
         ttf-geist-mono-variable)
pkgver=1.4.0
pkgrel=2
pkgdesc="A new font family for Vercel, created by Vercel in collaboration with Basement Studio"
arch=('any')
url="https://vercel.com/font"
license=('OFL-1.1')
source=("https://github.com/vercel/geist-font/releases/download/${pkgver}/Geist-v${pkgver}.zip"
        "https://github.com/vercel/geist-font/releases/download/${pkgver}/GeistMono-v${pkgver}.zip")
sha256sums=('fafb2a4ce068d293bd53c29cef517597cef6437dc5f6eb5ecca8bc40337ec179'
            '70423ceba8d5f768a9a9a9cb56c449a5307d20679d951113acdf38d7107a548b')

package_otf-geist() {
  cd Geist
  install -Dm644 otf/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist() {
  cd Geist
  install -Dm644 ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-variable() {
  cd Geist
  install -Dm644 variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_otf-geist-mono() {
  cd GeistMono
  install -Dm644 otf/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-mono() {
  cd GeistMono
  install -Dm644 ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-mono-variable() {
  cd GeistMono
  install -Dm644 variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
