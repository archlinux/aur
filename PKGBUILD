# Maintainer: 0x0D <0xOD@proton.me>

pkgname=mokii-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern, colorful ls replacement written in C++23 with Unicode icons and git integration"
arch=('x86_64')
url="https://github.com/MochiiLinux/Mokii"
license=('MIT')
depends=('gcc-libs')
provides=('mokii')
conflicts=('mokii')
options=(!debug)
source=("https://github.com/MochiiLinux/Mokii/releases/download/v${pkgver}/mokii-v${pkgver}-${arch}.tar.gz")
sha256sums=('SKIP')  # Replace with actual checksum

package() {
  install -Dm755 "${srcdir}/mokii" "${pkgdir}/usr/bin/mokii"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
