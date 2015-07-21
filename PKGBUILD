# Maintainer: muhas <muhas@muhas.ru>
pkgname=skb
pkgver=0.4
pkgrel=2
pkgdesc="Simple keyboard layout indicator."
arch=('i686' 'x86_64')
url=('http://plhk.ru/')
license=('GPL')
depends=()
source=(http://plhk.ru/static/skb/${pkgname}-${pkgver}.tar.gz)
md5sums=('feaf75eb5d4c557ed9ac75620a7ce264')

build() {
 
  cd ${srcdir}/${pkgname}-${pkgver}
  make || return 1
  #make DESTDIR=${pkgdir} install || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
}
