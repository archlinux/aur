# Maintainer: Jacob Mourelos <jacob.mourelos@gmail.com>

pkgname=doconv
pkgver=0.1.7
pkgrel=1
pkgdesc='A tool for document file format conversion'
arch=('any')
url='https://github.com/jmourelos/doconv'
license=('BSD')
depends=('python2' 'python2-networkx' 'python2-stevedore' 'python2-lxml')
optdepends=('asciidoc')
makedepends=('python2-setuptools')

source=("https://files.pythonhosted.org/packages/e3/07/8237b170c675406e72ee737521eef3e34624d449796b0f6ab06a15d8543a/${pkgname}-${pkgver}.tar.gz")

package() { 
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 setup.py -q install --root="${pkgdir}" --optimize=1
}

sha256sums=('23afd8985c971d22621e5df43e582bee9a056ce900e23685dd393c0272d5df0e')
