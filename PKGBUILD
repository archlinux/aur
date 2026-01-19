# Maintainer: 0x0D <0xOD@proton.me>

pkgname=mokii-bin
pkgver=0.1.2
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
sha256sums=('a0feb5152eca650a242e3173b7b19b02f15aee1eb0226b9bea9644033e77147a')

package() {
  install -Dm755 "${srcdir}/mokii" "${pkgdir}/usr/bin/mokii"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
