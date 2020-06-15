# Maintainer: Michael Lutonsky <m@luto.at>

pkgname=beekeeper-studio-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Cross platform SQL editor and database management app for Windows, Linux, and Mac."
arch=('x86_64')
url="https://www.beekeeperstudio.io/"
license=('MIT')
source_x86_64=("https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${pkgver}/beekeeper-studio_${pkgver}_amd64.deb")
sha256sums_x86_64=('c5f7bc2e880517472f3d99ea4a66ebf83af008fdbf6b040d081b66bdbd08fad5')


package () {
  cd ${pkgdir}
  tar -xf ${srcdir}/data.tar.xz

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/Beekeeper Studio/beekeeper-studio" "${pkgdir}/usr/bin"
}
