# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild {at} gadz {dot} org>

pkgname=python-sklearn-pandas
_pkgname=sklearn-pandas
pkgver=1.6.0
pkgrel=2
pkgdesc='Pandas integration with scikit-learn'
arch=(any)
url='https://github.com/paulgb/sklearn-pandas'
license=(Custom)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.python.org/packages/84/80/50352a946997f04b3cce0cf128eb53092f1a03cd4c23bb52d23c937471bb/$_pkgname-$pkgver.tar.gz)
md5sums=(f82dbad28429298dc47a140d7f0006fc)
sha512sums=(45c6457ea95d426973efce4a630c674a4a70193eeae5198f35174a70da2e71c407f888641987582723165874be8fdaeccd1c8c4345be6417c4d1d43e41c1b7d5)

package() {
  cd $srcdir/$_pkgname-$pkgver

  python setup.py install --root=$pkgdir --optimize=1
}
