# Maintainer: gmes78 <joaquim dot monteiro at protonmail dot com>

pkgname=python-python_socks
pkgver=1.2.4
pkgrel=1
pkgdesc="Core proxy client (SOCKS4, SOCKS5, HTTP) functionality for Python"
arch=('any')
url="https://github.com/romis2012/python-socks"
license=('Apache')

depends=('python')
makedepends=('python-setuptools')

source=("python-socks-${pkgver}.tar.gz::https://github.com/romis2012/python-socks/archive/v${pkgver}.tar.gz")
sha512sums=('6e70d8d98b2901e97250d30b350002944d979356bb6cd7dd4022af420e166076259a7b1aa4845d771243b18ab3f06ee955f07482c527835bb0135f0622d804be')

package() {
    cd "python-socks-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
