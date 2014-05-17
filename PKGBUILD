# Contributor: farid abdelnour < farid at atelier-labs.org>
# Contributor: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=oggfwd	
pkgver=0.2
pkgrel=3
pkgdesc="Pipes an ogg stream to an icecast server"
arch=('i686' 'x86_64')
url="http://v2v.cc/~j/oggfwd/"
license=('GPL')
depends=(libshout)
source=(http://www.v2v.cc/~j/ffmpeg2theora/oggfwd/oggfwd.tar.gz)
md5sums=('8402d26a5a8ff318ef6ea01ec146c8cc')

build () {
  cd "$srcdir/$pkgname"
  make oggfwd
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 oggfwd "$pkgdir/usr/bin/oggfwd"
}

