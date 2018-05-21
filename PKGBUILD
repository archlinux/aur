# Maintainer: Marcus Scheunemann
pkgname=python-markdown-math
pkgver=0.5
pkgrel=1
pkgdesc="Math extension for Python-Markdown"
arch=('any')
url="https://github.com/mitya57/python-markdown-math"
makedepends=('python-setuptools')
source=("https://github.com/mitya57/python-markdown-math/archive/${pkgver}.tar.gz")
sha256sums=('2ec21c037e514761b25d25837a05593be09375a74ce8507c748a836e8ab87e11')

package() {
    cd "python-markdown-math-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}