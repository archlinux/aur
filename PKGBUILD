# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-pyrad' 'python2-pyrad')
pkgver=2.2
pkgrel=2
pkgdesc="Python RADIUS Implementation"
arch=('any')
url="https://pypi.org/project/pyrad/"
license=('CUSTOM')
depends=('python' 'python2')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
_pkgname=pyrad
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('916895681bc8152bb1698ec2699139ea20566fe294e0c983fd4a27bd0cf927c086e3aff43ca7aa27a0d38fbf6ad09cf21aaaea0f2ad000efd4456d3fec11a95f'
            'SKIP')

package_python-pyrad() {
  depends=('python' 'mdadm')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pyrad() {
  depends=('python2' 'mdadm')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
