# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-pandas-docs
pkgver=0.25.2
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::http://pandas.pydata.org/pandas-docs/stable/pandas.zip")
sha256sums=('e25e5ab48e915eab8148182eb3eff8841f5bb9a3c0e341290878fda7e23ee63f')

prepare() {
  rm ${pkgname}-${pkgver}.zip
}

package() {
  install -d "${pkgdir}"/usr/share/doc/python-pandas/html
  cp -a ./* "${pkgdir}"/usr/share/doc/python-pandas/html/
}
# vim:set ts=2 sw=2 et:
