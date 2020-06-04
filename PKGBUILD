# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-isort
pkgname=python-$_pkgname

pkgver=3.0.0
pkgrel=1
pkgdesc="flake8 plugin to validate annotations complexity"

url='https://github.com/gforcada/flake8-isort'
arch=('any')
license=('GPLv3')

depends=('python' 'python-testfixtures' 'python-isort')

source=("https://github.com/gforcada/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('bdd72c69368fd6c76e6a1c23bb71178dba03ea851dfe9d4df3dbf65a44a7c0623604e6a125dd2010c054d7f470fea9114d2a28d2bd6ac0cb48d370086dd08eb8')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

