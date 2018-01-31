# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-isoweek
_pkgname=isoweek
pkgver=1.3.3
pkgrel=2
pkgdesc='Objects representing a week'
arch=(any)
url='https://github.com/gisle/isoweek'
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.python.org/packages/9a/79/68c68f92d8d55b3b790224bdba879a8fe77756a42c0b719e2e695756eb34/$_pkgname-$pkgver.tar.gz)
md5sums=(a34b0dd43fc48f35abd752fe22a5e037)
sha512sums=(11726fac93d8c9f24ddfeda06d843d81e7e5111f08fc56e830d05cd01369c27927f6cca2668cf2b60c836a675df89d95f9ea07593061e121c32f26d9084052c1)

package() {
  cd $srcdir/$_pkgname-$pkgver

  python setup.py install --root=$pkgdir --optimize=1
}
