# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=zipstream-ng
pkgname=python-$_pkgname
pkgver=1.7.1
pkgrel=1
pkgdesc="A modern and easy to use streamable zip file generator"
arch=('any')
url="https://github.com/pR0Ps/zipstream-ng"
license=('LGPLv3')
provides=("python-zipstream")
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-zipstream')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7fbf1cf482108a0a6c89879382425aaf6a007e8948352f155c4ca7c6e268bffa')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python ./setup.py install --root="$pkgdir/" --optimize=1
}
