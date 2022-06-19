# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=muviz
pkgver=1.1.1
pkgrel=2
pkgdesc='Music visualizer'
arch=(x86_64)
url='https://github.com/xyproto/muviz'
license=(MIT GPL3)
depends=('ffts' 'glfw' 'libpulse' 'rapidjson')
makedepends=('cxx')
source=("https://github.com/xyproto/muviz/archive/refs/tags/v1.1.1.tar.gz")
sha256sums=('f7e142da90fc773735bf7a16885d4e1a68225d8a80ffedd03ab389e774467360')

package() {
  DESTDIR="${pkgdir}" PREFIX=/usr cxx -C ${pkgname}-${pkgver} install
  mv "${pkgdir}/usr/bin/muviz"* "${pkgdir}/usr/bin/muviz" 
}

