$Id$
# Maintainer: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgname=python-sphinx
pkgver=0.6.4
pkgrel=1
pkgdesc="Python documentation generator"
arch=('any')
url="http://sphinx.pocoo.org/"
license=('GPL')
depends=('python>=2.4' 'pygments' 'docutils' 'python-jinja')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz)
md5sums=('a65e0bcff6f79a7c013220d00ea137ad')

build() {
    cd "$startdir/src/Sphinx-$pkgver"
    python setup.py build || return 1
    python setup.py install --root=$pkgdir || return 1
}
