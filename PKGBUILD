# Maintainer: gCurse <gcurse at web de>

pkgname=obapps3
pkgver=0.2.2
pkgrel=1
pkgdesc="Graphical tool for configuring application settings in Openbox. Version for python-wxpython >= 4.0, python3"
arch=('any')
url="https://github.com/gCurse/obapps3"
license=('MIT')
depends=('python' 'python-wxpython>=4.0' 'python-xlib')
conflicts=('obapps')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gCurse/obapps3/archive/v${pkgver}.tar.gz")
sha256sums=('3974b00abdedb83b14a29c6866db45ff6f0ec6f8b64567da37244aa0d186c196')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root=${pkgdir}
}
