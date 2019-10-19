# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gitfs
pkgver=0.5.1
pkgrel=1
pkgdesc="Version controlled file system"
arch=('any')
url="http://www.presslabs.com/gitfs/"
license=('Apache')
depends=('python-atomiclong' 'python-fusepy' 'python-pygit2' 'python-raven')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/PressLabs/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('7b81970847b0958707e1d7a403a417d888a56888d89a12cfbc52d4f6f3085d8e')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1
}
