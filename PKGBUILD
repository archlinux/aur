# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-sympy-docs
pkgver=1.10.1
pkgrel=1
pkgdesc="Documentation for Python Sympy module."
arch=('any')
url="http://www.sympy.org/"
license=('BSD')
options=('docs')
source=("${pkgname}-${pkgver}.zip::https://github.com/sympy/sympy/releases/download/sympy-${pkgver}/sympy-docs-html-${pkgver}.zip")
sha256sums=('f8e0a5de3d8e804239a3e698893176a54ab8bab0360f652f5020761879fbd64a')

package() {
    mkdir -p $pkgdir/usr/share/doc/python-sympy
    cp -a sympy-docs-html-$pkgver $pkgdir/usr/share/doc/python-sympy/html
}
# vim:set ts=4 sw=4 et:
