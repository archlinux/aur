pkgname=ark-pixel-font-16px-proportional
pkgver=2023.11.26
pkgrel=1
pkgdesc="Open source Pan-CJK pixel font / 开源的泛中日韩像素字体 (16px proportional)"
arch=('any')
url="https://github.com/TakWolf/ark-pixel-font"
license=('OFL')
source=("https://github.com/TakWolf/ark-pixel-font/releases/download/2023.11.26/ark-pixel-font-16px-proportional-otf-v2023.11.26.zip")
sha256sums=('037ffe9587cb228c26d0e4ac92d75308799311d30b104bc05090f8de90dd89eb')  # Calculated SHA256 checksum of the zip file

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/ark-pixel"
  install -Dm644 *.otf "${pkgdir}/usr/share/fonts/ark-pixel/"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
