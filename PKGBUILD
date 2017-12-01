# Maintainer: Adam Schubert <adam.schubert@sg1-game.net>

pkgname=python-flask-celery-helper
pkgver=1.1.0
pkgdesc="The navigation of Flask application."
pkgrel=1
arch=('any')
license=('MIT')
url='https://github.com/Robpol86/Flask-Celery-Helper'
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/Robpol86/Flask-Celery-Helper/tar.gz/v$pkgver)
sha256sums=('e29aa626d0e0dec1b02026710c41e1422e1791ab17da751784b833cedf8ebfe6')
makedepends=('python-setuptools')
depends=(
    'python-celery'
    'python-flask'
)

package() {
  cd "${srcdir}/Flask-Celery-Helper-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
