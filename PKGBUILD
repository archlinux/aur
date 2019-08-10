# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-pandas-docs
pkgver=0.25.0
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::http://pandas.pydata.org/pandas-docs/stable/pandas.zip")
sha256sums=('0f2e5a6e70a28ce627884a2b4c49ac101ed2f8762537e07d856d025ad2b135ff')

prepare() {
  rm ${pkgname}-${pkgver}.zip
}

package() {
  install -d "${pkgdir}"/usr/share/doc/python-pandas/html
  cp -a ./* "${pkgdir}"/usr/share/doc/python-pandas/html/
}
# vim:set ts=2 sw=2 et:
