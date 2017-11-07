# Maintainer: Adam Schubert <adam.schubert@sg1-game.net>

pkgname=python-flask-navigation
pkgver=0.2.0
pkgdesc="The navigation of Flask application."
pkgrel=1
arch=('any')
license=('MIT')
url='https://gitlab.salamek.cz/sadam/granad-rs232'
source=('python-flask-navigation::git+https://github.com/tonyseek/flask-navigation.git')
md5sums=('SKIP')
makedepends=('python-setuptools')
depends=(
    'python'
    'python-blinker'
    'python-flask'
)

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
