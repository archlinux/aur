# $Id$
# Maintainer: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Fabio Volpe <volpefabio@gmail.com>
pkgname=python-sphinx
pkgver=1.0
pkgrel=1
pkgdesc="Python documentation generator"
arch=('any')
url="http://sphinx.pocoo.org/"
license=('GPL')
depends=('setuptools' 'pygments' 'docutils' 'python-jinja')
source=(http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz)
md5sums=('173baed4a71355fc3c908da1f6ab4156')

build() {
    cd "$srcdir/Sphinx-$pkgver"
    python setup.py install --root="$pkgdir" -O1 || return 1
}
