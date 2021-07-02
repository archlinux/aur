_pkgname=py-lru-cache
__pkgname=py_lru_cache
pkgname=python-${_pkgname}
pkgver=0.1.4
pkgrel=1
pkgdesc="LRU cache for python. Provides a dictionary-like object as well as a method decorator."
arch=("any")
url="https://github.com/stucchio/Python-LRU-cache"
license=("GPL3")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/p/${__pkgname}/${__pkgname}-${pkgver}.tar.gz")
sha256sums=("02df33684e13e1a78987bf9f8b0ac90210952857d9d12d1cf83fd0c906456af0")

build() {
    cd "${__pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${__pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
}
