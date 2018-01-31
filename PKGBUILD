# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-pandas-summary
_pkgname=pandas-summary
pkgver=0.0.41
pkgrel=1
pkgdesc='An extension to pandas dataframes describe function'
arch=(any)
url='https://github.com/mouradmourafiq/pandas-summary'
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.python.org/packages/3d/a7/0364272be0c6561c45d67edec8a7bf0532d56b830438168f9078f7720f63/$_pkgname-$pkgver.tar.gz)
md5sums=(ff2b4ae3e55d48e10029dcd231f93167)
sha512sums=(02c3a767f2f41abb5e8d0271c1bf09904ddf94a47cc85c298d10436e744a44e980c9a2a1bee1026748fed4ba7d2d02fd28e3aa25b280b43a26daf40d8f826873)

package() {
  cd $srcdir/$_pkgname-$pkgver

  python setup.py install --root=$pkgdir --optimize=1
}
