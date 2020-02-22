# Maintainer: gCurse <gcurse at web de>

pkgname=obapps3
pkgver=0.2.1
pkgrel=1
pkgdesc="Graphical tool for configuring application settings in Openbox. Version for python-wxpython >= 4.0, python3"
arch=('any')
url="https://github.com/gCurse/obapps3"
license=('MIT')
depends=('python' 'python-wxpython>=4.0' 'python-xlib')
conflicts=('obapps')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gCurse/obapps3/archive/v${pkgver}.tar.gz")
sha256sums=('f128da3bd03de1f9d8f0732c76f49fb442af1e7a6e29563c0bdd4a2b60e4bd1d')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root=${pkgdir}
}
