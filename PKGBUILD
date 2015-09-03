# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gitfs
pkgver=0.3.3
pkgrel=3
pkgdesc="Version controlled file system"
arch=('any')
url="http://www.presslabs.com/gitfs/"
license=('Apache')
depends=('python2-atomiclong' 'python2-fusepy' 'python2-pygit2')
makedepends=('python2-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/PressLabs/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('58ee180f8b3e09dfd74d29c50a5d64234b0ce07794e013638de46cf4084ae2a8')

package() {
  cd $pkgname-$pkgver

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
