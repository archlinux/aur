# Maintainer: RcrdBrt <riccardobrt@gmail.com>
# Prev maintainer: ser

_pkgname=flask-nav
pkgname=python-flask-nav
pkgver=0.6
pkgrel=1
pkgdesc="Easily create navigation for Flask applications."
arch=('any')
url="http://github.com/mbr/flask-nav"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/mbr/flask-nav/archive/$pkgver.tar.gz")
md5sums=('0d8974af5d82ada4f7764f85f64efa4a')

package() {
depends=('python-flask')

    cd $_pkgname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1

}

