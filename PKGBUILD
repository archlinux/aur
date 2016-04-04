# Maintainer: Zanny <lordzanny@gmail.com>
# First Linux Arch packager: Serge Victor <arch@random.re>

pkgname=('python-flask-bootstrap')
pkgver=3.3.5.7
pkgrel=1
pkgdesc="Ready-to-use Twitter-bootstrap for use in Flask."
arch=('any')
url="https://github.com/mbr/flask-bootstrap"
license=('Apache')
depends=('python-flask' 'python-visitor' 'python-dominate')
makedepends=('python-setuptools')
source=("https://github.com/mbr/flask-bootstrap/archive/$pkgver.tar.gz")
md5sums=('5c58de16b7a76f732e4d14d70b0d5cb8')

package() {
    cd "flask-bootstrap-$pkgver"
    python setup.py install --root="$pkgdir"
}
