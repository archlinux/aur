# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-lvm2py' 'python2-lvm2py')
pkgver=1.0
pkgrel=4
pkgdesc="A ctypes based binding for lvm’s liblvm2app api"
arch=('i686' 'x86_64')
url="http://xzased.github.com/lvm2py"
license=('GPL3')
depends=('python' 'python2' 'python-conversion' 'python2-conversion' 'lvm2')
makedepends=('python' 'python2' 'lvm2' 'python-setuptools' 'python2-setuptools')
_pkgname=lvm2py
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/l/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('2d3761880ce81a56062ffb489c6f8a0dfb99c0a6deb1b5ee8d5df5e121f25137ef0b49b7d9274cb549f370dfe72933b6bb196f7b2b6c3dec20491d42952ac90c'
            'SKIP')

package_python-lvm2py() {
  depends=('python' 'python-conversion')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-lvm2py() {
  depends=('python2' 'python2-conversion')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
