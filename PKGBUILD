# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-pyhcl
pkgver=0.4.2
pkgrel=2
pkgdesc="Parse HCL (HashiCorp Configuration Language) into JSON"
arch=('any')
url="https://pypi.org/project/pyhcl/"
license=('MPL2')
depends=('python' 'python2')
makedepents=('python' 'python2' 'python-setuptools' 'python2-setuptools')
_pkgname=pyhcl
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('16b280d6db2cd2444463d56fba1706a11b5db438a2f9f979143c95a735c3132e9a6a68938c218490925cd067b0898600fa459ba3ac6ac5fc75756aaf1a45d79e'
            'SKIP')

package_python-pyhcl() {
  depends=('python')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pyhcl() {
  depends=('python2')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

