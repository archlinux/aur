pkgname=ark-pixel-font-10px-monospaced
pkgver=2025.08.24
pkgrel=1
pkgdesc="Open source Pan-CJK pixel font / 开源的泛中日韩像素字体 (10px monospaced)"
arch=('any')
url="https://github.com/TakWolf/ark-pixel-font"
license=('OFL')
source=("https://github.com/TakWolf/ark-pixel-font/releases/download/2025.08.24/ark-pixel-font-10px-monospaced-otf-v2025.08.24.zip")
sha256sums=('36c65ca07e81f393f4ba1d8da672c2899ce645f5da729aac3aca08cbdf6780e5')  # Calculated SHA256 checksum of the zip file

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/ark-pixel"
  install -Dm644 *.otf "${pkgdir}/usr/share/fonts/ark-pixel/"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
