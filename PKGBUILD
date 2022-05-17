# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=zipstream-ng
pkgname=python-$_pkgname
pkgver=1.3.4
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
sha256sums=('080caa6861664de8aaaed73dc8bdb09f197aebf2989899518679dbbe650a27b2'
           )

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python ./setup.py install --root="$pkgdir/" --optimize=1
}
