# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=zipstream-ng
pkgname=python-$_pkgname
pkgver=1.7.0
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
sha256sums=('50d870ec52f9cace47f47cd61b9d7b65d4fd9dbd4e4e8ac13af1cfc90db9e0f0')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python ./setup.py install --root="$pkgdir/" --optimize=1
}
