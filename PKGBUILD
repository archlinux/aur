# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Tomas Kramar <kramar[dot]tomas[at]gmail[dot]com>

pkgname=hdaps-gl
pkgver=0.0.5
pkgrel=4
pkgdesc='ThinkPad HDAPS OpenGL monitor'
arch=('i686' 'x86_64')
url='http://hdaps.sourceforge.net'
license=('GPL')
depends=('freeglut')
makedepends=('glu')
source=("http://downloads.sourceforge.net/sourceforge/hdaps/${pkgname}-${pkgver}.tar.gz")
md5sums=('e0924c964c70f5b4d8ee8de67108c6a9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  install hdaps-gl "${pkgdir}/usr/bin"
}
