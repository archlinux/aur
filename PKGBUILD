pkgname=ark-pixel-font-16px-monospaced
pkgver=2023.11.26
pkgrel=1
pkgdesc="Open source Pan-CJK pixel font / 开源的泛中日韩像素字体 (16px monospaced)"
arch=('any')
url="https://github.com/TakWolf/ark-pixel-font"
license=('OFL')
source=("https://github.com/TakWolf/ark-pixel-font/releases/download/2023.11.26/ark-pixel-font-16px-monospaced-otf-v2023.11.26.zip")
sha256sums=('40da6a9dc35c2588d36be3131abf746d8e647336d59668b50733dbbf0c14ce28')  # Calculated SHA256 checksum of the zip file

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/ark-pixel"
  install -Dm644 *.otf "${pkgdir}/usr/share/fonts/ark-pixel/"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
