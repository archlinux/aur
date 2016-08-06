# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-paypalrestsdk"
pkgname="${_pkgname}"
pkgver=1.11.7
pkgrel=1
pkgdesc="Python SDK for PayPal RESTful APIs https://developer.paypal.com"
arch=('any')
url="https://github.com/paypal/PayPal-Python-SDK"
license=('SDK LICENSE')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://github.com/paypal/PayPal-Python-SDK/archive/v$pkgver.tar.gz)
md5sums=('5efd8beec9443440b763f53a015b9084')

package(){
    cd "${srcdir}/PayPal-Python-SDK-${pkgver}"
       python setup.py install --root="$pkgdir" --prefix=/usr
}
