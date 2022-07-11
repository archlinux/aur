# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-pandas-docs
pkgver=1.4.3
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::http://pandas.pydata.org/pandas-docs/version/${pkgver}/pandas.zip")
sha256sums=('ecbfbe737db92652fcc9b2072c6efc586aca59607f4017c76b62e2defd1a485a')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package() {
	install -d "${pkgdir}"/usr/share/doc/python-pandas/html
	cp -a ./* "${pkgdir}"/usr/share/doc/python-pandas/html/
}
# vim:set ts=4 sw=4 et:
