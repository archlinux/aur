# Maintainer: Laszlo Papp <lpapp@kde.org>

pkgname=python2-flask-migrate
pkgver=1.8.0
pkgrel=1
pkgdesc="SQLAlchemy database migrations for Flask applications using Alembic"
arch=('any')
url="https://pypi.python.org/pypi/Flask-Migrate"
license=('MIT')
depends=('python2-flask' 'python2-alembic')
optdepends=('python2-nose')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/F/Flask-Migrate/Flask-Migrate-${pkgver}.tar.gz")
md5sums=('5ca0ebb9ee2b1c29d11268f01d652927')

package() {
    cd $srcdir/Flask-Migrate-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm0664 "${srcdir}/Flask-Migrate-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

