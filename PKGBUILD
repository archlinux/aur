# Maintainer: Maximiliano Christener <christener at outlook dot com dot ar>
pkgname=python-pandas-docs
pkgver=2.3.1
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::http://pandas.pydata.org/pandas-docs/version/${pkgver}/pandas.zip")
sha256sums=('6eeda58bf9bf4a72bccab640d3dbe4e73e5ee82b2625774be284680c52ed6f70')

package() {
	install -d "${pkgdir}"/usr/share/doc/python-pandas/html
	cp -a ./* "${pkgdir}"/usr/share/doc/python-pandas/html/
}
# vim:set ts=4 sw=4 et:
