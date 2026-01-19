# Maintainer: 0x0D <0xOD@proton.me>

pkgname=mokii-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A modern, colorful ls replacement written in C++23 with Unicode icons"
arch=('x86_64')
url="https://github.com/MochiiLinux/Mokii"
license=('MIT')
depends=('gcc-libs')
provides=('mokii')
conflicts=('mokii')
options=(!debug)
source=("https://github.com/MochiiLinux/Mokii/releases/download/v${pkgver}/mokii-v${pkgver}-${arch}.tar.gz")
sha256sums=('bffb1364f9b23b8e20b39fc98c20364ca457e7e585a5ec90c280515f3ae43b66')

package() {
  install -Dm755 "${srcdir}/mokii" "${pkgdir}/usr/bin/mokii"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
