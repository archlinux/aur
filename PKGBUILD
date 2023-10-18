pkgname=ark-pixel-font-12px-proportional
pkgver=2023.08.24
pkgrel=1
pkgdesc="Open source Pan-CJK pixel font / 开源的泛中日韩像素字体 (12px proportional)"
arch=('any')
url="https://github.com/TakWolf/ark-pixel-font"
license=('OFL')
source=("https://github.com/TakWolf/ark-pixel-font/releases/download/2023.08.24/ark-pixel-font-12px-proportional-otf-v2023.08.24.zip")
sha256sums=('ba2be117a1ec48254c803eb260aaf9b6692201ed5ad47e92d96bb2866d92b80d')  # Calculated SHA256 checksum of the zip file

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/ark-pixel"
  install -Dm644 *.otf "${pkgdir}/usr/share/fonts/ark-pixel/"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
