#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-sockjs-tornado')
pkgname=('python-sockjs-tornado')
_module='sockjs-tornado'
pkgver='1.0.3'
pkgrel=1
pkgdesc="SockJS python server implementation on top of Tornado framework"
url="http://github.com/mrjoes/sockjs-tornado/"
depends=('python' 'python-tornado')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/s/sockjs-tornado/sockjs-tornado-${pkgver}.tar.gz")
sha256sums=('6d726e61bd1d884bd1c1788727fce1b9f24fd69062dda0daf61a476b01718e99')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
