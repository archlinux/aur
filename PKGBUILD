pkgname=ark-pixel-font-16px-monospaced
pkgver=2025.08.24
pkgrel=1
pkgdesc="Open source Pan-CJK pixel font / 开源的泛中日韩像素字体 (16px monospaced)"
arch=('any')
url="https://github.com/TakWolf/ark-pixel-font"
license=('OFL')
source=("https://github.com/TakWolf/ark-pixel-font/releases/download/2025.08.24/ark-pixel-font-16px-monospaced-otf-v2025.08.24.zip")
sha256sums=('e2831d5d2ec922484a72fec7546995bcc33746d14592bd069117707c46c3f2c1')  # Calculated SHA256 checksum of the zip file

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/ark-pixel"
  install -Dm644 *.otf "${pkgdir}/usr/share/fonts/ark-pixel/"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
