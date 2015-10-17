# Maintainer: Swift Geek
pkgname=python-blogofile
_pipname=Blogofile
pkgver=0.8.3
pkgrel=1
pkgdesc="A static website compiler and blog engine"
arch=('any')
url="http://www.blogofile.com/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/B/${_pipname}/${_pipname}-${pkgver}.tar.gz")
md5sums=('b174c0e58a62a091823e23411061e59c')

package() {
  cd "$srcdir/$_pipname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
