pkgname=ark-pixel-font-12px-monospaced
pkgver=2023.08.24
pkgrel=1
pkgdesc="Open source Pan-CJK pixel font / 开源的泛中日韩像素字体 (12px monospaced)"
arch=('any')
url="https://github.com/TakWolf/ark-pixel-font"
license=('OFL')
source=("https://github.com/TakWolf/ark-pixel-font/releases/download/2023.08.24/ark-pixel-font-12px-monospaced-otf-v2023.08.24.zip")
sha256sums=('9afb0a1f93c822a6d1802be66f074c6777194ce27ea30924bf410f776be74d5d')  # Calculated SHA256 checksum of the zip file

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/ark-pixel"
  install -Dm644 *.otf "${pkgdir}/usr/share/fonts/ark-pixel/"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
