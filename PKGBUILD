# Maintainer: Daniel Fernandez Rodriguez <gmail.com daferoes>
# Based on code from crystaly <crystaly [ at ] posteo [ dot ] de> and Zanny <lordzanny@gmail.com>
# First Linux Arch packager: Serge Victor <arch@random.re>

pkgname=python2-flask-bootstrap
pkgver=3.3.7.0
pkgrel=1
pkgdesc="Ready-to-use Twitter-bootstrap for use in Flask."
arch=('any')
url="https://github.com/mbr/flask-bootstrap"
license=('Apache')
depends=('python2-setuptools' 'python2-flask' 'python2-visitor' 'python2-dominate')
makedepends=('git' 'python2-setuptools')
source=("https://github.com/mbr/flask-bootstrap/archive/$pkgver.tar.gz")
md5sums=('f46d7e27798bd9678ba8d155a8491bb2')

build() {
    cd $srcdir/flask-bootstrap-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/flask-bootstrap-$pkgver
    python2 setup.py install --root="$pkgdir"
}
