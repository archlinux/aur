# Maintainer: 71e6fd52 <DAStudio.71e6fd52@gmail.com>

pkgbase=('python-sockjs')
pkgname=('python-sockjs')
_module='sockjs'
pkgver='0.6.0'
pkgrel=1
pkgdesc="SockJS server implementation for aiohttp."
url="https://github.com/aio-libs/sockjs/"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/s/sockjs/sockjs-${pkgver}.tar.gz")
md5sums=('3ef9509c312d34cc2bb1b996330f2e0e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
