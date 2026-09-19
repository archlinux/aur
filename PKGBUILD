#!/bin/bash
# Maintainer: Benevant Mathew <benevantmathewv@gmail.com>

pkgname=auraview
pkgver=1.1.0
pkgrel=1
pkgdesc="a minimal, elegant image viewer inspired by the art of melody."
arch=('any')
url="https://pypi.org/project/auraview/"
license=('MIT')
depends=('python' 'python-pandas' 'python-piexif' 'python-pillow' 'python-pillow-heif' 'python-send2trash' 'python-tkcalendar' 'python-natsort')
makedepends=('python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1c2f2f47c604d05319c1e8e1e4ab00498a30c28469e911f9e045be481554a6ec')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
