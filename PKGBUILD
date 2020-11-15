# Maintainer: gmes78 <joaquim dot monteiro at protonmail dot com>

pkgname=python-python_socks
pkgver=1.1.0
pkgrel=1
pkgdesc="Core proxy client (SOCKS4, SOCKS5, HTTP) functionality for Python"
arch=('any')
url="https://github.com/romis2012/python-socks"
license=('Apache')

depends=('python')
makedepends=('python-setuptools')

source=("python-socks-${pkgver}.tar.gz::https://github.com/romis2012/python-socks/archive/v${pkgver}.tar.gz")
sha512sums=('e38594815e5f943f810862dfe5d07a802601e41e879f68b4fa70c8087be0387a91e99e1b0578f2819557832b5e53be9773043a9617c72017c41e9377c4f35ef1')

package() {
    cd "python-socks-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
