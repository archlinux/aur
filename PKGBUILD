# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-sympy-docs
pkgver=1.11.1
pkgrel=1
pkgdesc="Documentation for Python Sympy module."
arch=('any')
url="http://www.sympy.org/"
license=('BSD')
options=('docs')
source=("${pkgname}-${pkgver}.zip::https://github.com/sympy/sympy/releases/download/sympy-${pkgver}/sympy-docs-html-${pkgver}.zip")
sha256sums=('be3bb7fef0e17cf437fa73354041ca84ae6329369c7a746a4d3d015bd09403e2')

package() {
    mkdir -p $pkgdir/usr/share/doc/python-sympy
    cp -a sympy-docs-html-$pkgver $pkgdir/usr/share/doc/python-sympy/html
}
# vim:set ts=4 sw=4 et:
