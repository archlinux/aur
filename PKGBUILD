# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=seafobj
pkgname=python-$_pkgname
pkgver=9.0.5
pkgrel=1
pkgdesc="Python library for accessing seafile data model"
arch=('any')
url="https://github.com/haiwen/seafobj"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}-server.tar.gz"
       "setup.py")
sha256sums=('f1fcaa91ab07dd54cbd22e89036fca6e7c34965cd46f73759936d5a97bfa6394'
            'ae96161ef4088794a2d2e88f64eb9ab57346e7b36cacab662eb13e75b58adf84'
           )

package() {
    cd "$srcdir/$_pkgname-$pkgver-server"
    python ../setup.py install --root="$pkgdir/" --optimize=1
}
