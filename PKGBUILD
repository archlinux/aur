# Maintainer Ruijie Yu

pkgname=python-typish
_pkgname="${pkgname#python-}"
pkgver=1.7.0
pkgrel=1
pkgdesc='Functionality for types'
arch=(any)
url='https://github.com/ramonhagenaars/typish'
license=(MIT)

depends=(
    'python>=3'
)

makedepends=(
    python-pip
    python-wheel
)

checkdepends=(
    python-numpy
    # 'python-nptyping>=1.1.0'
    python-pycodestyle
    python-pylint
    mypy
    python-pytest
    # python-coverage
)

source=(
    'https://github.com/ramonhagenaars/typish/archive/1.7.0.tar.gz'
)
sha512sums=(
    SKIP
)

_extracted="$_pkgname-$pkgver/"

check() {
    :
}

package() {
    pip install --no-deps --root "${pkgdir}" --compile "$srcdir/$_extracted"
}

