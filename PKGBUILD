# Maintainer: Jacob Mourelos <jacob.mourelos@gmail.com>

pkgname=doconv
pkgver=0.1.6
pkgrel=3
pkgdesc='A tool for document file format conversion'
arch=('any')
url='https://github.com/jmourelos/doconv'
license=('BSD')
depends=('python2' 'python2-networkx' 'python2-stevedore' 'python2-lxml')
optdepends=('asciidoc')
makedepends=('python2-setuptools')

source=("https://pypi.org/packages/source/d/doconv/${pkgname}-${pkgver}.tar.gz")

package() { 
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 setup.py -q install --root="${pkgdir}" --optimize=1
}

md5sums=('dd78e24c650f1b0a5352b78c784d89c6')
