# Maintainer: Adam Schubert <adam.schubert@sg1-game.net>

pkgname=python-flask-redis-helper
pkgver=1.0.0
pkgdesc="Redis support for Flask without breaking PyCharm inspections."
pkgrel=1
arch=('any')
license=('MIT')
url='https://github.com/Robpol86/Flask-Redis-Helper'
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/Robpol86/Flask-Redis-Helper/tar.gz/v$pkgver)
sha256sums=('7ea88c1e40013cb34d9f62562754f9885c61ded522521dfdb7350831351a5fed')
makedepends=('python-setuptools')
depends=(
    'python-redis'
    'python-flask'
)

package() {
  cd "${srcdir}/Flask-Redis-Helper-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
