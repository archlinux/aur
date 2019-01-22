# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild {at} gadz {dot} org>

pkgname=python-sklearn-pandas
_pkgname=sklearn-pandas
_release_commig_hash=08ed9d02b1e1cb8ac97b1f4c44aa04831675ffa8
pkgver=1.8.0
pkgrel=1
pkgdesc='Pandas integration with scikit-learn'
arch=(any)
url='https://github.com/paulgb/sklearn-pandas'
license=(Custom)
depends=(python)
makedepends=(python-setuptools)
#source=(https://pypi.python.org/packages/84/80/50352a946997f04b3cce0cf128eb53092f1a03cd4c23bb52d23c937471bb/$_pkgname-$pkgver.tar.gz)
source=("git+https://github.com/scikit-learn-contrib/sklearn-pandas#commit=${_release_commig_hash}")
sha512sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
# vim:set ts=2 sw=2 et:
