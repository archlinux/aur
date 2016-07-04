# Maintainer: renek <aur@spaceshore.net>
_pkgname=aioxmpp
pkgname=python-${_pkgname}
pkgver=0.6.0
pkgrel=1
pkgdesc="An XMPP library for use with Python 3.4 asyncio"
arch=('any')
url="https://github.com/horazont/aioxmpp"
license=('GPL3' 'Apache')
depends=('python' 'python-dnspython' 'libxml2' 'python-lxml' 'python-orderedset' 'python-tzlocal' 'python-pyopenssl' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiosasl' 'python-multidict')
makedepends=('python-setuptools')
source=("https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ca9b3d854108ef78ff3b8b3aff220e5e2fb15140e2dd5376db979b2698072da3ca02e5697c8fe7c5e0f42e678b01070d0f13463febf5eaafcf01605cffd5a5c6')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
