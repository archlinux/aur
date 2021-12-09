# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-sympy-docs
pkgver=1.9
pkgrel=1
pkgdesc="Documentation for Python Sympy module."
arch=('any')
url="http://www.sympy.org/"
license=('BSD')
options=('docs')
source=("${pkgname}-${pkgver}.zip::https://github.com/sympy/sympy/releases/download/sympy-${pkgver}/sympy-docs-html-${pkgver}.zip")
sha256sums=('3ca9e0a07e0eb2c8d9a39d640a486060b154a4866eba6e051b5add6a31b34f95')

package() {
    mkdir -p $pkgdir/usr/share/doc/python-sympy
    cp -a sympy-docs-html-$pkgver $pkgdir/usr/share/doc/python-sympy/html
}
# vim:set ts=4 sw=4:
