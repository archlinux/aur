# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-inotify' 'python2-inotify')
pkgver=0.2.10
pkgrel=3
pkgdesc="Access inotify events via python (this is NOT related to python-pynotify!)"
arch=('any')
url="https://pypi.python.org/pypi/inotify"
license=('GPL2')
depends=('python' 'python-nose' 'python2' 'python2-nose')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
_pkgname=inotify
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/i/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('d6ec9acbf4f2317cfe6b8caf9b00386bcaf2da0263089618f6856cc05ca9ec4358206cb88ab8fe363a6f81e69e3c175b13d670ef317ffb2de7b7ab5b00303d27'
            'SKIP')

package_python-inotify() {
	depends=('python' 'python-nose')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-inotify() {
	depends=('python2' 'python2-nose')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
