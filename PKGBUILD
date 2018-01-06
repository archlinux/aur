# Maintainer: 71e6fd52 <DAStudio.71e6fd52@gmail.com>

pkgbase=('python-aioamqp')
pkgname=('python-aioamqp')
_module='aioamqp'
pkgver='0.10.0'
pkgrel=1
pkgdesc="AMQP implementation using asyncio"
url="https://github.com/polyconseil/aioamqp"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/aioamqp/aioamqp-${pkgver}.tar.gz")
md5sums=('ecfb860d9cfd1cf72b11f16ebb804171')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
