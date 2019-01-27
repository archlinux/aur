# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-pandas-docs
pkgver=0.24.0
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::http://pandas.pydata.org/pandas-docs/stable/pandas.zip")
sha256sums=('680b470f3af55ffb6bffe6df37c401937b105723a71acd27eb9cf45bffa98c5b')

prepare() {
  rm ${pkgname}-${pkgver}.zip
}

package() {
  install -d "${pkgdir}"/usr/share/doc/python-pandas/html
  cp -a ./* "${pkgdir}"/usr/share/doc/python-pandas/html/
}
# vim:set ts=2 sw=2 et:
