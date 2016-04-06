# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gitfs
pkgver=0.4.1
pkgrel=1
pkgdesc="Version controlled file system"
arch=('any')
url="http://www.presslabs.com/gitfs/"
license=('Apache')
depends=('python-atomiclong' 'python-fusepy' 'python-pygit2>=0.24.0')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/PressLabs/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('70615eddbaa1ca3a7fb92fcf11b437cca29c40132eb0836559840e554e66b14b')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1
}
