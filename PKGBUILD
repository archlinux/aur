# Maintainer: Michael Lutonsky <m@luto.at>

pkgname=beekeeper-studio-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="Cross platform SQL editor and database management app for Windows, Linux, and Mac."
arch=('x86_64')
url="https://www.beekeeperstudio.io/"
license=('MIT')
source_x86_64=("https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${pkgver}/beekeeper-studio_${pkgver}_amd64.deb")
sha256sums_x86_64=('1e969a0cfd12a79be182c931f79fda39a32d5de583625d0d87c065c8fa9abb82')


package () {
  cd ${pkgdir}
  tar -xf ${srcdir}/data.tar.xz

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/Beekeeper Studio/beekeeper-studio" "${pkgdir}/usr/bin"
}
