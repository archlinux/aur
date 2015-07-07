# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=zeitgeist-extensions
pkgver=0.0.13
pkgrel=1
pkgdesc="Extensions to the engine such as Teamgeist, Relevancy Providers and Machine Learning Algorithms"
arch=(any)
url="https://launchpad.net/zeitgeist-extensions"
license=(LGPL)
depends=(zeitgeist python2-xapian python2-geoclue)
source=(http://launchpad.net/$pkgname/trunk/fts-$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=(0c7725ff02ccb66d0e6afe16f149f86e)

build() {
  /bin/true
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share/zeitgeist/_zeitgeist/engine/extensions"
  cp -r fts/fts.py geolocation/geolocation.py "$pkgdir/usr/share/zeitgeist/_zeitgeist/engine/extensions"
}
