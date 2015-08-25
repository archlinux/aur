# Maintainer: A.T.W.A. <arch.atwa@gmail.com>

pkgname=gxkb
pkgver=0.7.6
pkgrel=1
pkgdesc="X11 keyboard indicator and switcher"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gxkb"
license=('GPL2')
depends=('libxklavier' 'libwnck')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('abf89d159d2f4856e018c845fffef142')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
