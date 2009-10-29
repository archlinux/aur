$Id$
# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgname=python-sphinx
pkgver=0.6.3
pkgrel=1
pkgdesc="Python documentation generator"
arch=('i686' 'x86_64')
url="http://sphinx.pocoo.org/"
license=('GPL')
depends=('python>=2.4' 'pygments' 'docutils' 'python-jinja')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz)
md5sums=('b8ba063eeeaf818a7ea07fd28d9614a9')

build() {
    cd "$startdir/src/Sphinx-$pkgver"

    python setup.py build || return 1
    python setup.py install --root=$pkgdir || return 1
}
