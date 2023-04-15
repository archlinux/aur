# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=seafobj
pkgname=python-$_pkgname
pkgver=10.0.1
pkgrel=1
pkgdesc="Python library for accessing seafile data model"
arch=('any')
url="https://github.com/haiwen/seafobj"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}-server.tar.gz"
       "setup.py")
sha256sums=('c50864ecf475299b04cbf55dc8572d60eb3a436bc4ab7d27edbcc97a1eaad02a'
            '5abcaf867b1bb62f7ff9fb7e612a73e950e494b758add44398a7adb0b7f68805')

package() {
    cd "$srcdir/$_pkgname-$pkgver-server"
    python ../setup.py install --root="$pkgdir/" --optimize=1
}
