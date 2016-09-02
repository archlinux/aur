# Maintainer: Adam Schubert <adam.schubert@sg1-game.net>

pkgname=python-cron-descriptor
projname=cron-descriptor
pkgver=1.2.5
pkgrel=1
pkgdesc="A Python library that converts cron expressions into human readable strings."
arch=('any')
license=('MIT')
url='https://github.com/Salamek/cron-descriptor'
depends=('python')
makedepends=()
source=("https://github.com/Salamek/cron-descriptor/archive/$pkgver.tar.gz")
noextract=()
md5sums=('8d4244c74bf6ce31c08432bcb13eea09')

package() {
  cd "$srcdir/$projname-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}
