# Maintainer: Michael Lutonsky <m@luto.at>

pkgname=beekeeper-studio-bin
pkgver=1.6.10
pkgrel=1
pkgdesc="Cross platform SQL editor and database management app for Windows, Linux, and Mac."
arch=('x86_64')
url="https://www.beekeeperstudio.io/"
license=('MIT')
source_x86_64=("https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${pkgver}/beekeeper-studio_${pkgver}_amd64.deb")
sha256sums_x86_64=('b18cde6600a7cc069fb5fe08dcac99b8fdd42ba8641e5ed4d9fcc2a0a69ee5e8')


package () {
  cd ${pkgdir}
  tar -xf ${srcdir}/data.tar.xz

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/Beekeeper Studio/beekeeper-studio" "${pkgdir}/usr/bin"
}
