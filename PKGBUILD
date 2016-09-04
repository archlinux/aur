# Maintainer: Simon Zack <simonzack@gmail.com>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: Santi Villalba <sdvillal@gmail.com>

pkgname=python-guessit
pkgver=2.0.5
pkgrel=1
pkgdesc="A library for guessing information from video files."
arch=(any)
url="http://pypi.python.org/pypi/guessit"
license=(LGPL)
depends=(python python-babelfish python-dateutil python-rebulk)
conflicts=(${pkgname}-git)
source=(http://pypi.python.org/packages/source/g/guessit/guessit-${pkgver}.tar.gz)
sha256sums=('626e0024c5cca9b84883b65246e4f238e3f39064664486f69f086c853a63ff61')

package() {
    cd "${srcdir}/guessit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
