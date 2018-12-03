# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Past Maintainer: Matthew Ellison <seglberg+aur@gmail.com>
pkgname=python-pyroute2
pkgver=0.5.3
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
sha512sums=('1a9d466e60d3884ae5d187554c2d01f587210f4af9b644efd8ec1e029de35145253938be35c2355b110c59a7299b833c49c0ea256060549d2d3df2c49f165872'
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
