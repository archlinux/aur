pkgname=ark-pixel-font-12px-proportional
pkgver=2025.08.24
pkgrel=1
pkgdesc="Open source Pan-CJK pixel font / 开源的泛中日韩像素字体 (12px proportional)"
arch=('any')
url="https://github.com/TakWolf/ark-pixel-font"
license=('OFL')
source=("https://github.com/TakWolf/ark-pixel-font/releases/download/2025.08.24/ark-pixel-font-12px-proportional-otf-v2025.08.24.zip")
sha256sums=('7a3d68fd5af1f00f716f2d6cd2da3673f713cccbacd05dda8b8d9674b07b7b13')  # Calculated SHA256 checksum of the zip file

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/ark-pixel"
  install -Dm644 *.otf "${pkgdir}/usr/share/fonts/ark-pixel/"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
