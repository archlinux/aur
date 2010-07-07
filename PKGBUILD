# $Id$
# Maintainer: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgname=python-sphinx
pkgver=0.6.7
pkgrel=1
pkgdesc="Python documentation generator"
arch=('any')
url="http://sphinx.pocoo.org/"
license=('GPL')
depends=('setuptools' 'pygments' 'docutils' 'python-jinja')
source=(http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz)
md5sums=('54c3e4045ee4a4997a50c225f36e92fd')

build() {
    cd "$srcdir/Sphinx-$pkgver"
    python setup.py install --root="$pkgdir" -O1 || return 1
}
