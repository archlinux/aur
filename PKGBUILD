# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=zipstream-ng
pkgname=python-$_pkgname
pkgver=1.5.0
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
sha256sums=('322da76042b37a37a737a7521dc473034862f47a73034e0534b75a885d984a86')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python ./setup.py install --root="$pkgdir/" --optimize=1
}
