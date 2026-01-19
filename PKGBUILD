# Maintainer: 0x0D <0xOD@proton.me>

pkgname=mokii-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="A modern, colorful ls replacement written in C++23 with Unicode icons"
arch=('x86_64')
url="https://github.com/MochiiLinux/Mokii"
license=('MIT')
depends=('gcc-libs')
provides=('mokii')
conflicts=('mokii')
options=(!debug)
source=("https://github.com/MochiiLinux/Mokii/releases/download/v${pkgver}/Mokii-v${pkgver}.tar.gz")
sha256sums=('fedbe741fbf33421da0c2001a18c386d80bac1771e00a51d8dd35ffb6c6c815f')

package() {
  install -Dm755 "${srcdir}/Mokii-v${pkgver}/mokii" "${pkgdir}/usr/bin/mokii"
  install -Dm644 "${srcdir}/Mokii-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/Mokii-v${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
