# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-pandas-docs
pkgver=2.1.2
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::http://pandas.pydata.org/pandas-docs/version/${pkgver}/pandas.zip")
sha256sums=('b1015dcc4ccb1d7870e78f18349d507f239b772ed4b234ce29f08c3c070a4758')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package() {
	install -d "${pkgdir}"/usr/share/doc/python-pandas/html
	cp -a ./* "${pkgdir}"/usr/share/doc/python-pandas/html/
}
# vim:set ts=4 sw=4 et:
