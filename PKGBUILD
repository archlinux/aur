# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python-odorik
pkgver=0.4
pkgrel=1
pkgdesc="Python module and command line utility to interact with Odorik API"
arch=('any')
url="http://cihar.com/software/odorik/"
license=('GPL3')
depends=('python-xdg' 'python-dateutil')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/nijel/odorik/archive/$pkgver.tar.gz)
md5sums=('94abcf9425b224e9b8b1794487db21d5')

package() {
  cd "${srcdir}"/odorik-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1
}
