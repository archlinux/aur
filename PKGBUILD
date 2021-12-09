# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-pandas-docs
pkgver=1.3.4
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::http://pandas.pydata.org/pandas-docs/version/${pkgver}/pandas.zip")
sha256sums=('c36559fb92a22015864a091d4c7a9c995fdc9a57a4f0e5bceb6d681587f78f66')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package() {
	install -d "${pkgdir}"/usr/share/doc/python-pandas/html
	cp -a ./* "${pkgdir}"/usr/share/doc/python-pandas/html/
}
# vim:set ts=4 sw=4:
