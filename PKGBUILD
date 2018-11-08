# Maintainer: Travis Jacobs <traviswjacobs@gmail.com>
pkgname=vyper
pkgver=0.1.0_beta.4
_vername=0.1.0-beta.4
pkgrel=1
pkgdesc="Pythonic Smart Contract Language for the EVM"
arch=('x86_64')
url="https://github.com/ethereum/vyper"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/ethereum/$pkgname/archive/v$_vername.tar.gz")
md5sums=('d74171e4ed78a1482320f3a8158e5eaa')

package() {
    cd "$pkgname-$_vername"
    python setup.py install --root="$pkgdir/" --optimize=1
}
