# $Id$
# Maintainer: Pedro Martinez-Julia <pedromj@um.es>
# Contributor: Leontius Adhika Pradhana <leon@leapon.net>

pkgname=python2-rdfextras
pkgver=0.3
pkgrel=1
pkgdesc="A collection of extra utilities based on RDFLib"
url="http://code.google.com/p/rdfextras/"
license=('BSD')
depends=('python2' 'python2-rdflib' 'python2-pyparsing')
makedepends=('python2-distribute')
arch=('any')
replaces=('rdfextras')
provides=('rdfextras')
conflicts=('rdfextras')
source=("https://github.com/downloads/RDFLib/rdfextras/rdfextras-${pkgver}.tar.gz")
sha1sums=('306e814aacb9e0db211b0652c0dc687e8ea43e63')

package() {
  cd "${srcdir}/rdfextras-${pkgver}"
  python2 setup.py install --root=$pkgdir --optimize=1
}
