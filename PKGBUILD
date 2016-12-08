# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gitfs
pkgver=0.4.5.1
pkgrel=1
pkgdesc="Version controlled file system"
arch=('any')
url="http://www.presslabs.com/gitfs/"
license=('Apache')
depends=('python-atomiclong' 'python-fusepy' 'python-pygit2>=0.24.0')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/PressLabs/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('6049fd81182d9172e861d922f3e2660f76366f85f47f4c2357f769d24642381c')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1
}
