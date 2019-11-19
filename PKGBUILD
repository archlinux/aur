# Maintainer: Vinicius Correa <vinicius.correa at zoho dot com>
_pkgname=kiwi-gtk
pkgname=python-kiwi-gtk
pkgver=3.0.3
pkgrel=1
pkgdesc="A framework and a set of enhanced widgets based on PyGTK"
arch=('any')
url="https://www.stoq.com.br"
license=('LGPL')
depends=('python' 'python-setuptools')
optdepends=('')
conflicts=('python-stoq-kiwi')
source=("https://pypi.python.org/packages/source/k/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('cd129fd212e803944dec40024f56d696')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
