# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=seafobj
pkgname=python-$_pkgname
pkgver=9.0.9
pkgrel=1
pkgdesc="Python library for accessing seafile data model"
arch=('any')
url="https://github.com/haiwen/seafobj"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}-server.tar.gz"
       "setup.py")
sha256sums=('a5e8c7b098c14812b68be41e29df39ea57489afe169a41197c9bf3ac0b56030c'
            '9467ce43edd28e0b2235b5323ee3a60f463906453fdb42cb28ed2c89025aaa1c')

package() {
    cd "$srcdir/$_pkgname-$pkgver-server"
    python ../setup.py install --root="$pkgdir/" --optimize=1
}
