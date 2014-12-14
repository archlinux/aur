# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gitfs
pkgver=0.2.5
pkgrel=2
pkgdesc="Version controlled file system"
arch=('any')
url="http://www.presslabs.com/gitfs/"
license=('Apache')
depends=('python' 'fuse')
makedepends=('python-setuptools')
source=(http://github.com/PressLabs/$pkgname/archive/$pkgver.tar.gz)
sha1sums=('a54056c1ba4095daae63e3a6e3c2505943691a34')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="${pkgdir}"
}
