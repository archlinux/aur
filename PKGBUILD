# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=glew-libepoxy
pkgver=99
pkgrel=2
pkgdesc='Dummy package providing glew using libepoxy instead'
arch=('any')
depends=('libepoxy')
provides=('glew')
conflicts=('glew')
source=('glew.h' 'glew.pc' 'libGLEW.so')
md5sums=('ed1dc94f192ae75486db06e8b13ef968'
         'fcafee532ab772bad2e1cc2122ef20e8'
         '02ad2f73b671bea81381e65f0e036b9e')

package() {
  cd "$srcdir"

  install -Dm644 glew.h "$pkgdir/usr/include/GL/glew.h"
  install -Dm644 glew.pc "$pkgdir/usr/lib/pkgconfig/glew.pc"
  install -Dm644 libGLEW.so "$pkgdir/usr/lib/libGLEW.so"
}
