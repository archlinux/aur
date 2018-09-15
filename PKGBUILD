# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-sympy-docs
pkgver=1.3
pkgrel=1
pkgdesc="Documentation for Python Sympy module."
arch=('any')
url="http://www.sympy.org/"
license=('BSD')
options=('docs')
source=("${pkgname}-${pkgver}.zip::https://github.com/sympy/sympy/releases/download/sympy-$pkgver/sympy-docs-html-$pkgver.zip")
sha256sums=('3e20d0258fb99f421b17f99b02ef5e523b94a0bcd31577ed9e037458a010c27c')

package() {
  mkdir -p $pkgdir/usr/share/doc/python-sympy
  cp -a sympy-docs-html-$pkgver $pkgdir/usr/share/doc/python-sympy/html
}
# vim:set ts=2 sw=2 et:
