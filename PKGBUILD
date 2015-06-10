# Contributor: LPB <lpb612@gmail.com>
# Maintainer: gajjanag <gajjanagadde@gmail.com>
pkgname=jemdoc
pkgver=0.7.4
pkgrel=0
pkgdesc="a light markup designed for websites"
arch=(any)
url="http://jemdoc.jaboc.net/index.html"
license=('GPL')
depends=(python2)
makedepends=(curl)

build() {
  curl -o jemdoc http://jemdoc.jaboc.net/dist/jemdoc.py
  sed -i '1s/python/python2/' jemdoc
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm755 jemdoc $pkgdir/usr/bin
}

