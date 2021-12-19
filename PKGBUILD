# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=seafobj
pkgname=python-$_pkgname
pkgver=9.0.2
pkgrel=1
pkgdesc="Python library for accessing seafile data model"
arch=('any')
url="https://github.com/haiwen/seafobj"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}-server.tar.gz"
       "setup.py")
sha256sums=('2272550e21724d013d54ad2fb40e366ea0781f86f2e85e5b7bedd061b70150b5'
            'c60d03876b0725ee3e2bb156bdd7c7cd43f05f8e61365b15a6dd733fef7eba5c'
           )

package() {
    cd "$srcdir/$_pkgname-$pkgver-server"
    python ../setup.py install --root="$pkgdir/" --optimize=1
}
