# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-pandas-docs
pkgver=1.0.1
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::http://pandas.pydata.org/pandas-docs/stable/pandas.zip")
sha256sums=('57202d20f8d168d3a40bcf1fd4b44192032d18a6e1c45ca0bfefb4479824e7ca')

prepare() {
  rm ${pkgname}-${pkgver}.zip
}

package() {
  install -d "${pkgdir}"/usr/share/doc/python-pandas/html
  cp -a ./* "${pkgdir}"/usr/share/doc/python-pandas/html/
}
# vim:set ts=2 sw=2 et:
