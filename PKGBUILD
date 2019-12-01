# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-robot-detection')
_pkgbase='robot-detection'
pkgver=0.4.0
pkgrel=1
pkgdesc="Library for detecting if a HTTP User Agent header is likely to be a bot"
arch=(any)
url="https://pypi.python.org/pypi/robot-detection"
license=('GPL')
options=(!emptydirs)
source=("https://github.com/rory/robot-detection/archive/v${pkgver}.tar.gz")
sha256sums=('9fa0423a890fd5856e5494076ba6e67abd2f4173d91c8b292819dfaa815b5060')
makedepends=('python-setuptools')

package_python-robot-detection() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
