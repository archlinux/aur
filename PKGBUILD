pkgname=ark-pixel-font-10px-monospaced
pkgver=2023.11.26
pkgrel=1
pkgdesc="Open source Pan-CJK pixel font / 开源的泛中日韩像素字体 (10px monospaced)"
arch=('any')
url="https://github.com/TakWolf/ark-pixel-font"
license=('OFL')
source=("https://github.com/TakWolf/ark-pixel-font/releases/download/2023.11.26/ark-pixel-font-10px-monospaced-otf-v2023.11.26.zip")
sha256sums=('0ee398b6cc191d6f7d0d0c79ea23588b1e775dc810752979b0e89b8088e2323a')  # Calculated SHA256 checksum of the zip file

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/ark-pixel"
  install -Dm644 *.otf "${pkgdir}/usr/share/fonts/ark-pixel/"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
