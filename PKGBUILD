# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=seafobj
pkgname=python-$_pkgname
pkgver=8.0.7
pkgrel=1
pkgdesc="Python library for accessing seafile data model"
arch=('any')
url="https://github.com/haiwen/seafobj"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}-server.tar.gz"
       "setup.py")
sha256sums=('357fbdbd703856ea01dbcddaa8893740d6908da3a75f52dfc8629bedd081fd59'
            '6256eb20f06fbd1f2146c7fead0d9f30b1b7ede32bccf087bc7a9c2f1f72dbcf'
           )

package() {
    cd "$srcdir/$_pkgname-$pkgver-server"
    python ../setup.py install --root="$pkgdir/" --optimize=1
}
