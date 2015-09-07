# Contributor: Philanecros Heliostein <philanecros@gmail.com>

pkgname='libjson'
pkgver='0.8'
pkgrel='1'
pkgdesc="libjson is a small C library and small codebase that packs an efficient parser and a configurable printer"

arch=('i686' 'x86_64')

url="http://projects.snarc.org/libjson/"
license=('LGPL')

#groups=()

#depends=()
#makedepends=()
#optdepends=()

#provides=()
#conflicts=()
#replaces=()

#backup=()
#options=()

#install=
#changelog=

source=('http://projects.snarc.org/libjson/download/libjson-0.8.tar.gz')
#noextract=()
md5sums=('f8eddc87510d399a2532a9b0d74c2455')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make CFLAGS:='-Wall -Os -fPIC'
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

