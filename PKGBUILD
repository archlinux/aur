# Contributor: Paul Colomiets pc at gafol dot net
# Maintainer: Oliver Mangold omangold at gmail dot com
pkgname=python2-plex
pkgver=2.0.0dev
pkgrel=1
pkgdesc="A lexical analysis module for Python."
arch=('any')
url="http://www.cosc.canterbury.ac.nz/greg.ewing/python/Plex/"
license=('LGPL')
makedepends=('python')
source=("http://pypi.python.org/packages/source/p/plex/plex-${pkgver}.tar.gz")
sha256sums=('07b4ce0ea8fe5928f5c8abdbf08b80edfd44ea90cc9c8c2fe233f59890498d28')

build() {
    cd "$srcdir/plex-${pkgver}"
    python2 setup.py build
}

package() {
    cd "$srcdir/plex-${pkgver}"
    python2 setup.py install --root="$pkgdir"
}

