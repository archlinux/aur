# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=muviz
pkgver=1.2.0
pkgrel=1
pkgdesc='Music visualizer'
arch=(x86_64)
url='https://github.com/xyproto/muviz'
license=(MIT GPL3)
depends=('ffts' 'glfw' 'libpulse' 'rapidjson')
makedepends=('cxx')
source=("https://github.com/xyproto/muviz/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('359d7afeb672ab2ef87dde4fd30b611a3f5a5d985ef0c1706b81ac5e5b8b0678')

package() {
  DESTDIR="${pkgdir}" PREFIX=/usr cxx -C ${pkgname}-${pkgver} install
  mv "${pkgdir}/usr/bin/muviz"* "${pkgdir}/usr/bin/muviz"
}

