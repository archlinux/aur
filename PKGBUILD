# Maintainer: GT610 <myddz1005@163.com>

pkgname=yelp-xsl-338
pkgver=3.38.3
pkgrel=1
pkgdesc="Document transformations from Yelp (Version 3.38)"
url="https://gitlab.gnome.org/GNOME/yelp-xsl"
arch=(any)
license=(GPLv2)
makedepends=(itstool git)
source=("https://download.gnome.org/sources/yelp-xsl/3.38/yelp-xsl-3.38.3.tar.xz")
sha256sums=('SKIP')

build() {
  cd yelp-xsl-3.38.3
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd yelp-xsl-3.38.3
  make DESTDIR="$pkgdir" install
}
