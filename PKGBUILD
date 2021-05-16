# Maintainer: gCurse <gcurse at web de>

pkgname=obapps3
pkgver=0.2.4
pkgrel=1
pkgdesc="Graphical tool for configuring application settings in Openbox. Version for python-wxpython >= 4.0, python3"
arch=('any')
url="https://github.com/gCurse/obapps3"
license=('MIT')
depends=('python' 'python-wxpython>=4.0' 'python-xlib')
conflicts=('obapps')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gCurse/obapps3/archive/v${pkgver}.tar.gz")
sha256sums=('96198537c9b1db4ab67c7af55c28a16a0c5a2404eb53e135a97f4843cf30287b')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root=${pkgdir}
}
