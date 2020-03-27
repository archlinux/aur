# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jan Buchar <Teyras@gmail.com>
pkgname=nvidia-docker-compose
pkgver=0.1.6
pkgrel=1
pkgdesc="GPU enabled docker-compose wrapper"
arch=("any")
url="https://github.com/eywalker/nvidia-docker-compose"
license=()
groups=()
depends=('python' 'docker-compose' 'python-yaml' 'python-jinja')
makedepends=('python-setuptools')
source=("https://github.com/eywalker/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('c282b388308e2d1966a0e17bcb3b5889')

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}/"
}
