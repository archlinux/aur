# Maintainer: renek <aur@spaceshore.net>
_pkgname=aioxmpp
pkgname=python-${_pkgname}
pkgver=0.5.4
pkgrel=1
pkgdesc="An XMPP library for use with Python 3.4 asyncio"
arch=('any')
url="https://github.com/horazont/aioxmpp"
license=('GPL3' 'Apache')
depends=('python' 'python-dnspython' 'libxml2' 'python-lxml' 'python-orderedset' 'python-tzlocal' 'python-pyopenssl' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiosasl')
makedepends=('python-setuptools')
source=("https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0e61404fa0ca519601ae3772f3c4d2233d2b9e1bd1c0d12c5734e788016ac400a1812ee00ebb96aef0869f9ae946bbb5819c6209169fd6f5398f2323a9917dc7')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
