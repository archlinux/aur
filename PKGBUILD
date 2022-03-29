# Maintainer: gCurse <gcurse at web de>

pkgname=obapps3
pkgver=0.2.5
pkgrel=1
pkgdesc="Graphical tool for configuring application settings in Openbox. Version for python-wxpython >= 4.0, python3"
arch=('any')
url="https://github.com/gCurse/obapps3"
license=('MIT')
depends=('python' 'python-wxpython>=4.0' 'python-xlib')
conflicts=('obapps')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gCurse/obapps3/archive/v${pkgver}.tar.gz")
sha256sums=('bbfed52f90e1688eb66444d257a4580eeb924a91f92786cc5759f14f2b30e5b7')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root=${pkgdir}
}
