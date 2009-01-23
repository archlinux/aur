# Contributor: Schnouki <thomas.jost@gmail.com>
pkgname=disper
pkgver=0.2.0
pkgrel=1
pkgdesc="An on-the-fly display switch utility, intended to be used on laptops, especially with nVidia cards."
arch=('any')
url="http://willem.engen.nl/projects/disper/"
license=('GPL')
depends=('python')
source=(https://launchpad.net/~wvengen/+archive/+files/${pkgname}_${pkgver}.tar.gz)
md5sums=('906c1c2ac1e99c23c70eea4d14c15771')

build() {
  cd "$srcdir/$pkgname"

  make PREFIX="$pkgdir/usr" install
}

