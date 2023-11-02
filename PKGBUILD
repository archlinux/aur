# Maintainer: gilcu3
_pkgname=ctranslate2
pkgname=python-$_pkgname-bin
pkgver=3.18.0
pkgrel=1
pkgdesc="CTranslate2 is a C++ and Python library for efficient inference with Transformer models."
arch=('x86_64')
url="https://github.com/OpenNMT/CTranslate2"
license=('MIT')
provides=("ctranslate2")
conflicts=('ctranslate2-git' 'python-ctranslate2-git')
depends=('python>=3.7')
makedepends=('python-pip')

package() {
    pip install --upgrade --no-deps --ignore-installed --no-warn-script-location --root=$pkgdir $_pkgname==$pkgver
}
