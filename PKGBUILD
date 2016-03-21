# Maintainer: Caleb Maclennan <caleb@alerque.com>
pkgname=python-usfm2osis
_pypiname=${pkgname#python-}
pkgver=0.6.1
pkgrel=1
pkgdesc="Tools for converting Bibles from USFM to OSIS XML"
arch=('any')
url="https://github.com/chrislit/usfm2osis"
license=('GPLv3')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/u/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('28d55660dfb9363c8ce30daf00b57492')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et: 
