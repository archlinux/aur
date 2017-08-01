# Maintainer: Jan Buchar <Teyras@gmail.com>
pkgname=nvidia-docker-compose
pkgver=0.1.3
pkgrel=2
pkgdesc="GPU enabled docker-compose wrapper"
arch=("any")
url="https://github.com/eywalker/nvidia-docker-compose"
license=()
groups=()
depends=('python', 'docker-compose', 'python-yaml', 'python-jinja')
makedepends=('python-setuptools')
source=("https://github.com/eywalker/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('becddafeb537c3956407a8ee2911d4c6')

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}/"
}
