# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-paypalrestsdk"
pkgname="${_pkgname}"
pkgver=1.9.0
pkgrel=1
pkgdesc="Python SDK for PayPal RESTful APIs https://developer.paypal.com"
arch=('any')
url="https://github.com/paypal/PayPal-Python-SDK"
license=('PAYPAL')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://github.com/paypal/PayPal-Python-SDK/archive/v1.9.0.tar.gz)
md5sums=('0c67e67a6fc20c6ef65ec08029706fb2')

package(){
    cd "${srcdir}/PayPal-Python-SDK-${pkgver}"
       python setup.py install --root="$pkgdir" --prefix=/usr
}
