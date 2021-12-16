# Maintainer: AngrySoft - Sebastian Zwierzchowski

_pkgbase=amqpstorm
pkgname=python-$_pkgbase
pkgver=3.0.0
pkgrel=2
pkgdesc="Thread-safe Python RabbitMQ Client & Management library."
arch=('any')
url="https://www.amqpstorm.io/"
license=('MIT License')
depends=('python' 'python-pamqp')
makedepends=('python-setuptools')
# source=("https://github.com/eandersson/amqpstorm/archive/refs/tags/${pkgver}.zip")
source=("https://github.com/eandersson/amqpstorm/archive/refs/heads/main.zip")

build() {
  # cd "$srcdir/$_pkgbase-$pkgver"
  cd "$srcdir/$_pkgbase-main"
  python setup.py build
}

package() {
  # cd "$srcdir/$_pkgbase-$pkgver"
  cd "$srcdir/$_pkgbase-main"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
sha256sums=('SKIP')
