# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-pandas-docs
pkgver=1.5.1
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::http://pandas.pydata.org/pandas-docs/version/${pkgver}/pandas.zip")
sha256sums=('20237db4bb0c1651376be940ad401cec61eae82d87d8b53f52c6ae48726ea4b7')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package() {
	install -d "${pkgdir}"/usr/share/doc/python-pandas/html
	cp -a ./* "${pkgdir}"/usr/share/doc/python-pandas/html/
}
# vim:set ts=4 sw=4 et:
