#!/bin/bash
# Maintainer: Benevant Mathew <benevantmathewv@gmail.com>

pkgname=auraview
pkgver=0.1.0
pkgrel=1
pkgdesc="a minimal, elegant image viewer inspired by the art of melody."
arch=('any')
url="https://pypi.org/project/auraview/"
license=('MIT')
depends=('python' 'python-pillow' 'python-pandas' 'python-pillow_heif')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('47be6d46cbbee36ed1d64010335b53a222f8e57110244db032895efad034df7c')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
