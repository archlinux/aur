# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=zipstream-ng
pkgname=python-$_pkgname
pkgver=1.6.0
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
sha256sums=('efc2ed98d176437c8c61a8db9c77a4afd1027fd8d13f5fe1a34ea4d8c2fa724d')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python ./setup.py install --root="$pkgdir/" --optimize=1
}
