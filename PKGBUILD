# Maintainer: gCurse <gcurse at web de>

pkgname=obapps3
pkgver=0.2.3
pkgrel=1
pkgdesc="Graphical tool for configuring application settings in Openbox. Version for python-wxpython >= 4.0, python3"
arch=('any')
url="https://github.com/gCurse/obapps3"
license=('MIT')
depends=('python' 'python-wxpython>=4.0' 'python-xlib')
conflicts=('obapps')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gCurse/obapps3/archive/v${pkgver}.tar.gz")
sha256sums=('81e5c2c83365824f0ff78de1e151eb4ff2572ad79f83aa6c314e914a045db8a1')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root=${pkgdir}
}
