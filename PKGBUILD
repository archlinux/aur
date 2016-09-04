# Maintainer: Simon Zack <simonzack@gmail.com>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: Santi Villalba <sdvillal@gmail.com>

pkgname=python-guessit
pkgver=2.0.4
pkgrel=1
pkgdesc="A library for guessing information from video files."
arch=(any)
url="http://pypi.python.org/pypi/guessit"
license=(LGPL)
depends=(python python-babelfish python-dateutil python-rebulk)
conflicts=(${pkgname}-git)
source=(http://pypi.python.org/packages/source/g/guessit/guessit-${pkgver}.tar.gz)
sha256sums=('4f72e21fca9c294651abee26554e2ad778220d90a84f6e1195299a7ec17accb1')

package() {
    cd "${srcdir}/guessit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
