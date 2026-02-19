#!/bin/bash
# Maintainer: Benevant Mathew <benevantmathewv@gmail.com>

pkgname=postmansub
pkgver=0.3
pkgrel=1
pkgdesc="A small package to sent post requests."
arch=('any')
url="https://pypi.org/project/postmansub/"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/42/95/96c9dca6be636ff05ea930115439c81b41f5ce0317c308d2407d175bcdab/postmansub-0.3.tar.gz")
sha256sums=('1afbc4925747f8e10b6d6bfa3003b8f59d674ce415d04eaa04ad107c03735f38')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
