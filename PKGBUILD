# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gitfs
pkgver=0.3
pkgrel=1
pkgdesc="Version controlled file system"
arch=('any')
url="http://www.presslabs.com/gitfs/"
license=('Apache')
depends=('python' 'fuse')
makedepends=('python-setuptools')
source=(http://github.com/PressLabs/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('2747bb79d4dfd9e41d9e8f309189a0f80905050253f0863f2c748b01c6c38526')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="${pkgdir}"
}
