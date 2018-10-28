# Maintainer: 71e6fd52 <DAStudio.71e6fd52@gmail.com>

pkgbase=('python-aioamqp')
pkgname=('python-aioamqp')
_module='aioamqp'
pkgver='0.11.0'
pkgrel=1
pkgdesc="AMQP implementation using asyncio"
url="https://github.com/polyconseil/aioamqp"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/aioamqp/aioamqp-${pkgver}.tar.gz")
md5sums=('5495653f94c6f87eb1c3ca85c4fa8bae')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
