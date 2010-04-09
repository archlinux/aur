# $Id$
# Maintainer: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgname=python-sphinx
pkgver=0.6.5
pkgrel=1
pkgdesc="Python documentation generator"
arch=('any')
url="http://sphinx.pocoo.org/"
license=('GPL')
depends=('setuptools' 'pygments' 'docutils' 'python-jinja')
source=(http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz)
md5sums=('86dd5dbd55cb44d1f8091a4a1c3743b2')

build() {
    cd "$srcdir/Sphinx-$pkgver"
    python setup.py install --root="$pkgdir" -O1 || return 1
}
