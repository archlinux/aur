# Maintainer: Michael Lutonsky <m@luto.at>

pkgname=beekeeper-studio-bin
pkgver=1.4.0
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://www.beekeeperstudio.io/"
license=('MIT')
source_x86_64=("https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${pkgver}/beekeeper-studio_${pkgver}_amd64.deb")
sha256sums_x86_64=('edf01a3f22258dbd36f9d658c7bfe6127f52f4b072d196547879f63c043c051f')


package () {
  cd ${pkgdir}
  tar -xf ${srcdir}/data.tar.xz

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/Beekeeper Studio/beekeeper-studio" "${pkgdir}/usr/bin"
}
