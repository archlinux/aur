# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-sympy-docs
pkgver=1.4
pkgrel=1
pkgdesc="Documentation for Python Sympy module."
arch=('any')
url="http://www.sympy.org/"
license=('BSD')
options=('docs')
source=("${pkgname}-${pkgver}.zip::https://github.com/sympy/sympy/releases/download/sympy-$pkgver/sympy-docs-html-$pkgver.zip")
sha256sums=('d07a2ecd4377214ae9375c7af73fac8e6d2e1574da7c6d9933718818ebc61935')

package() {
  mkdir -p $pkgdir/usr/share/doc/python-sympy
  cp -a sympy-docs-html-$pkgver $pkgdir/usr/share/doc/python-sympy/html
}
# vim:set ts=2 sw=2 et:
