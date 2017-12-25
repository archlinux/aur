# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-inotify' 'python2-inotify')
pkgver=0.2.9
pkgrel=1
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
sha512sums=('d2a8e104c31b4c8f9aebcc948bc08780ccac229fe1f7a21e1edd950e6d3fefcc04239ff7fea8ec5ebf8fb97ff67ae4d683e8b0c053c2ccf6249787525d44c58e'
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
