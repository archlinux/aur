# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-hashid
pkgver=3.1.4
pkgrel=2
pkgdesc="Identify the different types of hashes used to encrypt data and especially passwords"
arch=( 'i686' 'x86_64' )
url="https://github.com/psypanda/hashID"
license=( 'GPL3' )
depends=( 'python' 'python2' )
makedepends=( ''python-distribute'' ''python2-distribute'' ''python'' ''python2'' )
_pkgname="hashID"
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/h/${_pkgname}/${_pkgname}-${pkgver}.zip"
        "${_pkgname}-${pkgver}.zip.sig")
sha512sums=('598538454578cf71872950d43aab9fa8d274983646e2dc94462e5d3dcb0bee04c923cf8f6769cf5aa1a9d0e825c97cfa2560a11beebf1aeccc40648c90d03567'
            'SKIP')

package_python-hashid() {
        depends=('python')
        cd "${srcdir}/${_pkgname}-${pkgver}"
        python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-hashid() {
        depends=('python2')
        cd "${srcdir}/${_pkgname}-${pkgver}"
        python2 setup.py install --root="${pkgdir}" --optimize=1
}
