# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-rjsmin"
pkgname="${_pkgname}"
pkgver=1.0.9
pkgrel=1
pkgdesc="rJSmin is a javascript minifier written in python"
arch=('i686' 'x86_64')
url="http://opensource.perlig.de/rjsmin/"
license=('APACHE')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(http://storage.perlig.de/rjsmin/rjsmin-${pkgver}.tar.gz)
md5sums=('bb8b37f1d9d816017ab9237cec290fbe')

package() {
    cd "${srcdir}/rjsmin-${pkgver}"

      python setup.py install --root="$pkgdir" --prefix=/usr
}
