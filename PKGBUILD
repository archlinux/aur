# Maintainer: gmes78 <joaquim dot monteiro at protonmail dot com>

pkgname=python-python_socks
pkgver=1.2.3
pkgrel=1
pkgdesc="Core proxy client (SOCKS4, SOCKS5, HTTP) functionality for Python"
arch=('any')
url="https://github.com/romis2012/python-socks"
license=('Apache')

depends=('python')
makedepends=('python-setuptools')

source=("python-socks-${pkgver}.tar.gz::https://github.com/romis2012/python-socks/archive/v${pkgver}.tar.gz")
sha512sums=('1878d7f835a6c97b2577d226363a1f82c8ee4f0fe12931987f7712be98f985e67dce6eee2af8e901756e9bbdd8c667032d7ca37bfa57123c542f8252612dd605')

package() {
    cd "python-socks-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
