# Maintainer: Zanny <lordzanny@gmail.com>
# First Linux Arch packager: Serge Victor <arch@random.re>

pkgname=('python-flask-bootstrap')
pkgver=3.3.7.0
pkgrel=1
pkgdesc="Ready-to-use Twitter-bootstrap for use in Flask."
arch=('any')
url="https://github.com/mbr/flask-bootstrap"
license=('Apache')
depends=('python-flask' 'python-visitor' 'python-dominate')
makedepends=('python-setuptools')
source=("https://github.com/mbr/flask-bootstrap/archive/$pkgver.tar.gz")
md5sums=('e2e3d5962e6a45dd724917b52560dae8')

package() {
    cd "flask-bootstrap-$pkgver"
    python setup.py install --root="$pkgdir"
}
