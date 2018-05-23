# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-pandas-docs
pkgver=0.23.0
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::http://pandas.pydata.org/pandas-docs/stable/pandas.zip")
sha256sums=('0c11cde5b842a448a3b1cf169e83748d04dfa21013111dd4c3196650c3536efc')

prepare() {
  rm ${pkgname}-${pkgver}.zip
}

package() {
  install -d "${pkgdir}"/usr/share/doc/python-pandas/html
  cp -a ./* "${pkgdir}"/usr/share/doc/python-pandas/html/
}
# vim:set ts=2 sw=2 et:
