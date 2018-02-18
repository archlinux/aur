# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: McNoggins <gagnon88 at Gmail dot com>

pkgname=python-imread
pkgver=0.6.1
pkgrel=1
pkgdesc='mahotas-imread: A library to read & write to numpy arrays'
arch=(any)
url='http://luispedro.org/software/imread/'
license=(MIT)
depends=(python libpng libtiff libwebp python-numpy)
makedepends=(python-setuptools)
provides=(python-imread)
source=(https://pypi.python.org/packages/2b/2f/e4111c2aeb24c54e202bf43a692d71a1e550e8b7e9869a7ea06a39e15206/imread-$pkgver.tar.gz)
md5sums=(abd83d45006e2f6a340423529858a121)
sha512sums=(22fd94c88f5e77947518711efcdbb6f2a7e25eda236422380e1bc5227f779b800387f996a9a25d3e3e16ff1784fbd391c0edb49216584c6268b9f4cba96beb61)

package() {
  cd $srcdir/imread-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
