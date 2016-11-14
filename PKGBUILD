# Maintainer: Fabrizio Lungo <aur@flungo.me>
# Contributor: warddr <aur@warddr.eu>

pkgname=python2-flask-principal
pkgver=0.4.0
pkgrel=1
pkgdesc="Identity management for flask."
arch=(any)
url="http://pypi.python.org/pypi/Flask-Principal"
license=("MIT")
depends=("python2" "python2-flask")
makedepends=("python2-setuptools")
source=("http://pypi.python.org/packages/source/F/Flask-Principal/Flask-Principal-$pkgver.tar.gz")
md5sums=("462d1345c9ddaddbec33a743e5821e2c")

package_python2-flask-principal() {
    cd $srcdir/Flask-Principal-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
