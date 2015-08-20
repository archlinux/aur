# Maintainer: Fabrizio Lungo <aur@flungo.me>
# Contributor: warddr <aur@warddr.eu>

pkgname=python2-flask-principal
pkgver=0.3.5
pkgrel=1
pkgdesc="Identity management for flask."
arch=(any)
url="http://pypi.python.org/pypi/Flask-Principal"
license=("MIT")
depends=("python2" "python2-flask")
makedepends=("setuptools")
source=("http://pypi.python.org/packages/source/F/Flask-Principal/Flask-Principal-$pkgver.tar.gz")
md5sums=("8251576d89720119d23a4407c4ce8dc8")

package_python2-flask-principal() {
    cd $srcdir/Flask-Principal-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
