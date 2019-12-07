# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gitfs
pkgver=0.5.2
pkgrel=1
pkgdesc="Version controlled file system"
arch=('any')
url="http://www.presslabs.com/gitfs/"
license=('Apache')
depends=('python-atomiclong' 'python-fusepy' 'python-pygit2' 'python-raven')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/PressLabs/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('921e24311e3b8ea3a5448d698a11a747618ee8dd62d5d43a85801de0b111cbf3')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1
}
