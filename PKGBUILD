# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Tomas Kramar <kramar[dot]tomas[at]gmail[dot]com>

pkgname=hdaps-gl
pkgver=0.0.5
pkgrel=5
pkgdesc='ThinkPad HDAPS OpenGL monitor'
arch=('i686' 'x86_64')
url='http://hdaps.sourceforge.net'
license=('GPL')
depends=('freeglut')
makedepends=('glu')
source=("http://downloads.sourceforge.net/sourceforge/hdaps/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d7696a42be66b09d492345c3a05b7c3b45f5e8e33464d3a74844b78182c73c64')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  install hdaps-gl "${pkgdir}/usr/bin"
}
