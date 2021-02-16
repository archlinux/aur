# Maintainer: gmes78 <joaquim dot monteiro at protonmail dot com>

pkgname=python-python_socks
pkgver=1.2.1
pkgrel=1
pkgdesc="Core proxy client (SOCKS4, SOCKS5, HTTP) functionality for Python"
arch=('any')
url="https://github.com/romis2012/python-socks"
license=('Apache')

depends=('python')
makedepends=('python-setuptools')

source=("python-socks-${pkgver}.tar.gz::https://github.com/romis2012/python-socks/archive/v${pkgver}.tar.gz")
sha512sums=('8ecc35c51096b1c0312895dcc1169b7f475709f5bdd81572257257cb6bdca00ebcbe9e6b211c66b26ec2dec4dd86051077b7b30279174585428dca0fa7098403')
package() {
    cd "python-socks-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
