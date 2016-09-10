# Maintainer: Simon Zack <simonzack@gmail.com>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: Santi Villalba <sdvillal@gmail.com>

pkgname=python-guessit
pkgver=2.1.0
pkgrel=1
pkgdesc="A library for guessing information from video files."
arch=(any)
url="http://pypi.python.org/pypi/guessit"
license=(LGPL)
depends=(python python-babelfish python-dateutil python-rebulk)
conflicts=(${pkgname}-git)
source=(https://github.com/guessit-io/guessit/archive/${pkgver}.tar.gz)
sha256sums=('3d43c9cc4157be1b2ac7c2057abc1faca692911ccbe6f40e60dd67283770f472')

package() {
    cd "${srcdir}/guessit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
