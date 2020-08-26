# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-isort
pkgname=python-$_pkgname

pkgver=4.0.0
pkgrel=1
pkgdesc="flake8 plugin to validate annotations complexity"

url='https://github.com/gforcada/flake8-isort'
arch=('any')
license=('GPLv3')

depends=('python' 'python-testfixtures' 'python-isort')

source=("https://github.com/gforcada/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('4c6b8301d17fdd97fbdfda0f26b2d6f2af95a2ff427c6c3d48da9607bb82c16a54ea8ab622147378cd9b3432c1ef56d23843c8e17329cdc2d6703a323289f50b')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

