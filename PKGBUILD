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
    'python-pip'
    # 'python-wheel'
)

checkdepends=(
    'python-numpy'
    # 'python-nptyping>=1.1.0'
    'python-pycodestyle'
    'python-pylint'
    'mypy'
    'python-pytest'
    'python-coverage'
    # 'python-codecov'
)

source=(
    'https://github.com/ramonhagenaars/typish/archive/1.7.0.tar.gz'
)
sha512sums=('cf8dae1d556fd1de430904e96a97c8f1f777ffebf1b9796ffb1c50e01aef5eec683c5b1b80c9b1394284b5e8c47a9d8c48193596ccb57d4f1df141f673053ba6')

_extracted="$_pkgname-$pkgver/"

check() {
    :
}

package() {
    pip install --no-deps --root "${pkgdir}" --compile "$srcdir/$_extracted"
}

