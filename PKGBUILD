# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgbase=geist-font
pkgname=(otf-geist
         ttf-geist
         ttf-geist-variable
         otf-geist-mono
         ttf-geist-mono
         ttf-geist-mono-variable)
pkgver=1.4.01
pkgrel=1
pkgdesc="A new font family for Vercel, created by Vercel in collaboration with Basement Studio"
arch=('any')
url="https://vercel.com/font"
license=('OFL-1.1')
source=("https://github.com/vercel/geist-font/releases/download/${pkgver}/Geist-v${pkgver}.zip"
        "https://github.com/vercel/geist-font/releases/download/${pkgver}/GeistMono-${pkgver}.zip")
sha256sums=('d12b5e123bdd5a9facbd52ab6a24756587b086d6a76fc629a28456675bfad4e3'
            '2338de729353fa25e62581f87be9d6620ec246eac28179c2c2c9f77e5fdfa548')

package_otf-geist() {
  cd "Geist-v${pkgver}"
  install -Dm644 otf/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist() {
  cd "Geist-v${pkgver}"
  install -Dm644 ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-variable() {
  cd "Geist-v${pkgver}"
  install -Dm644 variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_otf-geist-mono() {
  cd "GeistMono-${pkgver}"
  install -Dm644 otf/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-mono() {
  cd "GeistMono-${pkgver}"
  install -Dm644 ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-mono-variable() {
  cd "GeistMono-${pkgver}"
  install -Dm644 variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
