# Maintainer: Laszlo Papp <lpapp@kde.org>

pkgname=python2-flask-sslify
pkgver=0.1.5
pkgrel=1
pkgdesc="Force SSL on your Flask app."
arch=('any')
url="https://pypi.python.org/pypi/Flask-SSLify"
license=('BSD')
depends=('python2-flask')
optdepends=('python2-nose')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/F/Flask-SSLify/Flask-SSLify-${pkgver}.tar.gz")
md5sums=('1282f5af7d621a32130296ad8dd6a70c')

package() {
    cd $srcdir/Flask-SSLify-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}

