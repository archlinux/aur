# Maintainer: gmes78 <joaquim dot monteiro at protonmail dot com>

pkgname=python-python_socks
pkgver=1.2.2
pkgrel=1
pkgdesc="Core proxy client (SOCKS4, SOCKS5, HTTP) functionality for Python"
arch=('any')
url="https://github.com/romis2012/python-socks"
license=('Apache')

depends=('python')
makedepends=('python-setuptools')

source=("python-socks-${pkgver}.tar.gz::https://github.com/romis2012/python-socks/archive/v${pkgver}.tar.gz")
sha512sums=('27af2da348396e0bd5f6120de7bbb9b89533d3481bb1cbb72668aa28afaa84026fefbd4601b8fd0129d8f5add95b8e00d840d1298eb96b151091f2f64d92dd2f')

package() {
    cd "python-socks-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
