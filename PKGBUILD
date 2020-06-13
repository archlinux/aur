# Maintainer: Michael Lutonsky <m@luto.at>

pkgname=beekeeper-studio-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Cross platform SQL editor and database management app for Windows, Linux, and Mac."
arch=('x86_64')
url="https://www.beekeeperstudio.io/"
license=('MIT')
source_x86_64=("https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v${pkgver}/beekeeper-studio_${pkgver}_amd64.deb")
sha256sums_x86_64=('3f856ab58e0365569eab6872d22a9435a0898e4a0d8516e6178cd43ba087408d')


package () {
  cd ${pkgdir}
  tar -xf ${srcdir}/data.tar.xz

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/Beekeeper Studio/beekeeper-studio" "${pkgdir}/usr/bin"
}
