# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-paypalrestsdk"
pkgname="${_pkgname}"
pkgver=1.11.5
pkgrel=1
pkgdesc="Python SDK for PayPal RESTful APIs https://developer.paypal.com"
arch=('any')
url="https://github.com/paypal/PayPal-Python-SDK"
license=('SDK LICENSE')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://github.com/paypal/PayPal-Python-SDK/archive/v$pkgver.tar.gz)
md5sums=('a2480aba6b0ec2715440ff637c35b0f8')

package(){
    cd "${srcdir}/PayPal-Python-SDK-${pkgver}"
       python setup.py install --root="$pkgdir" --prefix=/usr
}
