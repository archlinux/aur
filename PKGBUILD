# Maintainer: Thermi <noel [at] familie-kuntze dot com>

pkgname=crconf
pkgver=0.2
pkgrel=1
pkgdesc="configuration tool for kernel crypto algorithms"
url='http://sourceforge.net/projects/crconf/'
license=("GPL")
arch=('i686' 'x86_64')
depends=()
conflicts=()

source=("http://downloads.sourceforge.net/project/crconf/crconf-pre2.tar.gz")
sha256sums=('15d39b599acda93a50f473190e702d593ba13613b6ed31711f3584b5726b81b8')

build() {
  cd ${srcdir}/${pkgname}-pre2
  make
}

package() {
  cd "${srcdir}/${pkgname}-pre2"
  make SBINDIR=/usr/bin DESTDIR=${pkgdir} install
}
