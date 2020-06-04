# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-executable
pkgname=python-$_pkgname

pkgver=2.0.3
pkgrel=1
pkgdesc="A Flake8 plugin for checking executable permissions and shebangs."

url='https://github.com/xuhdev/flake8-executable'
arch=('any')
license=('GPLv3')

depends=('python')

source=("https://github.com/xuhdev/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('ff2f6911752e3d0cdddb1df59cd5ce93ec6d0ee387fb6880d5a9f87ff6edecadd86a920db787ddeb0cc878a08bea725a39c3e45d35a343472297cd34a547fdbe')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

