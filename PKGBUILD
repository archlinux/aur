# Maintainer: Aetf <aetf at unlimitedcodeworks dot xyz>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=python-smartypants
_pkgname=smartypants
pkgver=1.8.6
pkgrel=1
pkgdesc="Python with the SmartyPants"
url="https://bitbucket.org/livibetter/smartypants.py"
license=('BSD')
arch=('any')
depends=('python')
source=(https://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('97484a618fc35508ca2961445f4aa597')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
