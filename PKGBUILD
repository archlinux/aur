#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-sockjs-tornado')
pkgname=('python-sockjs-tornado')
_module='sockjs-tornado'
pkgver='1.0.2'
pkgrel=1
pkgdesc="SockJS python server implementation on top of Tornado framework"
url="http://github.com/mrjoes/sockjs-tornado/"
depends=('python' 'python-tornado')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/s/sockjs-tornado/sockjs-tornado-${pkgver}.tar.gz")
sha256sums=('dbfbdc837234cdcb3b0c5d62bdfce7255a2d2e22332f3b15a2a0320101f18c96')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
