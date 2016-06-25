# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=python-semantic_version
_pkgname=semantic_version
pkgver=2.5.0
pkgrel=4
pkgdesc="This is a Python library for parsing version strings via SemVer."
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/semantic_version/"
license=('custom')
depends=('python')
source=("https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
	"${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('3e45e12a1c5472953847c81b230c43e69173bfb215562163fe463e4de20dde997115d1297cabc2508ea6960b63afefea2a49e59b8cc9de23eaa3076493f52b72'
            'SKIP')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}

