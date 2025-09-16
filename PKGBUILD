pkgname=ark-pixel-font-12px-monospaced
pkgver=2025.08.24
pkgrel=1
pkgdesc="Open source Pan-CJK pixel font / 开源的泛中日韩像素字体 (12px monospaced)"
arch=('any')
url="https://github.com/TakWolf/ark-pixel-font"
license=('OFL')
source=("https://github.com/TakWolf/ark-pixel-font/releases/download/2025.08.24/ark-pixel-font-12px-monospaced-otf-v2025.08.24.zip")
sha256sums=('67057077f666bc2b92ce74d6ac0b291ce448c0ddb109138ca41c1521e206a9a1')  # Calculated SHA256 checksum of the zip file

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/ark-pixel"
  install -Dm644 *.otf "${pkgdir}/usr/share/fonts/ark-pixel/"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
