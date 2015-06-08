# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: fwojciec

pkgname=python-elementtree
pkgver=1.2.6
pkgrel=4
pkgdesc="Provides light-weight components for working with XML"
arch=('i686' 'x86_64')
license=('PYTHON')
url="http://effbot.org/zone/element-index.htm"
depends=('python2')
source=(http://effbot.org/media/downloads/elementtree-${pkgver}-20050316.tar.gz)
md5sums=('e1b21716be8bfff8bf192fc3880ad008')

package() {
    cd $srcdir/elementtree-${pkgver}*
    python2 setup.py install --root=$pkgdir
}

