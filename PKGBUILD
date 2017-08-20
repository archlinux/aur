# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-inotify
pkgver=0.2.8
pkgrel=2
pkgdesc="Access inotify events via python (this is NOT related to python-pynotify!)"
arch=( 'i686' 'x86_64' )
url="https://pypi.python.org/pypi/inotify"
license=( 'GPL2' )
depends=( 'python' 'python2' )
makedepends=( 'python' 'python2' )
_pkgname=inotify
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/i/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('06f0df041cd5071a1e844f329fa3828a4082d6b2d530e118cafb4e4a19635a0502cc0cdcb2c108fcfa51cd7cc8f3e3e33292d11136b8f068df544a1addfcc54d'
            'SKIP')

package_python-inotify() {
	depends=('python')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-inotify() {
	depends=('python2')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
