# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-sympy-docs
pkgver=1.12
pkgrel=1
pkgdesc="Documentation for Python Sympy module."
arch=('any')
url="http://www.sympy.org/"
license=('BSD')
options=('docs')
source=("${pkgname}-${pkgver}.zip::https://github.com/sympy/sympy/releases/download/sympy-${pkgver}/sympy-docs-html-${pkgver}.zip")
sha256sums=('c1249cd14c5bc2ad20ce8d5fd4884bc51062bc0eddb79537e0996b05befe1097')

package() {
    mkdir -p $pkgdir/usr/share/doc/python-sympy
    cp -a sympy-docs-html-$pkgver $pkgdir/usr/share/doc/python-sympy/html
}
# vim:set ts=4 sw=4 et:
