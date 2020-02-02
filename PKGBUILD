# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-sympy-docs
pkgver=1.5
pkgrel=1
pkgdesc="Documentation for Python Sympy module."
arch=('any')
url="http://www.sympy.org/"
license=('BSD')
options=('docs')
source=("${pkgname}-${pkgver}.zip::https://github.com/sympy/sympy/releases/download/sympy-$pkgver/sympy-docs-html-$pkgver.zip")
sha256sums=('b880a0819efac35661e59ec4341e3df7667e51f952033b12a91361f792458639')

package() {
    mkdir -p $pkgdir/usr/share/doc/python-sympy
    cp -a sympy-docs-html-$pkgver $pkgdir/usr/share/doc/python-sympy/html
}
# vim:set ts=4 sw=4 et:
