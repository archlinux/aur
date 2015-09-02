# Maintainer: Benjamin Copeland <ben@copeland.me.uk>
# Source: https://github.com/barnybug/cli53
pkgname=python2-cli53
pkgver=0.4.4
pkgrel=3
pkgdesc="Command line script to administer the Amazon Route 53 DNS service"
arch=(any)
url="https://pypi.python.org/pypi/cli53"
license=(BSD)
depends=(python2 python2-boto python2-dnspython)
makedepends=(python2-setuptools)
source=("https://pypi.python.org/packages/source/c/cli53/cli53-${pkgver}.tar.gz")
md5sums=(da4ba52e36a53aadaa537397e735fbfd)

package () {

    cd "${srcdir}/cli53-${pkgver}"
    /usr/bin/python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm0664 "${srcdir}/cli53-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
