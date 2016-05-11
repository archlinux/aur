# Maintainer: Laszlo Papp <lpapp@kde.org>

pkgname=python2-flask-pagedown
pkgver=0.2.1
pkgrel=1
pkgdesc="Implementation of StackOverflow's PageDown markdown editor for Flask-WTF."
arch=('any')
url="https://pypi.python.org/pypi/Flask-PageDown"
license=('MIT')
depends=('python2-flask' 'markdown')
optdepends=('python2-nose')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/F/Flask-PageDown/Flask-PageDown-${pkgver}.tar.gz")
md5sums=('a7e83929daecb3c5d9e9ec153f827f6a')

package() {
    cd $srcdir/Flask-PageDown-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}

