# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-pycountry"
pkgname="${_pkgname}"
pkgver=1.15
pkgrel=1
pkgdesc="ISO country, subdivision, language, currency and script definitions and their translations"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/pycountry/"
license=('LGPL 2.1')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://pypi.python.org/packages/source/p/pycountry/pycountry-${pkgver}.tar.gz")
md5sums=('aab287db70017fcaaefdabb6a95fa21d')

package() {
    cd "${srcdir}/pycountry-${pkgver}"

      python setup.py install --root="$pkgdir" --prefix=/usr
}
