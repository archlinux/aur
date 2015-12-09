# Maintainer: renek <aur@spaceshore.net>
_pkgname=aiosasl
pkgname=python-${_pkgname}
pkgver=0.1
pkgrel=1
pkgdesc="Pure-python, protocol-agnostic SASL implementation for asyncio"
arch=('any')
url="https://github.com/horazont/aiosasl"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('212cf60d6d5fea7fc4a6c292b9ef0eb66e179c86cd6f27f64c222df30114280e3fd2faedf464e57accd578224e53ada8b6e5c4b2b752d3beffafc9a9cd2c5b31')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
