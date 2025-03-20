# Maintainer: coldbug <coldBug@e.mail.de>

pkgname=python-htmlgenerator
_pkgname=htmlgenerator
pkgver=1.2.32
pkgrel=1
pkgdesc="A python package to generate HTML from a template which is defined through a tree of render-elements."
arch=('any')
url="https://github.com/basxsoftwareassociation/htmlgenerator"
license=('BSD-3-Clause')
groups=()
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::"https://github.com/basxsoftwareassociation/htmlgenerator/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('SKIP')


build() {
    cd $_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

