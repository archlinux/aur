# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Past Maintainer: Matthew Ellison <seglberg+aur@gmail.com>
pkgname=python-pyroute2
pkgver=0.5.5
pkgrel=1
pkgdesc="A pure Python netlink and Linux network configuration library"
arch=('any')
url="https://docs.pyroute2.org/"
license=('GPL2' 'Apache')
depends=('python' 'python2')
makedepends=(  'python' 'python2' 'python-setuptools' 'python2-setuptools')
_pkgname="pyroute2"
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('c7166e667b6fd21eefd34a01a0bba8467f3ae4d9526af32d5a6e96747c8aac7590da1097f1ca9b12390158e90ddfd6ff9f68c85765abbe179e8761658dda6b86'
            'SKIP')

package_python-pyroute2() {
        depends=('python')
        cd "${srcdir}/${_pkgname}-${pkgver}"
        python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pyroute2() {
        depends=('python2')
        cd "${srcdir}/${_pkgname}-${pkgver}"
        python2 setup.py install --root="${pkgdir}" --optimize=1
}
